-- PHARMACY MANAGEMENT SYSTEM
-- Final Project Analysis

-- 1. Database tables
SELECT COUNT(*) AS total_tables
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE';

-- 2. Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 3. Total sales and revenue
SELECT
    COUNT(*) AS total_sales,
    SUM(total_amount) AS total_revenue
FROM sales;

-- 4. Total purchases
SELECT
    COUNT(*) AS total_purchases,
    SUM(total_amount) AS total_purchase_amount
FROM purchases;

-- 5. Total payments
SELECT SUM(amount) AS total_payments
FROM payments;

-- 6. Inventory by medicine
SELECT
    m.medicine_name,
    SUM(i.quantity) AS total_quantity
FROM inventory i
JOIN medicine_batches mb ON i.batch_id = mb.batch_id
JOIN medicines m ON mb.medicine_id = m.medicine_id
GROUP BY m.medicine_name
ORDER BY total_quantity DESC;

-- 7. Views
SELECT * FROM view_medicines;
SELECT * FROM view_inventory;
SELECT * FROM view_sales;