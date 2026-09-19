# Software Management System — MySQL Connected Frontend

This version uses:
- Frontend: HTML + CSS + JavaScript
- Backend/API: Node.js + Express
- Database: MySQL / MySQL Workbench
- Driver: mysql2

## 1. Requirements
Install Node.js (LTS) and MySQL. Your existing database should be named:
software_management_system

## 2. Setup
Open this folder in VS Code, then open Terminal:

npm install

Copy `.env.example` to `.env` and change:
DB_USER
DB_PASSWORD
DB_NAME

For a simple local setup, `DB_NAME=software_management_system`.

## 3. Start
npm start

Open:
http://localhost:3000

The login page checks the MySQL connection. Dashboard numbers and all table pages are loaded from the database through the API.

## 4. Important
A browser should not connect directly to MySQL. The Node.js API is the small backend layer that safely talks to MySQL. The frontend only calls `/api/...`.

## 5. Existing tables expected
Employee, Project, Team, Team_Member, Sprint, Task, Bug, Client
