require("dotenv").config();

const express = require("express");
const mysql = require("mysql2/promise");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3000;

const pool = mysql.createPool({
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "root",
  database: process.env.DB_NAME || "Software",
  waitForConnections: true,
  connectionLimit: 10
});

app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

async function db(sql, params = []) {
  const [rows] = await pool.execute(sql, params);
  return rows;
}

app.get("/api/health", async (req, res) => {
  try {
    await db("SELECT 1 AS ok");
    res.json({ connected: true, database: process.env.DB_NAME || "Software" });
  } catch (e) {
    res.status(500).json({ connected: false, error: e.message });
  }
});

app.get("/api/dashboard", async (req, res) => {
  try {
    const [employees, projects, teams, tasks, bugs, activeTasks, openBugs] =
      await Promise.all([
        db("SELECT COUNT(*) AS count FROM Employee"),
        db("SELECT COUNT(*) AS count FROM Project"),
        db("SELECT COUNT(*) AS count FROM Team"),
        db("SELECT COUNT(*) AS count FROM Task"),
        db("SELECT COUNT(*) AS count FROM Bug"),
        db("SELECT COUNT(*) AS count FROM Task WHERE status = 'In Progress'"),
        db("SELECT COUNT(*) AS count FROM Bug WHERE status IN ('Open','In Progress')")
      ]);
    res.json({
      employees: employees[0].count,
      projects: projects[0].count,
      teams: teams[0].count,
      tasks: tasks[0].count,
      bugs: bugs[0].count,
      activeTasks: activeTasks[0].count,
      openBugs: openBugs[0].count
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

const routes = {
  employees: "Employee",
  projects: "Project",
  teams: "Team",
  sprints: "Sprint",
  tasks: "Task",
  bugs: "Bug",
  clients: "Client"
};

for (const [route, table] of Object.entries(routes)) {
  app.get(`/api/${route}`, async (req, res) => {
    try {
      const rows = await db(`SELECT * FROM ${table}`);
      res.json(rows);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
}

app.get("/api/team-members", async (req, res) => {
  try {
    const rows = await db(`
      SELECT tm.team_id, t.team_name, tm.employee_id,
             CONCAT(e.first_name, ' ', e.last_name) AS employee_name, tm.joined_date
      FROM Team_Member tm
      JOIN Team t ON t.team_id = tm.team_id
      JOIN Employee e ON e.employee_id = tm.employee_id
      ORDER BY tm.team_id, tm.employee_id
    `);
    res.json(rows);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

app.listen(PORT, () => {
  console.log(`Software Management System running at http://localhost:${PORT}`);
});