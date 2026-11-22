-- PHARMACY MANAGEMENT SYSTEM
-- 09. BUSINESS ANALYSIS

-- 1. Әр филиал бойынша сатылымның жалпы сомасы
SELECT
    b.branch_name,
    COUNT(s.sale_id) AS total_sales,
    COALESCE(SUM(s.total_amount), 0) AS total_revenue
FROM branches b
LEFT JOIN sales s
    ON b.branch_id = s.branch_id
GROUP BY b.branch_name
ORDER BY total_revenue DESC;