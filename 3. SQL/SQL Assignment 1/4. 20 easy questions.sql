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