-- PHARMACY MANAGEMENT SYSTEM
-- 04. JOIN QUERIES

-- 1. Дәрілер және олардың санаттары
SELECT m.medicine_name, c.category_name
FROM medicines m
JOIN categories c ON m.category_id = c.category_id;

-- 2. Дәрілер және өндірушілер
SELECT m.medicine_name, mf.manufacturer_name, mf.country
FROM medicines m
JOIN manufacturers mf ON m.manufacturer_id = mf.manufacturer_id;

-- 3. Филиалдар және қоймалар
SELECT b.branch_name, w.warehouse_name
FROM branches b
JOIN warehouses w ON b.branch_id = w.branch_id;

-- 4. Дәрілер және партиялар
SELECT m.medicine_name, mb.batch_number, mb.expiry_date, mb.sale_price
FROM medicines m
JOIN medicine_batches mb ON m.medicine_id = mb.medicine_id;

-- 5. Қоймадағы дәрілер
SELECT m.medicine_name, w.warehouse_name, i.quantity
FROM inventory i
JOIN medicine_batches mb ON i.batch_id = mb.batch_id
JOIN medicines m ON mb.medicine_id = m.medicine_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id;

-- 6. Сатылымдар және клиенттер
SELECT s.sale_id, c.full_name, s.sale_date, s.total_amount
FROM sales s
LEFT JOIN customers c ON s.customer_id = c.customer_id;

-- 7. Сатылымдар және филиалдар
SELECT s.sale_id, b.branch_name, s.sale_date, s.total_amount
FROM sales s
JOIN branches b ON s.branch_id = b.branch_id;

-- 8. Сатылымдар және төлемдер
SELECT s.sale_id, p.amount, p.payment_method, p.payment_status
FROM sales s
JOIN payments p ON s.sale_id = p.sale_id;

-- 9. Жеткізушілер және сатып алулар
SELECT su.supplier_name, pu.purchase_id, pu.purchase_date, pu.total_amount
FROM suppliers su
JOIN purchases pu ON su.supplier_id = pu.supplier_id;

-- 10. Қайтарылған дәрілер
SELECT r.return_id, m.medicine_name, ri.quantity, ri.refund_amount
FROM returns r
JOIN return_items ri ON r.return_id = ri.return_id
JOIN sale_items si ON ri.sale_item_id = si.sale_item_id
JOIN medicine_batches mb ON ri.batch_id = mb.batch_id
JOIN medicines m ON mb.medicine_id = m.medicine_id;