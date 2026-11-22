-- PHARMACY MANAGEMENT SYSTEM
-- 02. FILTERING QUERIES

-- 1. Белсенді дәрілер
SELECT *
FROM medicines
WHERE active = TRUE;

-- 2. Рецептпен берілетін дәрілер
SELECT *
FROM medicines
WHERE prescription_required = TRUE;

-- 3. Атауы Aspirin болатын дәрі
SELECT *
FROM medicines
WHERE medicine_name = 'Aspirin';

-- 4. Атауында Vitamin сөзі бар дәрілер
SELECT *
FROM medicines
WHERE medicine_name LIKE '%Vitamin%';

-- 5. Бағасы 1000 бен 5000 аралығындағы партиялар
SELECT *
FROM medicine_batches
WHERE sale_price BETWEEN 1000 AND 5000;

-- 6. Белгілі бір санаттардағы дәрілер
SELECT *
FROM medicines
WHERE category_id IN (1, 2, 3);

-- 7. Жарамдылық мерзімі бойынша сұрыптау
SELECT *
FROM medicine_batches
ORDER BY expiry_date ASC;

-- 8. Ең қымбат дәрілерден бастап сұрыптау
SELECT *
FROM medicine_batches
ORDER BY sale_price DESC;

-- 9. Соңғы сатылымдар
SELECT *
FROM sales
ORDER BY sale_date DESC;

-- 10. Клиенттерді аты бойынша сұрыптау
SELECT *
FROM customers
ORDER BY full_name ASC;