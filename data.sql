INSERT INTO authors (name, birth_year) VALUES
('J.R.R. Tolkien', 1892),
('George Orwell', 1903),
('Jane Austen', 1775),
('Mark Twain', 1835),
('Haruki Murakami', 1949),
('Chinua Achebe', 1930),
('Agatha Christie', 1890),
('Gabriel García Márquez', 1927),
('Leo Tolstoy', 1828),
('F. Scott Fitzgerald', 1896);

INSERT INTO books (title, author_id, published_year, available_copies) VALUES
('The Hobbit', 1, 1937, 3),
('1984', 2, 1949, 2),
('Animal Farm', 2, 1945, 4),
('Pride and Prejudice', 3, 1813, 5),
('Adventures of Huckleberry Finn', 4, 1884, 3),
('Norwegian Wood', 5, 1987, 6),
('Things Fall Apart', 6, 1958, 4),
('Murder on the Orient Express', 7, 1934, 3),
('One Hundred Years of Solitude', 8, 1967, 2),
('War and Peace', 9, 1869, 1),
('The Great Gatsby', 10, 1925, 3);

INSERT INTO borrowers (name, email) VALUES
('Aarav', 'aarav@abc.com'),
('Diya', 'diya@abc.com'),
('Rohan', 'rohan@abc.com'),
('Sneha', 'sneha@abc.com'),
('Karan', 'karan@abc.com'),
('Ananya', 'ananya@abc.com'),
('Vikram', 'vikram@abc.com'),
('Pooja', 'pooja@abc.com'),
('Arjun', 'arjun@abc.com'),
('Meera', 'meera@abc.com');


INSERT INTO borrowed_books (book_id, borrower_id, borrowed_date, return_date) VALUES
(3, 1, '2025-04-01', '2025-04-10'),     
(7, 4, '2025-04-02', '2025-04-12'),   
(1, 5, '2025-04-03', '2025-04-18'),     
(10, 2, '2025-04-04', '2025-04-14'),    
(5, 9, '2025-04-05', '2025-04-16');     
