-- ============================================================
-- RETAIL SALES TREND ANALYSIS
-- SQL Server Version
-- ============================================================

-- Create Database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'retail_sales_db')
    CREATE DATABASE retail_sales_db;
GO

USE retail_sales_db;
GO

-- Drop tables if exist
IF OBJECT_ID('returns', 'U') IS NOT NULL DROP TABLE returns;
IF OBJECT_ID('sales', 'U') IS NOT NULL DROP TABLE sales;
IF OBJECT_ID('customers', 'U') IS NOT NULL DROP TABLE customers;
IF OBJECT_ID('products', 'U') IS NOT NULL DROP TABLE products;
IF OBJECT_ID('regions', 'U') IS NOT NULL DROP TABLE regions;
GO

-- Table 1: Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

-- Table 2: Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- Table 3: Regions
CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50),
    state VARCHAR(50)
);

-- Table 4: Sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    region_id INT,
    sale_date DATE,
    quantity INT,
    discount DECIMAL(5,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Table 5: Returns
CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    sale_id INT,
    return_date DATE,
    return_reason VARCHAR(100),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);
GO

-- ============================================================
-- INSERT DATA
-- ============================================================

INSERT INTO customers VALUES
(1,'Amit Shah','Mumbai','Maharashtra',35,'Male'),
(2,'Priya Reddy','Hyderabad','Telangana',28,'Female'),
(3,'Rahul Verma','Delhi','Delhi',42,'Male'),
(4,'Sneha Iyer','Chennai','Tamil Nadu',31,'Female'),
(5,'Vikram Singh','Pune','Maharashtra',38,'Male'),
(6,'Anjali Gupta','Bangalore','Karnataka',25,'Female'),
(7,'Rajesh Kumar','Kolkata','West Bengal',45,'Male'),
(8,'Neha Sharma','Jaipur','Rajasthan',29,'Female'),
(9,'Suresh Nair','Kochi','Kerala',33,'Male'),
(10,'Pooja Mehta','Ahmedabad','Gujarat',27,'Female');

INSERT INTO products VALUES
(1,'Laptop Pro','Electronics',55000.00),
(2,'Wireless Headphones','Electronics',3500.00),
(3,'Office Chair','Furniture',8500.00),
(4,'Desk Lamp','Furniture',1200.00),
(5,'Running Shoes','Sports',4500.00),
(6,'Yoga Mat','Sports',800.00),
(7,'Winter Jacket','Clothing',3200.00),
(8,'Formal Shirt','Clothing',1500.00),
(9,'Rice Cooker','Kitchen',2500.00),
(10,'Coffee Maker','Kitchen',4000.00);

INSERT INTO regions VALUES
(1,'North','Delhi'),
(2,'South','Telangana'),
(3,'East','West Bengal'),
(4,'West','Maharashtra'),
(5,'Central','Madhya Pradesh');

INSERT INTO sales VALUES
(1,1,1,4,'2024-01-15',1,0.00,55000.00),
(2,2,5,2,'2024-01-20',2,5.00,8550.00),
(3,3,3,1,'2024-02-10',1,0.00,8500.00),
(4,4,7,2,'2024-02-14',3,10.00,8640.00),
(5,5,2,4,'2024-03-05',2,0.00,7000.00),
(6,6,6,2,'2024-03-18',5,5.00,3800.00),
(7,7,8,3,'2024-04-02',4,0.00,6000.00),
(8,8,9,1,'2024-04-22',2,0.00,5000.00),
(9,9,10,2,'2024-05-11',1,0.00,4000.00),
(10,10,4,4,'2024-05-25',3,0.00,3600.00),
(11,1,2,4,'2024-06-10',1,0.00,3500.00),
(12,2,1,2,'2024-06-20',1,5.00,52250.00),
(13,3,5,1,'2024-07-08',2,0.00,9000.00),
(14,4,3,2,'2024-07-19',1,0.00,8500.00),
(15,5,7,4,'2024-08-03',2,0.00,6400.00),
(16,6,10,2,'2024-08-15',2,10.00,7200.00),
(17,7,6,3,'2024-09-01',3,0.00,2400.00),
(18,8,1,1,'2024-09-22',1,0.00,55000.00),
(19,9,8,2,'2024-10-05',5,5.00,7125.00),
(20,10,2,4,'2024-10-18',3,0.00,10500.00),
(21,1,9,4,'2024-11-11',2,0.00,5000.00),
(22,2,4,2,'2024-11-25',4,0.00,4800.00),
(23,3,10,1,'2024-12-05',2,10.00,7200.00),
(24,4,5,2,'2024-12-20',3,5.00,12825.00),
(25,5,1,4,'2024-12-28',1,0.00,55000.00);

INSERT INTO returns VALUES
(1,4,'2024-02-20','Defective product'),
(2,12,'2024-06-28','Wrong size'),
(3,16,'2024-08-22','Not as described');
GO

PRINT 'Database and tables created successfully!';
GO
