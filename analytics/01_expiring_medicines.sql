-- PHARMACY MANAGEMENT SYSTEM
-- ANALYTICS 01. EXPIRING MEDICINES

-- 1. Жарамдылық мерзімі өтіп кеткен дәрілер
SELECT
    m.medicine_name,
    mb.batch_number,
    mb.expiry_date
FROM medicine_batches mb
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
WHERE mb.expiry_date < CURRENT_DATE
ORDER BY mb.expiry_date;

-- 2. Алдағы 30 күнде жарамдылық мерзімі өтетін дәрілер
SELECT
    m.medicine_name,
    mb.batch_number,
    mb.expiry_date,
    mb.expiry_date - CURRENT_DATE AS days_remaining
FROM medicine_batches mb
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
WHERE mb.expiry_date BETWEEN CURRENT_DATE
    AND CURRENT_DATE + INTERVAL '30 days'
ORDER BY mb.expiry_date;

-- 3. Жарамдылық мерзімі бойынша жалпы статистика
SELECT
    CASE
        WHEN expiry_date < CURRENT_DATE THEN 'Expired'
        WHEN expiry_date <= CURRENT_DATE + INTERVAL '7 days' THEN 'Critical'
        WHEN expiry_date <= CURRENT_DATE + INTERVAL '30 days' THEN 'Warning'
        ELSE 'Safe'
    END AS expiry_status,
    COUNT(*) AS batch_count
FROM medicine_batches
GROUP BY expiry_status
ORDER BY batch_count DESC;