-- PHARMACY MANAGEMENT SYSTEM
-- BUSINESS LOGIC 02. BATCH TRACKING

-- 1. Барлық партиялар туралы ақпарат
SELECT
    mb.batch_id,
    m.medicine_name,
    mb.batch_number,
    s.supplier_name,
    mb.manufacture_date,
    mb.expiry_date,
    mb.purchase_price,
    mb.sale_price
FROM medicine_batches mb
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
JOIN suppliers s
    ON mb.supplier_id = s.supplier_id
ORDER BY mb.expiry_date;

-- 2. Әр партияның қоймадағы қалдығы
SELECT
    mb.batch_number,
    m.medicine_name,
    COALESCE(SUM(i.quantity), 0) AS available_quantity
FROM medicine_batches mb
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
LEFT JOIN inventory i
    ON mb.batch_id = i.batch_id
GROUP BY mb.batch_id, mb.batch_number, m.medicine_name
ORDER BY available_quantity DESC;

-- 3. Бір дәрінің барлық партияларын іздеу
SELECT
    m.medicine_name,
    mb.batch_number,
    mb.expiry_date,
    mb.sale_price
FROM medicine_batches mb
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
WHERE m.medicine_id = 1
ORDER BY mb.expiry_date;