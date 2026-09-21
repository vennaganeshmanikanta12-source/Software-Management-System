CREATE TABLE Employee (
    employee_id      INT PRIMARY KEY AUTO_INCREMENT,
    first_name       VARCHAR(50) NOT NULL,
    last_name        VARCHAR(50) NOT NULL,
    designation      VARCHAR(50),
    email            VARCHAR(100) UNIQUE NOT NULL,
    experience_years INT CHECK (experience_years >= 0),
    salary           DECIMAL(10,2)
);


CREATE TABLE Project (
    project_id   INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(150) NOT NULL,
    description  TEXT,
    start_date   DATE,
    end_date     DATE,
    status       VARCHAR(30) DEFAULT 'Planning',
    manager_id   INT,

    FOREIGN KEY (manager_id)
        REFERENCES Employee(employee_id)
);


CREATE TABLE Team (
    team_id    INT PRIMARY KEY AUTO_INCREMENT,
    team_name  VARCHAR(100) NOT NULL,
    project_id INT NOT NULL,
    lead_id    INT,

    FOREIGN KEY (project_id)
        REFERENCES Project(project_id),

    FOREIGN KEY (lead_id)
        REFERENCES Employee(employee_id)
);


CREATE TABLE Sprint (
    sprint_id   INT PRIMARY KEY AUTO_INCREMENT,
    sprint_name VARCHAR(100),
    project_id  INT NOT NULL,
    start_date  DATE,
    end_date    DATE,
    goal        TEXT,
    status      VARCHAR(20) DEFAULT 'Planned',

    FOREIGN KEY (project_id)
        REFERENCES Project(project_id)
);


CREATE TABLE Team_Member (
    team_id     INT NOT NULL,
    employee_id INT NOT NULL,
    joined_date DATE,

    PRIMARY KEY (team_id, employee_id),

    FOREIGN KEY (team_id)
        REFERENCES Team(team_id),

    FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id)
);


CREATE TABLE Task (
    task_id         INT PRIMARY KEY AUTO_INCREMENT,
    sprint_id       INT,
    assigned_to     INT,
    task_title      VARCHAR(200) NOT NULL,
    description     TEXT,
    priority        VARCHAR(20) DEFAULT 'Medium',
    story_points    INT,
    status          VARCHAR(20) DEFAULT 'Todo',
    due_date        DATE,
    completion_date DATE,

    FOREIGN KEY (sprint_id)
        REFERENCES Sprint(sprint_id),

    FOREIGN KEY (assigned_to)
        REFERENCES Employee(employee_id)
);


CREATE TABLE Bug (
    bug_id        INT PRIMARY KEY AUTO_INCREMENT,
    task_id       INT,
    reported_by   INT NOT NULL,
    assigned_to   INT,
    title         VARCHAR(200) NOT NULL,
    severity      VARCHAR(20),
    status        VARCHAR(20) DEFAULT 'Open',
    reported_date DATE DEFAULT (CURRENT_DATE),
    resolved_date DATE,

    FOREIGN KEY (task_id)
        REFERENCES Task(task_id),

    FOREIGN KEY (reported_by)
        REFERENCES Employee(employee_id),

    FOREIGN KEY (assigned_to)
        REFERENCES Employee(employee_id)
);


CREATE TABLE Client (
    client_id      INT PRIMARY KEY AUTO_INCREMENT,
    project_id     INT NOT NULL,
    name           VARCHAR(100) NOT NULL,
    email          VARCHAR(100) NOT NULL,
    contract_start DATE,
    contract_end   DATE,
    sla_hours      INT,

    FOREIGN KEY (project_id)
        REFERENCES Project(project_id)
);