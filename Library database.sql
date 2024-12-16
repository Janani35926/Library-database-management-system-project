CREATE DATABASE library_db;
USE library_db;

DROP  TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);

-- Create table "employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employeeS
(
           emp_id VARCHAR(10) PRIMARY KEY,
           emp_name VARCHAR(20),
           position_1 VARCHAR(30),
           salary DECIMAL(10,2),
           branch_id VARCHAR(10),
           FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);
-- Create table "Members"
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);

-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);

-- Create table "IssueStatus"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30),
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50),
            issued_emp_id VARCHAR(10),
            FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
            FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
            FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);

-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);

-- Inserting values for each table.
 INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM members;

-- Insert values into each branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM branch;

-- Insert values into each employees table
INSERT INTO employees(emp_id, emp_name, position_1, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');
SELECT * FROM employees;

-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');
SELECT * FROM books;

-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');
SELECT * FROM issued_status;

-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES
('RS101', 'IS101', '2023-06-06'),
('RS102', 'IS105', '2023-06-07'),
('RS103', 'IS103', '2023-08-07'),
('RS104', 'IS106', '2024-05-01'),
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');
SELECT * FROM return_status;

-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

-- Updating the exsisting table book by manually inserting the values for each column in FORM EDITOR rather then implmenting in MYSQL update query syntax.

-- Alternative way to update books table.
SELECT * FROM books;

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Task 2: Update an Existing Member's Address.

-- Updating the exsisting table book by manually inserting the values for each column in FORM EDITOR rather then implmenting in MYSQL update query syntax.

-- Alternative way to update members table.
SELECT * FROM members;

UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

SELECT * FROM  issued_status;

DELETE FROM issued_status
WHERE   issued_id =   'IS121';

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status;
SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';

-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_member_id,
       COUNT(*) AS total_count
FROM issued_status
GROUP BY 1
HAVING COUNT(*) >1;

-- CTAS (Create Table As Select)
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

SELECT * FROM books; 
SELECT * FROM issued_status;       
CREATE TABLE book_issued_cnt AS
SELECT b.isbn, 
       b.book_title, 
       COUNT(ist.issued_id) AS issue_count
FROM issued_status as ist
JOIN books as b
      ON  
      ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, 
		 b.book_title;

SELECT * FROM book_issued_cnt; 

-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:

SELECT * FROM books;
SELECT DISTINCT category FROM books;
SELECT book_title FROM books
WHERE  category='Fiction';

-- Task 8: Find Total Rental Income by Category:

SELECT * FROM issued_status;
SELECT 
    b.category,
    SUM(b.rental_price),
    COUNT(*)
FROM 
issued_status as ist
JOIN
books as b
ON b.isbn = ist.issued_book_isbn
GROUP BY 1;

-- Task 9. **List Members Who Registered in the Last 180 Days**:

SELECT * FROM members;

SELECT * 
FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 DAY;

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM issued_status;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM return_status;

SELECT B.branch_id,
       B.manager_id,
       B.branch_address,
       E.emp_id,
       E.emp_name,
       E1.emp_name AS manager
FROM employees E 
                 LEFT JOIN branch B
             ON
                 B.branch_id=E.branch_id
LEFT JOIN employees E1
             ON
                 B.manager_id=E1.emp_id;
                 
-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

CREATE TABLE expensive_books AS
SELECT * FROM books
WHERE rental_price > 6.00;

SELECT * FROM  expensive_books;

-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT * FROM issued_status;
SELECT * FROM return_status;


SELECT * FROM issued_status as I_S
LEFT JOIN
return_status as R_S
ON R_S.issued_id = I_S.issued_id
WHERE R_S.return_id IS NULL;
/*
### Advanced SQL Operations*/

-- Task 13: Identify Members with Overdue Books
--  Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's_id, member's name, book title, issue date, and days overdue.

SELECT * FROM issued_status;
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM return_status;

SELECT M.member_id,
       M.member_name,
       I_S.issued_book_name,
       I_S.issued_date,
       B.book_title,
       (CURRENT_DATE() - I_S.issued_date ) AS over_due_days
FROM issued_status I_S
JOIN members M
      ON 
M.member_id = I_S.issued_member_id
JOIN books B
      ON
I_S.issued_book_isbn= B.isbn
LEFT JOIN 
return_status R_S
      ON 
R_S.issued_id= I_S.issued_id
WHERE R_S.return_date 
                     IS NULL
         AND
 (CURRENT_DATE() - I_S.issued_date ) > 30
 ORDER BY 1;
 
 -- Task 14: Update Book Status on Return
-- Write a query to update the status of books in the books table to "available" when they are returned (based on entries in the return_status table).
 DELIMITER $$
 CREATE PROCEDURE return_Records(
            IN p_return_id VARCHAR(10),
            IN p_issued_id VARCHAR(10),
            IN p_book_quality VARCHAR(10)
)
BEGIN 
     DECLARE v_isbn VARCHAR(50);
     DECLARE v_book_name VARCHAR(50);
     -- inserting input parameters to return table
     INSERT INTO return_status(return_id,
                               issued_id,
                               return_date,
                               book_quality)
	VALUES(p_return_id ,
		   p_issued_id ,
           NOW(),
           p_book_quality );
  -- verifying the issued book id and parameter book id as similar to futher update return_status table
  SELECT issued_book_isbn,
         issued_book_name
         INTO v_isbn ,
              v_book_name
 FROM issued_status
 WHERE issued_id = p_issued_id;
    -- update books table to mark it is available
    UPDATE books
    SET status= 'yes'
    WHERE isbn=v_isbn;
    
    -- output regreeting message
	SELECT CONCAT('Thank you for returning the book:', v_book_name) AS return_msg;
END $$
         
 DELIMITER ;
 -- calling stored procedure
CALL return_Records('RS138', 'IS135', 'Good');
 
/*
Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.
*/
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM issued_status;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM return_status;

WITH Branch_report AS(
              SELECT br.branch_id,
                     br.manager_id,
                     COUNT(I.issued_id)  AS issued_book_count,
                     COUNT(R.return_id)  AS returned_book_count,
                     SUM(B.rental_price) AS revenue_generated
FROM issued_status I 
LEFT JOIN employees E
ON I.issued_emp_id = E.emp_id
LEFT JOIN branch br
ON E.branch_id = br.branch_id 
LEFT JOIN return_status R 
ON R.return_id = I.issued_id
LEFT JOIN books B
ON B.isbn = I.issued_book_isbn
GROUP BY 1,2
)
SELECT * FROM Branch_report;

CREATE TABLE branch_reports
AS
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(ist.issued_id) as number_book_issued,
    COUNT(rs.return_id) as number_of_book_return,
    SUM(bk.rental_price) as total_revenue
FROM issued_status as ist
JOIN 
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
JOIN 
books as bk
ON ist.issued_book_isbn = bk.isbn
GROUP BY 1, 2;

SELECT * FROM branch_reports;

CREATE TABLE branch_reports
AS
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(ist.issued_id) as number_book_issued,
    COUNT(rs.return_id) as number_of_book_return,
    SUM(bk.rental_price) as total_revenue
FROM issued_status as ist
JOIN 
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
JOIN 
books as bk
ON ist.issued_book_isbn = bk.isbn
GROUP BY 1, 2;

SELECT * FROM branch_reports;

-- Task 16: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2 months.

CREATE TEMPORARY TABLE ACTIVE_MEMBERS AS
SELECT * FROM members
WHERE member_id IN (SELECT DISTINCT issued_member_id FROM issued_status 
                     WHERE issued_date <= CURDATE() - INTERVAL 2 MONTH);
SELECT * FROM ACTIVE_MEMBERS;

-- Task 17: Find Employees with the Most Book Issues Processed
-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.

SELECT I.issued_emp_id,
       E.emp_name,
       B.branch_id,
       COUNT(I.issued_book_isbn) AS issued_book_count
FROM issued_status I 
LEFT JOIN employees E  
ON I.issued_emp_id = E.emp_id
LEFT JOIN branch B
ON B.branch_id = E.branch_id
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 3;

/*
Task 18: Stored Procedure  
Create a stored procedure to manage the status of books in a library system. 
Description: Write a stored procedure that updates the status of a book in the library based on its issuance. 
The procedure should function as follows: 
The stored procedure should take the book_id as an input parameter. 
The procedure should first check if the book is available (status = 'yes'). 
If the book is available, it should be issued, and the status in the books table should be updated to 'no'. 
If the book is not available (status = 'no'), the procedure should return an error message indicating that the book is currently not available.
*/
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM issued_status;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM return_status;

DELIMITER $$
 CREATE PROCEDURE Update_book(
            IN p_issued_id VARCHAR(10),              -- setting 4 input parameters
            IN p_issued_member_id VARCHAR(10),
            IN p_issued_book_isbn VARCHAR(50),
            IN p_issued_emp_id VARCHAR(10)
)
BEGIN 
     DECLARE v_status VARCHAR(50);        -- declaring variable 
     -- defining if condition to update book status
     SELECT status INTO v_status FROM books 
      WHERE isbn = p_issued_book_isbn;
	
    IF 
      v_status = 'Yes' THEN                    -- defining if statement with the existence of book status
	INSERT INTO issued_status(issued_id , issued_member_id, issued_book_isbn, issued_emp_id)
    VALUES (p_issued_id, p_issued_member_id, p_issued_book_isbn, _issued_emp_id);
    
    UPDATE books SET status= 'No'
    WHERE isbn= p_issued_book_isbn ;
    
    SELECT CONCAT('Book records added successfully for book ISBN: ', p_issued_book_isbn ) AS message;
  
  ELSE
    SELECT CONCAT('The book you have requested is unavialable ', p_issued_book_isbn ) AS message;
  END IF;
END $$
DELIMITER ;	

CALL Update_book ('IS155', 'C108', '978-0-375-41398-8', 'E104');             -- calling procedure with 4 input parameters.
  
DROP PROCEDURE IF EXISTS Update_book;         






 



           
           
           