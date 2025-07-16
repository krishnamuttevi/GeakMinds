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

