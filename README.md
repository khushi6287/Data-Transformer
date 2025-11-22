(# Data Transformer - Advanced SQL Project

## 📖 Project Overview

Data Transformer is a comprehensive SQL project designed to enhance practical knowledge of advanced SQL operations. This project demonstrates hands-on experience with Joins, Subqueries, Date and String Manipulation Functions, Window Functions, and SQL CASE Expressions. The project simulates a Corporate Data Analysis System with core functionalities for customer information management, sales transaction processing, and employee performance data analysis.

## 🗄️ Database Schema

The project uses three main tables:

### Customers Table

- CustomerID (INT, Primary Key, Auto Increment)
- FirstName (VARCHAR(50), NOT NULL)
- LastName (VARCHAR(50), NOT NULL)
- Email (VARCHAR(100), UNIQUE, NOT NULL)
- RegistrationDate (DATE, NOT NULL)

### Orders Table

- OrderID (INT, Primary Key, Auto Increment)
- CustomerID (INT, Foreign Key referencing Customers)
- OrderDate (DATE, NOT NULL)
- TotalAmount (DECIMAL(10,2), NOT NULL)

### Employees Table

- EmployeeID (INT, Primary Key, Auto Increment)
- FirstName (VARCHAR(50), NOT NULL)
- LastName (VARCHAR(50), NOT NULL)
- Department (VARCHAR(50), NOT NULL)
- HireDate (DATE, NOT NULL)
- Salary (DECIMAL(10,2), NOT NULL)

## 🚀 Features Implemented

### SQL Joins

- ✅ INNER JOIN: Retrieve all orders and customer details where orders exist
- ✅ LEFT JOIN: Retrieve all customers and their corresponding orders (if any)
- ✅ RIGHT JOIN: Retrieve all orders and their corresponding customers (if any)
- ✅ FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching

### Subqueries

- ✅ Find customers who placed orders worth more than average amount
- ✅ Find employees with salaries above average salary

### Date Functions

- ✅ Extract year and month from OrderDate
- ✅ Calculate difference in days between order date and current date
- ✅ Format OrderDate to readable format (DD-MMM-YYYY)

### String Manipulation

- ✅ Concatenate FirstName and LastName to form full name
- ✅ Replace part of strings (John → Jonathan)
- ✅ Convert text cases (uppercase/lowercase)
- ✅ Trim extra spaces from fields

### Window Functions

- ✅ Calculate running total of order amounts
- ✅ Rank orders based on TotalAmount using RANK()

### CASE Expressions

- ✅ Assign dynamic discounts based on order amounts
- ✅ Categorize employee salaries (High/Medium/Low)

## 📊 Sample Data

### Customers

- 8 sample customers with Indian and international names
- Registration dates spanning from 2021 to 2023
- Unique email addresses for each customer

### Orders

- 10 sample orders with realistic amounts
- Multiple orders for some customers to demonstrate relationships
- Order dates in July 2023

### Employees

- 6 employees across Sales, HR, IT, and Finance departments
- Salary range from ₹48,000 to ₹75,000
- Hire dates from 2019 to 2023

## 🛠️ Setup Instructions

### Prerequisites

- MySQL Server (8.0 or higher recommended)
- MySQL Workbench or any SQL client

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/data-transformer.git
   cd data-transformer
   ```

2. **Execute the SQL script**
   - Open MySQL Workbench or your preferred SQL client
   - Run the entire `data_transformer.sql` script
   - This will:
     - Create the database
     - Create all tables with proper constraints
     - Insert sample data
     - Execute all 17 advanced queries

3. **Verify the setup**
   - Check if database 'DataTransformer' is created
   - Verify all three tables are populated with sample data
   - Run individual queries to test functionality

