# PostgreSQL-Ex4

# E-Library Management System

A database-driven system for managing books, authors, and borrowers in an online library.

## Overview

This system is designed to efficiently track and manage library resources, including books, authors, and borrowers. It uses a PostgreSQL database to store and retrieve data.

## Core Features

- **Authors Management**: Stores information about authors.
- **Books Management**: Tracks books and their authors, including publication year and availability.
- **Borrowers Management**: Records library members who borrow books.
- **Borrowed Books Tracking**: Monitors which books are borrowed by whom and their return dates.

## Database Schema

The system consists of four main tables:

1. **Authors Table**: Stores author details.
2. **Books Table**: Tracks books and their authors.
3. **Borrowers Table**: Records library members.
4. **Borrowed Books Table**: Tracks borrowed books and their return status.

## SQL Schema

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

## Usage

1. Create the database schema using the provided SQL commands.
2. Insert data into the tables as needed.
3. Use SQL queries to manage and retrieve data from the database.
