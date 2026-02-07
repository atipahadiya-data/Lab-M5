-- create database M5_Lab_db;
Use M5_Lab_db;
-- create table
CREATE TABLE sales (
  order_id INT,
  order_date DATE,
  customer_id VARCHAR(10),
  region VARCHAR(20),
  product VARCHAR(50),
  quantity INT,
  price INT
);
-- Insert records
INSERT INTO sales VALUES
  (1001, '2024-01-01', 'C001', 'East', 'Keyboard', 2, 1500),
  (1002, '2024-01-02', 'C002', 'West', 'Mouse', 5, 500),
  (1003, '2024-01-03', 'C001', 'East', 'Monitor', 1, 12000),
  (1004, '2024-01-04', 'C003', 'South', 'Keyboard', 1, 1500),
  (1005, '2024-01-05', 'C002', 'West', 'Monitor', 2, 12000),
  (1006, '2024-01-06', 'C001', 'East', 'Mouse', 3, 500),
  (1007, '2024-01-07', 'C004', 'North', 'Keyboard', 4, 1500),
  (1008, '2024-01-08', 'C003', 'South', 'Monitor', 1, 12000);

-- ============================================
-- SQL Analytics: Python vs SQL Responsibilities
-- ============================================

-- Step 1: Revenue Calculation
SELECT 
  order_id,
  order_date,
  customer_id,
  region,
  product,
  quantity,
  price,
  quantity * price AS revenue
FROM sales;

-- Step 2: Total Revenue per Region
SELECT 
  region,
  SUM(quantity * price) AS total_revenue,
  COUNT(*) AS order_count
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Step 3: Total Revenue per Product
SELECT 
  product,
  SUM(quantity * price) AS total_revenue,
  SUM(quantity) AS total_quantity_sold,
  COUNT(*) AS order_count
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- Step 4: Average Order Value
SELECT 
  AVG(quantity * price) AS avg_order_value
FROM sales;

-- Step 5: Daily Revenue Trend
SELECT 
  order_date,
  SUM(quantity * price) AS daily_revenue,
  COUNT(*) AS daily_orders
FROM sales
GROUP BY order_date
ORDER BY order_date;

-- Step 6: Validation Queries
-- Check total revenue consistency
SELECT 
  SUM(quantity * price) AS total_revenue
FROM sales;

-- Verify no duplicates
SELECT 
  order_id,
  COUNT(*) AS occurrence_count
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1;
