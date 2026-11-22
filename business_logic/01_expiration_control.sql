-- PHARMACY MANAGEMENT SYSTEM
-- BUSINESS LOGIC 01. EXPIRATION CONTROL

-- 1. Мерзімі өткен дәрілер
SELECT
    m.medicine_name,
    mb.batch_number,
    mb.expiry_date,
    CURRENT_DATE - mb.expiry_date AS days_expired
FROM medicine_batches mb
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
WHERE mb.expiry_date < CURRENT_DATE
ORDER BY mb.expiry_date;

-- 2. Жақын 30 күнде мерзімі аяқталатын дәрілер
SELECT
    m.medicine_name,
    mb.batch_number,
    mb.expiry_date
FROM medicine_batches mb
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
WHERE mb.expiry_date BETWEEN CURRENT_DATE
    AND CURRENT_DATE + INTERVAL '30 days'
ORDER BY mb.expiry_date;