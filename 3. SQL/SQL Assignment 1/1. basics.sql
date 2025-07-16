CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;


CREATE TABLE IF NOT EXISTS employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (name, age, department, salary) VALUES
('John Doe', 30, 'HR', 50000.00),
('Jane Smith', 28, 'Marketing', 45000.00),
('David Lee', 35, 'Engineering', 75000.00);

-- 1. Retrieve All Employees
SELECT * FROM employees;

-- 2. Select Specific Columns (Name and Department)
SELECT name, department FROM employees;

-- 3. Find Employees Older than 30
SELECT * FROM employees WHERE age > 30;

-- 4. Find Employees with Salary Greater than 50,000
SELECT * FROM employees WHERE salary > 50000;

-- 5. Select Employees from the HR Department
SELECT * FROM employees WHERE department = 'HR';

-- 6. List Employees Sorted by Name
SELECT * FROM employees ORDER BY name;

-- 7. List Employees Sorted by Age (Oldest First)
SELECT * FROM employees ORDER BY age DESC;

-- 8. Select Employees with Salary Between 45,000 and 80,000
SELECT * FROM employees WHERE salary BETWEEN 45000 AND 80000;

-- 9. Find Employees in the Marketing Department
SELECT * FROM employees WHERE department = 'Marketing';

-- 10. Find Employees Whose Name Starts with 'J'
SELECT * FROM employees WHERE name LIKE 'J%';

-- 11. Count the Total Number of Employees
SELECT COUNT(*) AS total_employees FROM employees;

-- 12. Find the Average Salary of All Employees
SELECT AVG(salary) AS average_salary FROM employees;

-- 13. Find the Maximum Salary
SELECT MAX(salary) AS max_salary FROM employees;

-- 14. Find the Minimum Age of Employees
SELECT MIN(age) AS min_age FROM employees;

-- 15. Count Employees in Each Department
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;

-- 16. Find the Total Salary Paid to All Employees
SELECT SUM(salary) AS total_salary FROM employees;

-- 17. Select Employees with a Salary Less Than 50,000
SELECT * FROM employees WHERE salary < 50000;

-- 18. Select Employees Whose Age is Between 25 and 35
SELECT * FROM employees WHERE age BETWEEN 25 AND 35;

-- 19. List Employees and Their Salary Multiplied by 1.10 (10% Raise)
SELECT name, salary, salary * 1.10 AS increased_salary FROM employees;

-- 20. Select Employees Who Are 30 Years Old or in the Marketing Department
SELECT * FROM employees WHERE age = 30 OR department = 'Marketing';

-- 21. Find the Average Salary in Each Department
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;

-- 22. List the Top 3 Highest Paid Employees
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 23. Find the Department with the Maximum Total Salary
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

-- 24. Find the Oldest Employee
SELECT * FROM employees ORDER BY age DESC LIMIT 1;

-- 25. Find the Youngest Employee
SELECT * FROM employees ORDER BY age ASC LIMIT 1;

-- 26. Find the Top 5 Employees with the Lowest Salary
SELECT * FROM employees ORDER BY salary ASC LIMIT 5;

-- 27. Find the Total Salary of Employees Older than 40
SELECT SUM(salary) AS total_salary FROM employees WHERE age > 40;

-- 28. Find the Average Salary of Employees in the Sales Department
SELECT AVG(salary) AS avg_salary FROM employees WHERE department = 'Sales';

-- 29. Find Employees Who Earn More than the Average Salary
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 30. Find the Total Number of Employees in the HR Department
SELECT COUNT(*) AS total_hr_employees FROM employees WHERE department = 'HR';

-- 31. List the Top 3 Departments with the Most Employees
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 3;

-- 32. Find the Third Highest Salary
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 33. Find Departments with More Than 2 Employees
SELECT department
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 34. Find Departments Where the Total Salary is Greater Than 150,000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 150000;

select * from employees;
-- 35. Find Departments with an Average Employee Age Greater Than 35
SELECT department, AVG(age) AS average_age
FROM employees
GROUP BY department
HAVING average_age > 35;

-- 36. List Employee Names Along with Their Department, Sorted by Salary Descending
SELECT name, department, salary
FROM employees
ORDER BY salary DESC;

-- special query

-- Write a single SQL query which will satisfy the following conditions
select * from employees;

INSERT INTO employees (name, age, department, salary) VALUES
('Alice White', 32, 'HR', 60000.00),
('Bob Brown', 45, 'HR', 70000.00),
('Charlie Black', 29, 'HR', 52000.00),
('Diana Green', 31, 'HR', 62000.00);

select department,sum(salary) as total_salary from employees where salary >40000 group by department having count(name) > 3 and total_salary > 20000 order by total_salary desc;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    class VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT,
    copies_available INT
);

