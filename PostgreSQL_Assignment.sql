-- Active: 1729274956860@@127.0.0.1@5432@university_db

-- Here i am creating database
CREATE DATABASE university_db;

-- Creating student table
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    email VARCHAR(250),
    frontend_mark INT,
    backend_mark INT,
     status VARCHAR(50)
);

-- creating courses table
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(250),
    credits INT
);

-- creating enrollment table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE
);


-- insert data into student table
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
    ('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
    ('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
    ('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
    ('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
    ('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
    ('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);


-- insert data into coures
INSERT INTO courses (course_name, credits)
VALUES
    ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3);


-- insert enrolment data 
INSERT INTO enrollment (student_id, course_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);

-- get all data from all table
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;



-- Query 1
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
    ('Abu Hosain', 20, 'abuhosainmin@gmail.com', 60, 58, NULL);


-- Query 2

SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';
 


--  Query 3
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);


-- Query 4
DELETE FROM courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM enrollment
);


-- Query 5 
SELECT student_name
FROM students
ORDER BY student_id
OFFSET 2 LIMIT 2;
