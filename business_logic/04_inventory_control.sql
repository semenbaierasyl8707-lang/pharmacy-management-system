-- PHARMACY MANAGEMENT SYSTEM
-- BUSINESS LOGIC 04. INVENTORY CONTROL

-- 1. Барлық қоймалардағы дәрілер қоры
SELECT
    m.medicine_name,
    w.warehouse_name,
    i.quantity,
    i.minimum_quantity
FROM inventory i
JOIN medicine_batches mb
    ON i.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
JOIN warehouses w
    ON i.warehouse_id = w.warehouse_id
ORDER BY m.medicine_name;

-- 2. Қоры минималды деңгейден төмен дәрілер
SELECT
    m.medicine_name,
    w.warehouse_name,
    i.quantity,
    i.minimum_quantity
FROM inventory i
JOIN medicine_batches mb
    ON i.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
JOIN warehouses w
    ON i.warehouse_id = w.warehouse_id
WHERE i.quantity < i.minimum_quantity;

-- 3. Қоймалар бойынша жалпы дәрі саны
SELECT
    w.warehouse_name,
    SUM(i.quantity) AS total_quantity
FROM inventory i
JOIN warehouses w
    ON i.warehouse_id = w.warehouse_id
GROUP BY w.warehouse_name
ORDER BY total_quantity DESC;