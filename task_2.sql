-- FILE: task_2.sql
-- PURPOSE: Create the tables for the alx_book_store database.

-- Ensure you are using the correct database
USE alx_book_store;

-- 1. CREATE THE 'Authors' TABLE
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. CREATE THE 'Books' TABLE
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    -- Define the Foreign Key to the Authors table
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. CREATE THE 'Customers' TABLE
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- 4. CREATE THE 'Orders' TABLE
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    -- Define the Foreign Key to the Customers table
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. CREATE THE 'Order_Details' TABLE
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    -- Define the Foreign Key to the Orders table
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    -- Define the Foreign Key to the Books table
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);