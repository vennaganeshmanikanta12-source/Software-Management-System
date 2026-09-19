# Software Management System

A database-driven Software Management System designed to manage employees, projects, teams, sprints, tasks, bugs, and clients using a MySQL database with a Node.js and Express backend.

## Technologies Used

* **Database:** MySQL
* **Database Tool:** MySQL Workbench
* **Backend:** Node.js
* **API:** Express.js
* **Database Driver:** mysql2
* **Frontend:** HTML, CSS, JavaScript
* **Development Environment:** Visual Studio Code

## Project Architecture

```text
Frontend
HTML + CSS + JavaScript
        │
        ▼
Node.js + Express API
        │
        ▼
MySQL Database
        │
        ▼
Software
```

The browser communicates with the Node.js/Express API. The API communicates with the MySQL database.

## Database

The project uses a MySQL database named:

```text
Software
```

The database contains the following 8 tables:

1. Employee
2. Project
3. Team
4. Team_Member
5. Sprint
6. Task
7. Bug
8. Client

## Main Relationships

* Employee → Project: Project manager
* Project → Team: Teams working on a project
* Employee → Team: Team lead
* Team ↔ Employee: Many-to-many relationship through `Team_Member`
* Project → Sprint: Sprints belonging to a project
* Sprint → Task: Tasks belonging to a sprint
* Employee → Task: Employee assigned to a task
* Task → Bug: Bugs associated with tasks
* Employee → Bug: Bug reporter and assignee
* Project → Client: Client associated with a project

## Requirements

Install the following before running the project:

* Node.js LTS
* MySQL
* MySQL Workbench
* Visual Studio Code

## Database Setup

Create the MySQL database:

```sql
CREATE DATABASE Software;
```

Select the database:

```sql
USE Software;
```

Create the required 8 tables and insert the required sample data using the project's SQL scripts.

## Backend Setup

Open the project folder in VS Code and open the terminal.

Install the dependencies:

```bash
npm install
```

Create a `.env` file in the project root.

Use the following format:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=YOUR_MYSQL_PASSWORD
DB_NAME=Software
PORT=3000
```

Replace `YOUR_MYSQL_PASSWORD` with your actual MySQL password.

**Do not upload the `.env` file to GitHub.**

The project includes `.env.example` as a template.

## Start the Application

Run:

```bash
npm start
```

The server will start at:

```text
http://localhost:3000
```

Open the URL in your browser.

## API Health Check

To verify that Node.js is successfully connected to MySQL, open:

```text
http://localhost:3000/api/health
```

A successful connection returns information indicating that the database is connected.

## API Endpoints

### Dashboard

```text
GET /api/dashboard
```

Returns summary information such as:

* Number of employees
* Number of projects
* Number of teams
* Number of tasks
* Number of bugs
* Active tasks
* Open bugs

### Employee

```text
GET /api/employees
```

### Project

```text
GET /api/projects
```

### Team

```text
GET /api/teams
```

### Sprint

```text
GET /api/sprints
```

### Task

```text
GET /api/tasks
```

### Bug

```text
GET /api/bugs
```

### Client

```text
GET /api/clients
```

### Team Members

```text
GET /api/team-members
```

## Project Features

* MySQL database integration
* Employee management
* Project management
* Team management
* Sprint management
* Task management
* Bug tracking
* Client management
* Dashboard statistics
* REST API using Express
* Database connectivity verification
* Web-based interface

## Security

Sensitive database credentials are stored in `.env`.

The `.env` file is excluded from Git using `.gitignore`.

`node_modules` is also excluded from Git.

Never commit passwords or other sensitive credentials to the repository.

## Running the Project

The complete flow is:

```text
MySQL Database
      ▲
      │
      │ mysql2
      │
Node.js + Express
      ▲
      │ HTTP / REST API
      │
HTML + CSS + JavaScript
      ▲
      │
   Browser
```

## Project Purpose

The purpose of this project is to demonstrate the design and implementation of a relational database-based Software Management System.

The system organizes software development information into related entities and provides an API and web interface for accessing the stored data.

## Author

**Ganesh Manikanta**

GitHub Repository:

`https://github.com/vennaganeshmanikanta12-source/Software-Management-System`
