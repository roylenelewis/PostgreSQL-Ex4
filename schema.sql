 CREATE TABLE authors (
       author_id SERIAL PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       birth_year INT CHECK (birth_year > 0)
   );
   
 CREATE TABLE books (
       book_id SERIAL PRIMARY KEY,
       title VARCHAR(200) NOT NULL,
       author_id INT REFERENCES authors(author_id),
       published_year INT CHECK (published_year > 0),
       available_copies INT DEFAULT 1 CHECK (available_copies >= 0)
   );

CREATE TABLE borrowers (
       borrower_id SERIAL PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       email VARCHAR(100) UNIQUE NOT NULL,
       joined_date DATE DEFAULT CURRENT_DATE
   );

CREATE TABLE borrowed_books (
       borrow_id SERIAL PRIMARY KEY,
       book_id INT REFERENCES books(book_id),
       borrower_id INT REFERENCES borrowers(borrower_id),
       borrowed_date DATE DEFAULT CURRENT_DATE,
       return_date DATE
   );
