#) create the database.
CREATE DATABASE Library;

USE Library; 

#) create Branch Table.
CREATE TABLE Branch(
	Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_Address VARCHAR(200),
    Contact_no VARCHAR(15)
 );
DESC Branch;
 
 #) create Employee Table. 
CREATE TABLE Employee(
	Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
DESC Employee;

#) create Books Table.
CREATE TABLE Books(
	ISBN VARCHAR(100) PRIMARY KEY,
    Book_title VARCHAR(200),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status ENUM( 'Yes', 'No'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
DESC Books;

#) create Customer Table.
CREATE TABLE Customer(
	Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_adress VARCHAR(100),
    Reg_date DATE
);
DESC Customer;

#) create IssuesStatus Table.
CREATE TABLE IssuesStatus(
	Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(200),
    Issued_date DATE,
    Isbn_book VARCHAR(100),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
 );
 DESC IssuesStatus;
 
 #) create ReturnStatus Table.
CREATE TABLE ReturnStatus(
		Return_Id INT PRIMARY KEY,
        Return_cust INT,
        Return_book_name VARCHAR(200),
        Return_date DATE,
        Isbn_book2 VARCHAR(100),
        FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
        FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
DESC ReturnStatus;

#) Insert values in each Tables.
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(1, 101, '123 Main St, City A', '555-1234'),
(2, 102, '456 Oak St, City B', '555-5678'),
(3, 103, '789 Pine St, City C', '555-9012'),
(4, 104, '321 Maple St, City D', '555-3456'),
(5, 105, '654 Elm St, City E', '555-7890'),
(6, 106, '987 Birch St, City F', '555-2345'),
(7, 107, '432 Cedar St, City G', '555-6789'),
(8, 108, '876 Willow St, City H', '555-0123'),
(9, 109, '345 Aspen St, City I', '555-3456'),
(10, 110, '567 Poplar St, City J', '555-6780');

SELECT * FROM Branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
(101, 'John Doe', 'Manager', 75000, 1),
(102, 'Jane Smith', 'Librarian', 55000, 2),
(103, 'Emily Johnson', 'Assistant Librarian', 45000, 3),
(104, 'Michael Brown', 'Clerk', 40000, 4),
(105, 'Sarah Davis', 'Manager', 80000, 5),
(106, 'Chris Wilson', 'Librarian', 60000, 6),
(107, 'Nancy White', 'Assistant Librarian', 47000, 7),
(108, 'Paul Green', 'Clerk', 42000, 8),
(109, 'Rachel Black', 'Manager', 85000, 9),
(110, 'Laura Blue', 'Librarian', 58000, 10);

SELECT * FROM Employee;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_adress, Reg_date)
VALUES 
(201, 'Alice Green', '101 First St, City A', '2022-05-15'),
(202, 'Bob White', '202 Second St, City B', '2023-01-20'),
(203, 'Charlie Black', '303 Third St, City C', '2021-11-11'),
(204, 'Diana Blue', '404 Fourth St, City D', '2023-06-05'),
(205, 'Eve Red', '505 Fifth St, City E', '2021-12-25'),
(206, 'Frank Yellow', '606 Sixth St, City F', '2022-03-30'),
(207, 'Grace Pink', '707 Seventh St, City G', '2023-04-15'),
(208, 'Henry Orange', '808 Eighth St, City H', '2022-07-20'),
(209, 'Ivy Purple', '909 Ninth St, City I', '2021-09-18'),
(210, 'Jack Brown', '100 Tenth St, City J', '2022-02-22');

SELECT * FROM Customer;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 30, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-14-017739-8', '1984', 'Dystopian', 25, 'no', 'George Orwell', 'Secker & Warburg'),
('978-1-56619-909-4', 'A Brief History of Time', 'Science', 40, 'yes', 'Stephen Hawking', 'Bantam Books'),
('978-0-7432-7356-5', 'The Da Vinci Code', 'Mystery', 35, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-553-21311-7', 'To Kill a Mockingbird', 'Fiction', 28, 'no', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-1-4028-9462-6', 'The Catcher in the Rye', 'Fiction', 22, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-452-28423-4', 'Brave New World', 'Dystopian', 30, 'no', 'Aldous Huxley', 'Chatto & Windus'),
('978-0-316-76948-8', 'Becoming', 'Biography', 50, 'yes', 'Michelle Obama', 'Crown Publishing'),
('978-0-8129-9319-0', 'Sapiens', 'Non-Fiction', 45, 'yes', 'Yuval Noah Harari', 'Harper'),
('978-0-399-58817-4', 'The Book Thief', 'Historical Fiction', 38, 'no', 'Markus Zusak', 'Picador');

SELECT * FROM Books;

INSERT INTO IssuesStatus (Issue_Id, Issued_cust, Issued_book_name, Issued_date, Isbn_book)
VALUES 
(301, 201, 'The Great Gatsby', '2023-07-01', '978-3-16-148410-0'),
(302, 202, '1984', '2023-06-15', '978-0-14-017739-8'),
(303, 203, 'The Da Vinci Code', '2023-08-10', '978-0-7432-7356-5'),
(304, 204, 'A Brief History of Time', '2023-06-25', '978-1-56619-909-4'),
(305, 205, 'To Kill a Mockingbird', '2022-12-01', '978-0-553-21311-7'),
(306, 206, 'The Catcher in the Rye', '2023-07-20', '978-1-4028-9462-6'),
(307, 207, 'Brave New World', '2023-04-05', '978-0-452-28423-4'),
(308, 208, 'Becoming', '2023-03-12', '978-0-316-76948-8'),
(309, 209, 'Sapiens', '2023-09-10', '978-0-8129-9319-0'),
(310, 210, 'The Book Thief', '2023-01-15', '978-0-399-58817-4');

SELECT * FROM IssuesStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(401, 201, 'The Great Gatsby', '2023-07-10', '978-3-16-148410-0'),
(402, 202, '1984', '2023-06-22', '978-0-14-017739-8'),
(403, 203, 'The Da Vinci Code', '2023-08-20', '978-0-7432-7356-5'),
(404, 204, 'A Brief History of Time', '2023-07-05', '978-1-56619-909-4'),
(405, 205, 'To Kill a Mockingbird', '2023-01-01', '978-0-553-21311-7'),
(406, 206, 'The Catcher in the Rye', '2023-07-30', '978-1-4028-9462-6'),
(407, 207, 'Brave New World', '2023-04-12', '978-0-452-28423-4'),
(408, 208, 'Becoming', '2023-03-22', '978-0-316-76948-8'),
(409, 209, 'Sapiens', '2023-09-20', '978-0-8129-9319-0'),
(410, 210, 'The Book Thief', '2023-01-25', '978-0-399-58817-4');

SELECT * FROM ReturnStatus;	


##) Queries

# 1). Retrieve the book title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'Yes';

# 2). List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# 3). Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name FROM Books B 
JOIN IssuesStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

# 4). Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

# 5). Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

# 6). List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT customer_name FROM customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN
(SELECT issued_cust FROM IssuesStatus);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_adress, Reg_date) 
VALUES (11, 'Jane Doe', '789 Cypress St, City K', '2021-12-15');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_adress, Reg_date) 
VALUES('12', 'Frank Thomas', '234 Cedar St', '2021-10-15');

# 7). Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

# 8). Display the names of customers who have issued books in the month of June 2023.
SELECT C.Customer_name FROM Customer C
JOIN IssuesStatus I ON C.Customer_Id = I.Issued_cust
WHERE I.Issued_date BETWEEN '2023-06-01' AND '2023-06-30';

# 9). Retrieve book_title from book table containing history. 
SELECT Book_title FROM Books WHERE Book_title LIKE '%history%';

# 10).Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'Alice Johnson', 'Librarian', 55000, 1),
(202, 'Bob Smith', 'Assistant Librarian', 48000, 1),
(203, 'Charlie Brown', 'Librarian', 57000, 1),
(204, 'Diana Ross', 'Assistant Librarian', 46000, 1),
(205, 'Edward Green', 'Librarian', 52000, 1),
(206, 'Fiona White', 'Librarian', 51000, 1);

# 11). Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

# 12).  Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT C.Customer_name FROM Customer C
JOIN IssuesStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;
    
-- END--