CREATE TABLE if not exists issued_books  (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO students (student_id, name, age, class, email) VALUES
(1, 'John Doe', 20, 'Sophomore', 'john.doe@example.com'),
(2, 'Jane Smith', 22, 'Senior', 'jane.smith@example.com'),
(3, 'David Lee', 19, 'Freshman', 'david.lee@example.com'),
(4, 'Emily Davis', 21, 'Junior', 'emily.davis@example.com'),
(5, 'Michael Scott', 23, 'Senior', 'michael.scott@example.com');

INSERT INTO books (book_id, title, author, genre, publication_year, copies_available) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
(3, '1984', 'George Orwell', 'Dystopian', 1949, 4),
(4, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 2),
(5, 'The Road', 'Cormac McCarthy', 'Post-apocalyptic', 2006, 1);

INSERT INTO issued_books (issue_id, student_id, book_id, issue_date, return_date) VALUES
(1, 1, 2, '2024-10-01', '2024-10-15'),
(2, 3, 1, '2024-09-20', '2024-10-05'),
(3, 4, 4, '2024-09-25', '2024-10-10'),
(4, 2, 3, '2024-10-02', '2024-10-18');

select * from students;
select * from books;
select * from issued_books;

-- easy level

--  1. Fetch all student names and their class
SELECT name, class FROM students;

-- 2. List all books with their titles and authors
SELECT title, author FROM books;

-- 3. Display all records from the issued_books table
SELECT * FROM issued_books;

--  4. Fetch student details where age is greater than 15
SELECT * FROM students WHERE age > 15;

--  5. Count the number of books available in the library
SELECT COUNT(*) AS total_books FROM books;

-- 6. Find books published after the year 2015
SELECT * FROM books WHERE publication_year > 2015;

-- 7. List students whose name starts with the letter 'A'
SELECT * FROM students WHERE name LIKE 'A%';

-- 8. Fetch all genres from the book table without duplicates
SELECT DISTINCT genre FROM books;

-- 9. Display the titles of books with at least 5 copies available
SELECT title FROM books WHERE copies_available >= 5;

-- 10. Show the details of books that were issued after '2023-01-01'
SELECT b.*
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
WHERE ib.issue_date > '2023-01-01';

-- 11. Count the total number of issued books
SELECT COUNT(*) AS total_issued FROM issued_books;

-- 12. Retrieve student details for a specific class (e.g., '10')
SELECT * FROM students WHERE class = '10';

-- 13. Find the email addresses of students aged 18 and above
SELECT email FROM students WHERE age >= 18;

-- 14. Retrieve book titles and their authors ordered by publication year
SELECT title, author FROM books ORDER BY publication_year;

-- 15. List the distinct classes in the student table
SELECT DISTINCT class FROM students;

-- 16. Retrieve the issue date and return date for a particular student ID (e.g., 101)
SELECT issue_date, return_date
FROM issued_books
WHERE student_id = 101;

-- 17. Fetch the oldest published book
SELECT * FROM books
ORDER BY publication_year ASC
LIMIT 1;

-- 18. Find the number of students in each class
SELECT class, COUNT(*) AS total_students
FROM students
GROUP BY class;

-- 19. Display all book details where genre is 'Fiction'
SELECT * FROM books WHERE genre = 'Fiction';

-- 20. Find all students whose age is between 14 and 18
SELECT * FROM students WHERE age BETWEEN 14 AND 18;

-- moderate level

-- 1. Fetch book details for all books issued in the last 30 days
SELECT b.*
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
WHERE ib.issue_date >= CURDATE() - INTERVAL 30 DAY;

-- 2. List students who have never issued a book
SELECT s.*
FROM students s
LEFT JOIN issued_books ib ON s.student_id = ib.student_id
WHERE ib.issue_id IS NULL;

-- 3. Count the number of books issued per student
SELECT s.name, COUNT(ib.issue_id) AS books_issued
FROM students s
LEFT JOIN issued_books ib ON s.student_id = ib.student_id
GROUP BY s.student_id;

-- 4. Fetch the name and email of students who issued a specific book (e.g., book_id = 3)
SELECT s.name, s.email
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
WHERE ib.book_id = 3;

-- 5. Find the most popular book (most issued)
SELECT b.title, COUNT(*) AS times_issued
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
GROUP BY b.book_id
ORDER BY times_issued DESC
LIMIT 1;

-- 6. Fetch books that have never been issued
SELECT b.*
FROM books b
LEFT JOIN issued_books ib ON b.book_id = ib.book_id
WHERE ib.book_id IS NULL;

-- 7. Display students along with the titles of books they have issued
SELECT s.name, b.title
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
JOIN books b ON ib.book_id = b.book_id;

-- 8. Find books that have been issued but not yet returned
SELECT b.*
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
WHERE ib.return_date > CURDATE();

-- 9. Retrieve the latest book issued by each student
SELECT s.name, b.title, ib.issue_date
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
JOIN books b ON ib.book_id = b.book_id
WHERE (ib.issue_date) IN (
    SELECT MAX(issue_date)
    FROM issued_books
    GROUP BY student_id
);

-- 10. Get the total number of copies available for each genre
SELECT genre, SUM(copies_available) AS total_copies
FROM books
GROUP BY genre;

-- 11. List students who have issued more than two books
SELECT s.name, COUNT(ib.issue_id) AS books_issued
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
GROUP BY s.student_id
HAVING COUNT(ib.issue_id) > 2;

-- 12. Fetch the details of the most recent book issued
SELECT b.*, ib.issue_date
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
ORDER BY ib.issue_date DESC
LIMIT 1;

-- 13. Find books authored by more than one author (Assuming a book could have multiple authors in the data model)
-- This query assumes duplicate titles with different authors
SELECT title
FROM books
GROUP BY title
HAVING COUNT(DISTINCT author) > 1;

-- 14. List students along with the count of books issued by them
SELECT s.name, COUNT(ib.issue_id) AS total_issued
FROM students s
LEFT JOIN issued_books ib ON s.student_id = ib.student_id
GROUP BY s.student_id;

-- 15. Find the student who issued the most books
SELECT s.name, COUNT(ib.issue_id) AS total_issued
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
GROUP BY s.student_id
ORDER BY total_issued DESC
LIMIT 1;

-- 16. Retrieve books where publication year is between 2000 and 2020
SELECT * FROM books
WHERE publication_year BETWEEN 2000 AND 2020;

-- 17. Get the issue count for books by genre
SELECT b.genre, COUNT(ib.issue_id) AS issue_count
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
GROUP BY b.genre;

-- 18. Find all students who have issued books in the 'Science Fiction' genre
-- Assuming 'Science Fiction' exists in your dataset
SELECT DISTINCT s.name
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
JOIN books b ON ib.book_id = b.book_id
WHERE b.genre = 'Science Fiction';

-- 19. Find the book that was last issued
SELECT b.title, ib.issue_date
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
ORDER BY ib.issue_date DESC
LIMIT 1;

-- 20. Fetch students who returned books late (assuming 14-day return policy)
SELECT s.name, ib.issue_date, ib.return_date,
       DATEDIFF(ib.return_date, ib.issue_date) AS days_taken
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
WHERE DATEDIFF(ib.return_date, ib.issue_date) > 14;

-- Difficult Level

-- 1. Top 3 most popular genres based on number of issues
SELECT b.genre, COUNT(ib.issue_id) AS total_issues
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
GROUP BY b.genre
ORDER BY total_issues DESC
LIMIT 3;

-- 2. Student details along with titles of books issued and returned late (>14 days)
SELECT s.name, s.email, b.title, ib.issue_date, ib.return_date,
       DATEDIFF(ib.return_date, ib.issue_date) AS duration
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
JOIN books b ON ib.book_id = b.book_id
WHERE DATEDIFF(ib.return_date, ib.issue_date) > 14;

-- 3. Students who issued all available books from the 'History' genre
-- Assumes there are books with genre = 'History'
SELECT s.name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM books b
    WHERE b.genre = 'History'
    AND NOT EXISTS (
        SELECT 1
        FROM issued_books ib
        WHERE ib.book_id = b.book_id
        AND ib.student_id = s.student_id
    )
);


