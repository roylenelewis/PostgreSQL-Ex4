SELECT * FROM authors;

SELECT * FROM books;

SELECT * FROM borrowers;

SELECT * FROM borrowed_books;

--update an Author's Name
UPDATE authors
SET name = 'Rowling'
WHERE author_id = 3;

--update a Book's copies
UPDATE books
SET available_copies = available_copies + 1
WHERE book_id = 1;

--update a Book'scopies
UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = 2;

--update Return Date for a Borrowed Book
UPDATE borrowed_books
SET return_date = '2024-04-25'
WHERE borrow_id = 1;

--all the books of a specific author
SELECT b.title
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.name = 'Geroge Orwell';

-- all borrowers who have joined in the year 2025
SELECT name
FROM borrowers
WHERE EXTRACT(YEAR FROM joined_date) = 2025;

--all books borrowed from a specific borrower
SELECT b.title
FROM books b
JOIN borrowed_books bb ON b.book_id = bb.book_id
JOIN borrowers br ON bb.borrower_id = br.borrower_id
WHERE br.name = 'Sneha';

--all borrowers who have borrowed more than 1 book
SELECT br.name
FROM borrowers br
WHERE br.borrower_id IN (
SELECT bb.borrower_id
FROM borrowed_books bb
GROUP BY bb.borrower_id
HAVING COUNT(bb.borrow_id) > 1
);


--all available books
SELECT title
FROM books
WHERE available_copies > 0;

--book published in the year 1945
SELECT title
FROM books
WHERE published_year = 1945;

--books borrowed by Roshan in the year 2025
SELECT b.title
FROM books b
JOIN borrowed_books bb ON b.book_id = bb.book_id
JOIN borrowers br ON bb.borrower_id = br.borrower_id
WHERE br.name = 'Roshan' AND EXTRACT(YEAR FROM bb.borrowed_date) = 2025;

--authors born in the year 1890
SELECT b.title
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.birth_year = 1890;

--count no. of books by each author
SELECT a.name, COUNT(b.book_id) AS num_books
FROM authors a
LEFT JOIN books b ON a.author_id = b.author_id
GROUP BY a.name;

--books borrowed by each borrower
SELECT br.name, COUNT(bb.borrow_id) AS num_borrowed
FROM borrowers br
LEFT JOIN borrowed_books bb ON br.borrower_id = bb.borrower_id
GROUP BY br.name;

--top 3 recently borrowed books
SELECT b.title
FROM books b
JOIN borrowed_books bb ON b.book_id = bb.book_id
ORDER BY bb.borrowed_date DESC
LIMIT 3;

--top3 authores with most books
SELECT a.name, COUNT(b.book_id) AS num_books
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.name
ORDER BY num_books DESC
LIMIT 3;

--book that have not been borrowed
SELECT title
FROM books
WHERE book_id NOT IN (SELECT book_id FROM borrowed_books);

-- overdue of borrowed books
SELECT br.name AS borrower_name, b.title AS book_title, bb.borrowed_date, bb.return_date
FROM borrowed_books bb
JOIN borrowers br ON bb.borrower_id = br.borrower_id
JOIN books b ON bb.book_id = b.book_id
WHERE bb.return_date IS NULL AND bb.borrowed_date + INTERVAL '15days' < CURRENT_DATE;

