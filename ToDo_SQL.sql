-- =============================================
-- COMPLETE DATABASE SETUP FOR TO-DO LIST APP
-- =============================================

-- 1. Create the database (if not exists)
CREATE DATABASE IF NOT EXISTS tododb;

-- 2. Use this database
USE tododb;

-- 3. Drop existing tables if they exist (clean setup)
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS users;

-- 4. Create users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Create tasks table (linked to users)
CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    task VARCHAR(255) NOT NULL,
    status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 6. Verify tables are created
SHOW TABLES;

-- 7. Check users table structure
DESCRIBE users;

-- 8. Check tasks table structure
DESCRIBE tasks;

-- 9. Insert a sample user (optional - for testing)
-- Password is 'test123' in plain text
INSERT INTO users (username, email, password) 
VALUES ('testuser', 'test@example.com', 'test123')
ON DUPLICATE KEY UPDATE username = username;

-- 10. Insert a sample task for the test user (user_id = 1)
INSERT INTO tasks (user_id, task, status) 
VALUES (1, 'Complete my To-Do List app', 'Pending')
ON DUPLICATE KEY UPDATE task = task;

-- 11. View all users
SELECT * FROM users;

-- 12. View all tasks
SELECT * FROM tasks;

-- 13. View tasks with username (join query)
SELECT tasks.id, users.username, tasks.task, tasks.status, tasks.created_at
FROM tasks
INNER JOIN users ON tasks.user_id = users.id
ORDER BY tasks.id DESC;