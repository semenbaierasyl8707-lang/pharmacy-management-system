-- PHARMACY MANAGEMENT SYSTEM
-- ANALYTICS 04. SALES ANALYSIS

-- 1. Әр филиал бойынша сатылым көлемі
SELECT
    b.branch_name,
    COUNT(s.sale_id) AS total_sales,
    SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN branches b
    ON s.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_revenue DESC;

-- 2. Төлем әдістері бойынша талдау
SELECT
    payment_method,
    COUNT(payment_id) AS payment_count,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;

-- 3. Әр клиенттің сатып алу көлемі
SELECT
    c.full_name,
    COUNT(s.sale_id) AS total_purchases,
    COALESCE(SUM(s.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_spent DESC;

-- 4. Жалпы сатылым статистикасы
SELECT
    COUNT(*) AS total_sales,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_sale
FROM sales;