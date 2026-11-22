-- PHARMACY MANAGEMENT SYSTEM
-- ANALYTICS 03. BRANCH SHORTAGES

-- 1. Әр филиалдағы дәрілер қоры
SELECT
    b.branch_name,
    m.medicine_name,
    SUM(i.quantity) AS total_quantity
FROM inventory i
JOIN warehouses w
    ON i.warehouse_id = w.warehouse_id
JOIN branches b
    ON w.branch_id = b.branch_id
JOIN medicine_batches mb
    ON i.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
GROUP BY b.branch_name, m.medicine_name
ORDER BY b.branch_name, total_quantity;

-- 2. Қоры минималды деңгейден төмен дәрілер
SELECT
    b.branch_name,
    m.medicine_name,
    i.quantity,
    i.minimum_quantity
FROM inventory i
JOIN warehouses w
    ON i.warehouse_id = w.warehouse_id
JOIN branches b
    ON w.branch_id = b.branch_id
JOIN medicine_batches mb
    ON i.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
WHERE i.quantity < i.minimum_quantity
ORDER BY b.branch_name;

-- 3. Әр филиалдағы жалпы дәрі қоры
SELECT
    b.branch_name,
    SUM(i.quantity) AS total_stock
FROM inventory i
JOIN warehouses w
    ON i.warehouse_id = w.warehouse_id
JOIN branches b
    ON w.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_stock DESC;