-- 4. Average issue duration for all returned books
SELECT AVG(DATEDIFF(return_date, issue_date)) AS avg_issue_duration
FROM issued_books
WHERE return_date IS NOT NULL;

-- 5. Student who issued books for the longest total duration
SELECT s.name, SUM(DATEDIFF(ib.return_date, ib.issue_date)) AS total_duration
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
WHERE ib.return_date IS NOT NULL
GROUP BY s.student_id
ORDER BY total_duration DESC
LIMIT 1;

-- 6. Books issued exactly three times
SELECT b.title, COUNT(ib.issue_id) AS issue_count
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
GROUP BY b.book_id
HAVING issue_count = 3;

-- 7. Students who issued books across all available genres
SELECT s.name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM (
        SELECT DISTINCT genre FROM books
    ) AS all_genres
    WHERE NOT EXISTS (
        SELECT 1
        FROM issued_books ib
        JOIN books b ON ib.book_id = b.book_id
        WHERE ib.student_id = s.student_id
        AND b.genre = all_genres.genre
    )
);


-- 8. Top 5 books with the longest average issue duration
SELECT b.title, AVG(DATEDIFF(ib.return_date, ib.issue_date)) AS avg_duration
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
WHERE ib.return_date IS NOT NULL
GROUP BY b.book_id
ORDER BY avg_duration DESC
LIMIT 5;

-- 9. Students who issued more than one book and returned all of them late
SELECT s.name
FROM students s
JOIN issued_books ib ON s.student_id = ib.student_id
GROUP BY s.student_id
HAVING COUNT(ib.issue_id) > 1
   AND MIN(DATEDIFF(ib.return_date, ib.issue_date)) > 14;

-- 10. Book with the highest number of unique student issues
SELECT b.title, COUNT(DISTINCT ib.student_id) AS unique_students
FROM books b
JOIN issued_books ib ON b.book_id = ib.book_id
GROUP BY b.book_id
ORDER BY unique_students DESC
LIMIT 1;

