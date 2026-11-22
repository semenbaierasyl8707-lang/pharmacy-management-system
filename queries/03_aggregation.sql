
-- PHARMACY MANAGEMENT SYSTEM
-- 03. AGGREGATION QUERIES

-- 1. Дәрілердің жалпы саны
SELECT COUNT(*) AS total_medicines
FROM medicines;

-- 2. Клиенттердің жалпы саны
SELECT COUNT(*) AS total_customers
FROM customers;

-- 3. Әр санаттағы дәрілер саны
SELECT category_id, COUNT(*) AS medicine_count
FROM medicines
GROUP BY category_id;

-- 4. Әр филиалдағы сатылым саны
SELECT branch_id, COUNT(*) AS sales_count
FROM sales
GROUP BY branch_id;

-- 5. Жалпы сатылым сомасы
SELECT SUM(total_amount) AS total_sales
FROM sales;

-- 6. Орташа сатылым сомасы
SELECT AVG(total_amount) AS average_sale
FROM sales;

-- 7. Ең үлкен сатылым сомасы
SELECT MAX(total_amount) AS maximum_sale
FROM sales;

-- 8. Ең кіші сатылым сомасы
SELECT MIN(total_amount) AS minimum_sale
FROM sales;

-- 9. Сатылым сомасы 10000-нан жоғары филиалдар
SELECT branch_id, SUM(total_amount) AS total_sales
FROM sales
GROUP BY branch_id
HAVING SUM(total_amount) > 10000;

-- 10. Әр дәрі бойынша қоймадағы жалпы саны
SELECT batch_id, SUM(quantity) AS total_quantity
FROM inventory
GROUP BY batch_id;