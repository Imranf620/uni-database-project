
CREATE DATABASE LibraryManagementSystem;

\c librarymanagementsystem;

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    availability BOOLEAN DEFAULT TRUE
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    book_id INT REFERENCES Books(book_id) ON DELETE CASCADE,
    transaction_type VARCHAR(20) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Books (title, author, publisher) VALUES
('Shah Jo Risalo', 'Shah Abdul Latif Bhittai', 'Sindhi Literature'),
('Diwan-e-Ghalib', 'Mirza Ghalib', 'Urdu Poetry Classics'),
('Bang-e-Dra', 'Allama Iqbal', 'Iqbal Academy'),
('Saif-ul-Maluk', 'Mian Muhammad Bakhsh', 'Punjabi Literature');

INSERT INTO Users (name, email) VALUES
('Ali Raza', 'ali.raza@example.com'),
('Fatima Noor', 'fatima.noor@example.com'),
('Hamza Khan', 'hamza.khan@example.com'),
('Ayesha Tariq', 'ayesha.tariq@example.com');

INSERT INTO Transactions (user_id, book_id, transaction_type) VALUES
(1, 1, 'borrow'),
(2, 2, 'borrow'),
(3, 3, 'borrow');

UPDATE Books SET availability = FALSE WHERE book_id = 1;

DELETE FROM Transactions WHERE transaction_id = 1;

DELETE FROM Books WHERE book_id = 3;
