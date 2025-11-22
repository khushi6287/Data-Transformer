-- Create Database
CREATE DATABASE DataTransformer;
USE DataTransformer; 

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATE NOT NULL
); 

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
); 

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
); 

-- Insert Sample Data 
INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
('Khushi', 'Nagar', 'khushinagar@gmail.com', '2023-01-15'),
('Rishi', 'Patel', 'rishi@gmail.com', '2023-02-20'),
('Pratham', 'Shah', 'pratham@gmail.com', '2023-03-10'),
('Manthan', 'Joshi', 'manthan@gmail.com', '2023-04-05'),
('Yash', 'Desai', 'yash@gmail.com', '2023-05-12'),
('Priya', 'Mehta', 'priya@gmail.com', '2023-06-18'),
('John', 'Doe', 'john.doe@email.com', '2022-03-15'),
('Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'); 

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-07-01', 150.50),   
(2, '2023-07-03', 200.75),   
(3, '2023-07-05', 1200.00),  
(4, '2023-07-06', 450.25),   
(5, '2023-07-08', 750.80),   
(6, '2023-07-10', 300.00),   
(7, '2023-07-15', 950.25),   
(8, '2023-07-18', 620.30),   
(1, '2023-07-28', 480.90),   
(5, '2023-07-30', 320.45);   

INSERT INTO Employees (FirstName, LastName, Department, HireDate, Salary) VALUES
('Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
('Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
('Robert', 'Chen', 'IT', '2019-06-10', 75000.00),
('Lisa', 'Wang', 'Sales', '2022-02-14', 48000.00),
('James', 'Miller', 'Finance', '2020-11-05', 62000.00),
('Emily', 'Davis', 'HR', '2023-01-08', 52000.00); 


-- 1. INNER JOIN: Retrieve all orders and customer details where orders exist
SELECT o.OrderID, o.OrderDate, o.TotalAmount, 
       c.FirstName, c.LastName, c.Email
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID; 

-- 2. LEFT JOIN: Retrieve all customers and their corresponding orders (if any)
SELECT c.CustomerID, c.FirstName, c.LastName, 
       o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID; 

-- 3. RIGHT JOIN: Retrieve all orders and their corresponding customers (if any)
SELECT o.OrderID, o.OrderDate, o.TotalAmount,
       c.CustomerID, c.FirstName, c.LastName
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID; 

-- 4. FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching
SELECT c.CustomerID, c.FirstName, c.LastName, 
       o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, c.LastName, 
       o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID; 

-- 5. Subquery to find customers who have placed orders worth more than the average amount
SELECT c.CustomerID, c.FirstName, c.LastName, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders); 

-- 6. Subquery to find employees with salaries above the average salary
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees); 

-- 7. Extract the year and month from the OrderDate
SELECT OrderID, OrderDate,
       YEAR(OrderDate) AS OrderYear,
       MONTH(OrderDate) AS OrderMonth,
       MONTHNAME(OrderDate) AS OrderMonthName
FROM Orders; 

-- 8. Calculate the difference in days between two dates (order date and current date)
SELECT OrderID, OrderDate,
       DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
FROM Orders; 

-- 9. Format the OrderDate to a more readable format (e.g., 'DD-MMM-YYYY')
SELECT OrderID, 
       DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders; 

-- 10. Concatenate FirstName and LastName to form a full name
SELECT CustomerID,
       CONCAT(FirstName, ' ', LastName) AS FullName,
       Email
FROM Customers; 

-- 11. Replace part of a string (e.g., replace 'John' with 'Jonathan')
SELECT CustomerID,
       REPLACE(FirstName, 'John', 'Jonathan') AS ModifiedFirstName,
       LastName
FROM Customers; 

-- 12. Convert FirstName to uppercase and LastName to lowercase
SELECT CustomerID,
       UPPER(FirstName) AS FirstNameUpper,
       LOWER(LastName) AS LastNameLower
FROM Customers; 

-- 13. Trim extra spaces from the Email field
SELECT CustomerID, Email,
       TRIM(Email) AS TrimmedEmail
FROM Customers; 

-- 14. Calculate the running total of TotalAmount for each order
SELECT OrderID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders; 

-- 15. Rank orders based on TotalAmount using the RANK() function
SELECT OrderID, CustomerID, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS AmountRank
FROM Orders; 

-- 16. Assign a discount based on TotalAmount in orders (e.g., > 1000: 10% off, > 500: 5% off)
SELECT OrderID, TotalAmount,
       CASE 
           WHEN TotalAmount > 1000 THEN '10% OFF'
           WHEN TotalAmount > 500 THEN '5% OFF'
           ELSE 'No Discount'
       END AS DiscountCategory,
       CASE 
           WHEN TotalAmount > 1000 THEN TotalAmount * 0.9
           WHEN TotalAmount > 500 THEN TotalAmount * 0.95
           ELSE TotalAmount
       END AS FinalAmount
FROM Orders; 

-- 17. Categorize employees' salaries as high, medium, or low
SELECT EmployeeID, FirstName, LastName, Department, Salary,
       CASE 
           WHEN Salary > 70000 THEN 'High'
           WHEN Salary > 55000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees;
