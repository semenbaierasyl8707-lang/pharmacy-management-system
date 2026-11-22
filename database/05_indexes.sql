-- ==========================================
-- PHARMACY MANAGEMENT SYSTEM
-- 05. CREATE INDEXES
-- ==========================================

-- Medicines
CREATE INDEX idx_medicines_name
ON medicines(medicine_name);

CREATE INDEX idx_medicines_category
ON medicines(category_id);

-- Medicine batches
CREATE INDEX idx_batches_expiry
ON medicine_batches(expiry_date);

CREATE INDEX idx_batches_medicine
ON medicine_batches(medicine_id);

CREATE INDEX idx_batches_supplier
ON medicine_batches(supplier_id);

-- Inventory
CREATE INDEX idx_inventory_warehouse
ON inventory(warehouse_id);

CREATE INDEX idx_inventory_batch
ON inventory(batch_id);

-- Sales
CREATE INDEX idx_sales_date
ON sales(sale_date);

CREATE INDEX idx_sales_branch
ON sales(branch_id);

CREATE INDEX idx_sales_customer
ON sales(customer_id);

-- Sale items
CREATE INDEX idx_sale_items_sale
ON sale_items(sale_id);

-- Purchases
CREATE INDEX idx_purchases_date
ON purchases(purchase_date);

-- Customers
CREATE INDEX idx_customers_name
ON customers(full_name);

-- Returns
CREATE INDEX idx_returns_date
ON returns(return_date);

SELECT
    tablename,
    indexname
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;


CREATE INDEX IF NOT EXISTS idx_medicines_name ON medicines(medicine_name);
CREATE INDEX IF NOT EXISTS idx_medicines_category ON medicines(category_id);

CREATE INDEX IF NOT EXISTS idx_batches_expiry ON medicine_batches(expiry_date);
CREATE INDEX IF NOT EXISTS idx_batches_medicine ON medicine_batches(medicine_id);
CREATE INDEX IF NOT EXISTS idx_batches_supplier ON medicine_batches(supplier_id);

CREATE INDEX IF NOT EXISTS idx_inventory_warehouse ON inventory(warehouse_id);
CREATE INDEX IF NOT EXISTS idx_inventory_batch ON inventory(batch_id);

CREATE INDEX IF NOT EXISTS idx_sales_date ON sales(sale_date);
CREATE INDEX IF NOT EXISTS idx_sales_branch ON sales(branch_id);
CREATE INDEX IF NOT EXISTS idx_sales_customer ON sales(customer_id);

CREATE INDEX IF NOT EXISTS idx_sale_items_sale ON sale_items(sale_id);

CREATE INDEX IF NOT EXISTS idx_purchases_date ON purchases(purchase_date);

CREATE INDEX IF NOT EXISTS idx_customers_name ON customers(full_name);

CREATE INDEX IF NOT EXISTS idx_returns_date ON returns(return_date);


SELECT tablename, indexname
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;