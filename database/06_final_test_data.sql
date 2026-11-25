
-- ==========================================
-- PHARMACY MANAGEMENT SYSTEM
-- 06. FINAL TEST DATA
-- Additional customers and purchases
-- ==========================================

BEGIN;

-- 1. Add 96 additional customers
INSERT INTO customers (
    full_name,
    phone,
    email,
    registration_date
)
SELECT
    'Customer ' || n,
    '+7701000' || LPAD(n::TEXT, 4, '0'),
    'customer' || n || '@example.com',
    CURRENT_DATE
FROM generate_series(1, 96) AS n;

-- 2. Add 10 additional purchases
INSERT INTO purchases (
    supplier_id,
    warehouse_id,
    purchase_date,
    total_amount,
    status
)
SELECT
    ((n - 1) % 3) + 1,
    ((n - 1) % 3) + 1,
    CURRENT_DATE,
    0,
    'completed'
FROM generate_series(1, 10) AS n;

-- 3. Add 20 purchase items
INSERT INTO purchase_items (
    purchase_id,
    batch_id,
    quantity,
    unit_price
)
SELECT
    p.purchase_id,
    x.batch_id,
    10,
    x.unit_price
FROM (
    VALUES
    (4, 1, 300::NUMERIC), (4, 2, 200::NUMERIC),
    (5, 3, 800::NUMERIC), (5, 6, 900::NUMERIC),
    (6, 4, 400::NUMERIC), (6, 7, 700::NUMERIC),
    (7, 1, 300::NUMERIC), (7, 2, 200::NUMERIC),
    (8, 3, 800::NUMERIC), (8, 6, 900::NUMERIC),
    (9, 4, 400::NUMERIC), (9, 7, 700::NUMERIC),
    (10, 1, 300::NUMERIC), (10, 2, 200::NUMERIC),
    (11, 3, 800::NUMERIC), (11, 6, 900::NUMERIC),
    (12, 4, 400::NUMERIC), (12, 7, 700::NUMERIC),
    (13, 1, 300::NUMERIC), (13, 2, 200::NUMERIC)
) AS x(purchase_id, batch_id, unit_price)
JOIN purchases p ON p.purchase_id = x.purchase_id;

-- 4. Update purchase totals
UPDATE purchases p
SET total_amount = (
    SELECT COALESCE(SUM(pi.quantity * pi.unit_price), 0)
    FROM purchase_items pi
    WHERE pi.purchase_id = p.purchase_id
)
WHERE p.purchase_id BETWEEN 4 AND 13;

COMMIT;

-- 5. Add 10 additional sales
INSERT INTO sales (
    branch_id,
    warehouse_id,
    customer_id,
    sale_date,
    total_amount,
    prescription_number
)
VALUES
(1, 1, 1, CURRENT_TIMESTAMP, 0, NULL),
(2, 2, 2, CURRENT_TIMESTAMP, 0, NULL),
(3, 1, 3, CURRENT_TIMESTAMP, 0, NULL),
(1, 1, 4, CURRENT_TIMESTAMP, 0, NULL),
(2, 2, 5, CURRENT_TIMESTAMP, 0, NULL),
(3, 1, 6, CURRENT_TIMESTAMP, 0, NULL),
(1, 1, 7, CURRENT_TIMESTAMP, 0, NULL),
(2, 2, 8, CURRENT_TIMESTAMP, 0, NULL),
(3, 1, 9, CURRENT_TIMESTAMP, 0, NULL),
(1, 1, 10, CURRENT_TIMESTAMP, 0, NULL);

-- 6. Add sale items
INSERT INTO sale_items
(sale_id, batch_id, quantity, unit_price, discount)
VALUES
(5, 1, 2, 500, 0),
(6, 6, 2, 1400, 0),
(7, 2, 2, 350, 0),
(8, 3, 2, 1200, 0),
(9, 5, 2, 600, 0),
(10, 4, 2, 650, 0),
(11, 1, 3, 500, 0),
(12, 7, 2, 1100, 0),
(13, 2, 3, 350, 0),
(14, 3, 1, 1200, 0);

-- 7. Update sales totals
UPDATE sales s
SET total_amount = (
    SELECT SUM(si.quantity * si.unit_price - si.discount)
    FROM sale_items si
    WHERE si.sale_id = s.sale_id
)
WHERE s.sale_id BETWEEN 5 AND 14;

-- 8. Add payments
INSERT INTO payments
(sale_id, amount, payment_method, payment_status)
VALUES
(5, 1000, 'Cash', 'completed'),
(6, 2800, 'Card', 'completed'),
(7, 700, 'Cash', 'completed'),
(8, 2400, 'Card', 'completed'),
(9, 1200, 'Cash', 'completed'),
(10, 1300, 'Card', 'completed'),
(11, 1500, 'Cash', 'completed'),
(12, 2200, 'Card', 'completed'),
(13, 1050, 'Cash', 'completed'),
(14, 1200, 'Card', 'completed');

-- 9. Set final inventory quantities

UPDATE inventory
SET quantity = CASE batch_id
    WHEN 1 THEN 25
    WHEN 2 THEN 45
    WHEN 3 THEN 107
    WHEN 4 THEN 128
    WHEN 5 THEN 13
    WHEN 6 THEN 88
    WHEN 7 THEN 38
    WHEN 8 THEN 50
END
WHERE batch_id BETWEEN 1 AND 8;

-- 10. Verify final project data

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_sales,
       SUM(total_amount) AS total_revenue
FROM sales;

SELECT COUNT(*) AS total_purchases,
       SUM(total_amount) AS total_purchase_amount
FROM purchases;

SELECT
    m.medicine_name,
    i.quantity
FROM inventory i
JOIN medicine_batches mb ON i.batch_id = mb.batch_id
JOIN medicines m ON mb.medicine_id = m.medicine_id
ORDER BY i.quantity DESC;