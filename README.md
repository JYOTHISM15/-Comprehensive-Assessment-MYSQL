# -Comprehensive-Assessment-MYSQL
 Library Management System

## Overview

The Library Management System (LMS) project is designed to manage and track all information related to books, employees, branches, and customers within a library. This system allows for efficient management of book inventory, employee details, customer records, and issue/return statuses.

## Database Schema

The system includes the following tables:

1. **Branch**
   - `Branch_no` (Primary Key)
   - `Manager_Id`
   - `Branch_address`
   - `Contact_no`

2. **Employee**
   - `Emp_Id` (Primary Key)
   - `Emp_name`
   - `Position`
   - `Salary`
   - `Branch_no` (Foreign Key referencing `Branch_no` in Branch table)

3. **Books**
   - `ISBN` (Primary Key)
   - `Book_title`
   - `Category`
   - `Rental_Price`
   - `Status` (Enum: 'yes', 'no')
   - `Author`
   - `Publisher`

4. **Customer**
   - `Customer_Id` (Primary Key)
   - `Customer_name`
   - `Customer_address`
   - `Reg_date`

5. **IssueStatus**
   - `Issue_Id` (Primary Key)
   - `Issued_cust` (Foreign Key referencing `Customer_Id` in Customer table)
   - `Issue_date`
   - `Isbn_book` (Foreign Key referencing `ISBN` in Books table)

6. **ReturnStatus**
   - `Return_Id` (Primary Key)
   - `Return_cust` (Foreign Key referencing `Customer_Id` in Customer table)
   - `Return_book_name`
   - `Return_date`
   - `Isbn_book2` (Foreign Key referencing `ISBN` in Books table)




