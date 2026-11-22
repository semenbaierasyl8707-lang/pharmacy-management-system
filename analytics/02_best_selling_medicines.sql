-- PHARMACY MANAGEMENT SYSTEM
-- ANALYTICS 02. BEST SELLING MEDICINES

-- 1. Ең көп сатылған дәрілер
SELECT
    m.medicine_name,
    SUM(si.quantity) AS total_sold
FROM sale_items si
JOIN medicine_batches mb
    ON si.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
GROUP BY m.medicine_name
ORDER BY total_sold DESC;

-- 2. Дәрілердің сатылымнан түскен табысы
SELECT
    m.medicine_name,
    SUM(si.quantity * si.unit_price) AS total_revenue
FROM sale_items si
JOIN medicine_batches mb
    ON si.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
GROUP BY m.medicine_name
ORDER BY total_revenue DESC;

-- 3. Ең көп табыс әкелген 3 дәрі
SELECT
    m.medicine_name,
    SUM(si.quantity * si.unit_price) AS total_revenue
FROM sale_items si
JOIN medicine_batches mb
    ON si.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
GROUP BY m.medicine_name
ORDER BY total_revenue DESC
LIMIT 3;