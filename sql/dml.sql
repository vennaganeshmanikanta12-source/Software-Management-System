INSERT INTO Employee
(employee_id, first_name, last_name, designation, email,
 experience_years, salary)
VALUES

(1, 'Rahul', 'Kumar', 'Project Manager',
 'rahul.kumar@company.com', 8, 85000.00),

(2, 'Priya', 'Sharma', 'Software Developer',
 'priya.sharma@company.com', 4, 65000.00),

(3, 'Arjun', 'Reddy', 'Senior Developer',
 'arjun.reddy@company.com', 6, 75000.00),

(4, 'Sneha', 'Patel', 'UI/UX Designer',
 'sneha.patel@company.com', 3, 55000.00),

(5, 'Vikram', 'Singh', 'QA Engineer',
 'vikram.singh@company.com', 5, 60000.00),

(6, 'Ananya', 'Rao', 'Software Developer',
 'ananya.rao@company.com', 2, 48000.00),

(7, 'Kiran', 'Reddy', 'DevOps Engineer',
 'kiran.reddy@company.com', 5, 70000.00),

(8, 'Meera', 'Nair', 'Business Analyst',
 'meera.nair@company.com', 4, 62000.00);

INSERT INTO Project
(project_id, project_name, description,
 start_date, end_date, status, manager_id)
VALUES

(
    1,
    'E-Commerce Platform',
    'Online shopping platform with product catalog, cart and payment system.',
    '2026-01-10',
    '2026-06-30',
    'In Progress',
    1
),

(
    2,
    'HR Management System',
    'System for employee registration, attendance and leave management.',
    '2026-02-01',
    '2026-07-31',
    'In Progress',
    1
),

(
	3,
    'Mobile Banking App',
    'Mobile banking application with secure authentication and transactions.',
    '2026-03-15',
    '2026-09-30',
    'Planning',
    1
),

(
    4,
    'AI Analytics Platform',
    'Platform for data analysis, visualization and AI-powered insights.',
    '2026-04-01',
    '2026-10-31',
    'Planning',
    1
);

INSERT INTO Team
(team_id, team_name, project_id, lead_id)
VALUES

(1, 'Frontend Team', 1, 4),

(2, 'Backend Team', 1, 3),

(3, 'HR Development Team', 2, 2),

(4, 'Mobile Development Team', 3, 6),

(5, 'Analytics Team', 4, 7);

INSERT INTO Sprint
(sprint_id, sprint_name, project_id,
 start_date, end_date, goal, status)
VALUES

(
    1,
    'Sprint 1',
    1,
    '2026-01-10',
    '2026-01-24',
    'Setup project and design database',
    'Completed'
),

(
    2,
    'Sprint 2',
    1,
    '2026-01-25',
    '2026-02-15',
    'Develop product catalog and authentication',
    'Completed'
),

(
    3,
    'Sprint 3',
    1,
    '2026-02-16',
    '2026-03-10',
    'Develop shopping cart and payment system',
    'Active'
),

(
    4,
    'Sprint 1',
    2,
    '2026-02-01',
    '2026-02-20',
    'Employee module development',
    'Completed'
),

(
    5,
    'Sprint 2',
    2,
    '2026-02-21',
    '2026-03-15',
    'Attendance and leave management',
    'Active'
),

(
    6,
    'Sprint 1',
    3,
    '2026-03-15',
    '2026-04-05',
    'Mobile application design and authentication',
    'Planned'
);

INSERT INTO Team_Member
(team_id, employee_id, joined_date)
VALUES

(1, 4, '2026-01-10'),
(1, 6, '2026-01-12'),

(2, 3, '2026-01-10'),
(2, 7, '2026-01-15'),

(3, 2, '2026-02-01'),
(3, 5, '2026-02-02'),

(4, 6, '2026-03-15'),
(4, 3, '2026-03-16'),

(5, 7, '2026-04-01'),
(5, 8, '2026-04-02');

INSERT INTO Task
(task_id, sprint_id, assigned_to, task_title,
 description, priority, story_points, status,
 due_date, completion_date)
VALUES

(
    1,
    1,
    3,
    'Design Database',
    'Design database structure for the e-commerce platform.',
    'High',
    5,
    'Completed',
    '2026-01-18',
    '2026-01-17'
),

(
    2,
    2,
    2,
    'Develop Login Module',
    'Develop secure login and authentication module.',
    'High',
    8,
    'Completed',
    '2026-02-05',
    '2026-02-04'
),

(
    3,
    2,
    6,
    'Product Catalog',
    'Develop product listing and product details functionality.',
    'Medium',
    8,
    'Completed',
    '2026-02-10',
    '2026-02-09'
),

(
    4,
    3,
    3,
    'Payment Gateway',
    'Integrate payment gateway with the shopping platform.',
    'High',
    13,
    'In Progress',
    '2026-03-05',
    NULL
),

(
    5,
    3,
    4,
    'Shopping Cart UI',
    'Design and implement shopping cart interface.',
    'Medium',
    5,
    'In Progress',
    '2026-03-01',
    NULL
),

(
    6,
    4,
    2,
    'Employee Registration',
    'Develop employee registration module.',
    'High',
    8,
    'Completed',
    '2026-02-15',
    '2026-02-14'
),

(
    7,
    5,
    5,
    'Attendance Module',
    'Develop employee attendance management module.',
    'Medium',
    8,
    'In Progress',
    '2026-03-10',
    NULL
),

(
    8,
    6,
    6,
    'Mobile Login Screen',
    'Create mobile application login interface.',
    'High',
    5,
    'Todo',
    '2026-03-25',
    NULL
);

INSERT INTO Bug
(bug_id, task_id, reported_by, assigned_to,
 title, severity, status, reported_date, resolved_date)
VALUES

(
    1,
    2,
    5,
    2,
    'Invalid Login Error',
    'High',
    'Resolved',
    '2026-02-06',
    '2026-02-07'
),

(
    2,
    3,
    5,
    6,
    'Product Image Not Loading',
    'Medium',
    'Open',
    '2026-02-12',
    NULL
),

(
    3,
    4,
    5,
    3,
    'Payment Transaction Failure',
    'Critical',
    'Open',
    '2026-02-25',
    NULL
),

(
    4,
    5,
    5,
    4,
    'Cart Quantity Issue',
    'Medium',
    'In Progress',
    '2026-02-27',
    NULL
),

(
    5,
    7,
    5,
    2,
    'Attendance Calculation Error',
    'High',
    'Open',
    '2026-03-05',
    NULL
);

INSERT INTO Client
(client_id, project_id, name, email,
 contract_start, contract_end, sla_hours)
VALUES

(
    1,
    1,
    'TechWorld Solutions',
    'contact@techworld.com',
    '2026-01-10',
    '2026-12-31',
    24
),

(
    2,
    2,
    'Global HR Services',
    'contact@globalhr.com',
    '2026-02-01',
    '2026-12-31',
    12
),

(
    3,
    3,
    'FinServe Technologies',
    'contact@finserve.com',
    '2026-03-15',
    '2026-12-31',
    8
),

(
    4,
    4,
    'DataVision Analytics',
    'contact@datavision.com',
    '2026-04-01',
    '2026-12-31',
    12
);
