-- ==========================================
-- PHARMACY MANAGEMENT SYSTEM
-- 02. INSERT TEST DATA
-- ==========================================

BEGIN;

-- 1. Categories
INSERT INTO categories (category_name, description) VALUES
('Painkillers', 'Pain relief medicines'),
('Antibiotics', 'Medicines for bacterial infections'),
('Vitamins', 'Vitamins and supplements'),
('Cold and Flu', 'Medicines for cold and flu');

-- 2. Manufacturers
INSERT INTO manufacturers (manufacturer_name, country, contact_phone) VALUES
('Bayer', 'Germany', '+49123456789'),
('Pfizer', 'USA', '+12025550101'),
('Novartis', 'Switzerland', '+41445550101'),
('Sanofi', 'France', '+33145550101');

-- 3. Suppliers
INSERT INTO suppliers (supplier_name, country, phone, email) VALUES
('MedSupply Kazakhstan', 'Kazakhstan', '+77011234567', 'medsupply@mail.com'),
('Pharma Distribution', 'Kazakhstan', '+77017654321', 'pharma@mail.com'),
('Global Medicines', 'Germany', '+49301234567', 'global@mail.com');

-- 4. Branches
INSERT INTO branches (branch_name, address, city, phone) VALUES
('Central Pharmacy', 'Abay Avenue 100', 'Almaty', '+77271234567'),
('North Pharmacy', 'Dostyk Avenue 45', 'Almaty', '+77271234568'),
('South Pharmacy', 'Tole Bi Street 80', 'Shymkent', '+77251234567');

-- 5. Medicines
INSERT INTO medicines
(medicine_name, category_id, manufacturer_id, description, prescription_required)
VALUES
('Aspirin', 1, 1, 'Pain relief medicine', FALSE),
('Paracetamol', 1, 2, 'Fever and pain relief', FALSE),
('Amoxicillin', 2, 2, 'Antibiotic medicine', TRUE),
('Vitamin C', 3, 3, 'Vitamin supplement', FALSE),
('Ibuprofen', 1, 1, 'Anti-inflammatory medicine', FALSE),
('Azithromycin', 2, 4, 'Antibiotic medicine', TRUE),
('Theraflu', 4, 4, 'Cold and flu medicine', FALSE),
('Vitamin D3', 3, 3, 'Vitamin D supplement', FALSE);

-- 6. Warehouses
INSERT INTO warehouses (branch_id, warehouse_name, address) VALUES
(1, 'Central Main Warehouse', 'Abay Avenue 100'),
(2, 'North Storage', 'Dostyk Avenue 45'),
(3, 'South Storage', 'Tole Bi Street 80');

-- 7. Medicine Batches
INSERT INTO medicine_batches
(medicine_id, supplier_id, batch_number, manufacture_date,
 expiry_date, purchase_price, sale_price)
VALUES
(1, 1, 'ASP-2026-001', '2026-01-10', '2027-12-31', 300, 500),
(2, 1, 'PAR-2026-001', '2026-02-15', '2026-12-15', 200, 350),
(3, 2, 'AMX-2026-001', '2026-03-01', '2027-03-01', 800, 1200),
(4, 3, 'VTC-2026-001', '2026-01-20', '2028-01-20', 400, 650),
(5, 1, 'IBU-2026-001', '2026-04-10', '2027-04-10', 350, 600),
(6, 2, 'AZI-2026-001', '2026-05-01', '2027-05-01', 900, 1400),
(7, 3, 'THE-2026-001', '2026-02-01', '2027-02-01', 700, 1100),
(8, 3, 'VD3-2026-001', '2026-01-01', '2026-11-25', 500, 800);

-- 8. Inventory
INSERT INTO inventory
(warehouse_id, batch_id, quantity, minimum_quantity)
VALUES
(1, 1, 150, 30),
(1, 2, 20, 40),
(1, 3, 80, 20),
(1, 4, 100, 25),
(2, 5, 15, 30),
(2, 6, 60, 20),
(2, 7, 10, 25),
(3, 8, 50, 20);

-- 9. Purchases
INSERT INTO purchases
(supplier_id, warehouse_id, purchase_date, total_amount, status)
VALUES
(1, 1, '2026-10-01', 51000, 'completed'),
(2, 2, '2026-10-05', 90000, 'completed'),
(3, 3, '2026-10-10', 25000, 'completed');

-- 10. Purchase Items
INSERT INTO purchase_items
(purchase_id, batch_id, quantity, unit_price)
VALUES
(1, 1, 100, 300),
(1, 2, 100, 210),
(2, 3, 100, 800),
(2, 6, 100, 900),
(3, 4, 50, 400),
(3, 8, 50, 500);

-- 11. Customers
INSERT INTO customers
(full_name, phone, email)
VALUES
('Ali Nurmagambetov', '+77011111111', 'ali@mail.com'),
('Aruzhan Sadykova', '+77012222222', 'aruzhan@mail.com'),
('Dias Bekov', '+77013333333', 'dias@mail.com'),
('Madina Askarova', '+77014444444', 'madina@mail.com');

-- 12. Sales
INSERT INTO sales
(branch_id, warehouse_id, customer_id, sale_date, total_amount, prescription_number)
VALUES
(1, 1, 1, '2026-11-01 10:30:00', 1500, NULL),
(1, 1, 2, '2026-11-02 12:15:00', 1200, 'RX-001'),
(2, 2, 3, '2026-11-03 14:00:00', 1800, 'RX-002'),
(3, 3, 4, '2026-11-04 16:30:00', 1600, NULL);

-- 13. Sale Items
INSERT INTO sale_items
(sale_id, batch_id, quantity, unit_price, discount)
VALUES
(1, 1, 2, 500, 0),
(1, 2, 1, 350, 0),
(2, 3, 1, 1200, 0),
(3, 6, 1, 1400, 0),
(3, 7, 1, 1100, 0),
(4, 8, 2, 800, 0);

-- 14. Payments
INSERT INTO payments
(sale_id, amount, payment_method, payment_status)
VALUES
(1, 1350, 'Cash', 'completed'),
(2, 1200, 'Card', 'completed'),
(3, 1800, 'Card', 'completed'),
(4, 1600, 'Cash', 'completed');

-- 15. Returns
INSERT INTO returns
(sale_id, customer_id, reason, total_refund)
VALUES
(1, 1, 'Customer changed mind', 500);

-- 16. Return Items
INSERT INTO return_items
(return_id, sale_item_id, batch_id, quantity, refund_amount)
VALUES
(1, 1, 1, 1, 500);

COMMIT


SELECT 'medicines' AS table_name, COUNT(*) AS total FROM medicines
UNION ALL
SELECT 'categories', COUNT(*) FROM categories
UNION ALL
SELECT 'manufacturers', COUNT(*) FROM manufacturers
UNION ALL
SELECT 'suppliers', COUNT(*) FROM suppliers
UNION ALL
SELECT 'branches', COUNT(*) FROM branches
UNION ALL
SELECT 'warehouses', COUNT(*) FROM warehouses
UNION ALL
SELECT 'medicine_batches', COUNT(*) FROM medicine_batches
UNION ALL
SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL
SELECT 'purchases', COUNT(*) FROM purchases
UNION ALL
SELECT 'purchase_items', COUNT(*) FROM purchase_items
UNION ALL
SELECT 'sales', COUNT(*) FROM sales
UNION ALL
SELECT 'sale_items', COUNT(*) FROM sale_items
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'returns', COUNT(*) FROM returns
UNION ALL
SELECT 'return_items', COUNT(*) FROM return_items;