-- PHARMACY MANAGEMENT SYSTEM
-- 05. SUBQUERIES AND SET OPERATIONS

-- 1. Орташа бағадан қымбат дәрілер
SELECT medicine_name
FROM medicines
WHERE medicine_id IN (
    SELECT medicine_id
    FROM medicine_batches
    WHERE sale_price > (
        SELECT AVG(sale_price)
        FROM medicine_batches
    )
);

-- 2. Ең қымбат дәрі
SELECT medicine_name
FROM medicines
WHERE medicine_id = (
    SELECT medicine_id
    FROM medicine_batches
    ORDER BY sale_price DESC
    LIMIT 1
);

-- 3. Сатылым жасаған клиенттер
SELECT full_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM sales
    WHERE customer_id IS NOT NULL
);

-- 4. Сатылым жасамаған клиенттер
SELECT full_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM sales s
    WHERE s.customer_id = c.customer_id
);

-- 5. Дәрі саны орташа мөлшерден аз партиялар
SELECT batch_id, quantity
FROM inventory
WHERE quantity < (
    SELECT AVG(quantity)
    FROM inventory
);

-- 6. UNION: барлық қала мен жеткізуші елдері
SELECT city AS location
FROM branches
WHERE city IS NOT NULL
UNION
SELECT country
FROM suppliers
WHERE country IS NOT NULL;

-- 7. UNION ALL: барлық қала мен жеткізуші елдері
SELECT city AS location
FROM branches
WHERE city IS NOT NULL
UNION ALL
SELECT country
FROM suppliers
WHERE country IS NOT NULL;

-- 8. INTERSECT: филиалдар мен жеткізушілерге ортақ елдер
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM manufacturers;

-- 9. EXCEPT: сатылымы жоқ филиалдар
SELECT branch_name
FROM branches
WHERE branch_id IN (
    SELECT branch_id FROM branches
)
EXCEPT
SELECT b.branch_name
FROM branches b
JOIN sales s ON b.branch_id = s.branch_id;

-- 10. Орташа сомадан жоғары сатылымдар
SELECT sale_id, total_amount
FROM sales
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM sales
);