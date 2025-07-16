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
