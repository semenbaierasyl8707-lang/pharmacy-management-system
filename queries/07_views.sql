-- PHARMACY MANAGEMENT SYSTEM
-- 07. VIEWS

-- 1. Дәрілер мен олардың санаттары
CREATE OR REPLACE VIEW view_medicines AS
SELECT
    m.medicine_id,
    m.medicine_name,
    c.category_name,
    m.prescription_required
FROM medicines m
JOIN categories c
    ON m.category_id = c.category_id;

-- 2. Дәрілердің қоймадағы саны
CREATE OR REPLACE VIEW view_inventory AS
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
    ON i.warehouse_id = w.warehouse_id;

-- 3. Сатылымдар туралы ақпарат
CREATE OR REPLACE VIEW view_sales AS
SELECT
    s.sale_id,
    b.branch_name,
    c.full_name,
    s.sale_date,
    s.total_amount
FROM sales s
JOIN branches b
    ON s.branch_id = b.branch_id
LEFT JOIN customers c
    ON s.customer_id = c.customer_id;

-- 4. Құрылған VIEW объектілерін тексеру
SELECT * FROM view_medicines;
SELECT * FROM view_inventory;
SELECT * FROM view_sales;