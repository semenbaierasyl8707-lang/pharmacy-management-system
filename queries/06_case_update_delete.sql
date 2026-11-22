-- PHARMACY MANAGEMENT SYSTEM
-- 06. CASE, UPDATE AND DELETE

-- 1. Дәрілердің бағасын санаттарға бөлу
SELECT
    m.medicine_name,
    mb.sale_price,
    CASE
        WHEN mb.sale_price >= 5000 THEN 'Қымбат'
        WHEN mb.sale_price >= 2000 THEN 'Орташа'
        ELSE 'Арзан'
    END AS price_category
FROM medicines m
JOIN medicine_batches mb
    ON m.medicine_id = mb.medicine_id;

-- 2. Дәрілердің жарамдылық мерзімін бағалау
SELECT
    m.medicine_name,
    mb.expiry_date,
    CASE
        WHEN mb.expiry_date < CURRENT_DATE THEN 'Мерзімі өткен'
        WHEN mb.expiry_date <= CURRENT_DATE + INTERVAL '30 days'
            THEN 'Мерзімі жақында аяқталады'
        ELSE 'Жарамды'
    END AS expiry_status
FROM medicines m
JOIN medicine_batches mb
    ON m.medicine_id = mb.medicine_id;