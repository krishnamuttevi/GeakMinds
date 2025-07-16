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
