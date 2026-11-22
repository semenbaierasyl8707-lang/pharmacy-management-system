-- ==========================================
-- PHARMACY MANAGEMENT SYSTEM 03. PRIMARY AND FOREIGN KEYS
-- ==========================================

-- Medicines
ALTER TABLE medicines
ADD CONSTRAINT fk_medicines_categories
FOREIGN KEY (category_id)
REFERENCES categories(category_id);

ALTER TABLE medicines
ADD CONSTRAINT fk_medicines_manufacturers
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers(manufacturer_id);

-- Warehouses
ALTER TABLE warehouses
ADD CONSTRAINT fk_warehouses_branches
FOREIGN KEY (branch_id)
REFERENCES branches(branch_id);

-- Medicine Batches
ALTER TABLE medicine_batches
ADD CONSTRAINT fk_batches_medicines
FOREIGN KEY (medicine_id)
REFERENCES medicines(medicine_id);

ALTER TABLE medicine_batches
ADD CONSTRAINT fk_batches_suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);

-- Inventory
ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_warehouses
FOREIGN KEY (warehouse_id)
REFERENCES warehouses(warehouse_id);

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_batches
FOREIGN KEY (batch_id)
REFERENCES medicine_batches(batch_id);

-- Purchases
ALTER TABLE purchases
ADD CONSTRAINT fk_purchases_suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);

ALTER TABLE purchases
ADD CONSTRAINT fk_purchases_warehouses
FOREIGN KEY (warehouse_id)
REFERENCES warehouses(warehouse_id);

-- Purchase Items
ALTER TABLE purchase_items
ADD CONSTRAINT fk_purchase_items_purchases
FOREIGN KEY (purchase_id)
REFERENCES purchases(purchase_id);

ALTER TABLE purchase_items
ADD CONSTRAINT fk_purchase_items_batches
FOREIGN KEY (batch_id)
REFERENCES medicine_batches(batch_id);

-- Sales
ALTER TABLE sales
ADD CONSTRAINT fk_sales_branches
FOREIGN KEY (branch_id)
REFERENCES branches(branch_id);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_warehouses
FOREIGN KEY (warehouse_id)
REFERENCES warehouses(warehouse_id);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- Sale Items
ALTER TABLE sale_items
ADD CONSTRAINT fk_sale_items_sales
FOREIGN KEY (sale_id)
REFERENCES sales(sale_id);

ALTER TABLE sale_items
ADD CONSTRAINT fk_sale_items_batches
FOREIGN KEY (batch_id)
REFERENCES medicine_batches(batch_id);

-- Payments
ALTER TABLE payments
ADD CONSTRAINT fk_payments_sales
FOREIGN KEY (sale_id)
REFERENCES sales(sale_id);

-- Returns
ALTER TABLE returns
ADD CONSTRAINT fk_returns_sales
FOREIGN KEY (sale_id)
REFERENCES sales(sale_id);

ALTER TABLE returns
ADD CONSTRAINT fk_returns_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- Return Items
ALTER TABLE return_items
ADD CONSTRAINT fk_return_items_returns
FOREIGN KEY (return_id)
REFERENCES returns(return_id);

ALTER TABLE return_items
ADD CONSTRAINT fk_return_items_sale_items
FOREIGN KEY (sale_item_id)
REFERENCES sale_items(sale_item_id);

ALTER TABLE return_items
ADD CONSTRAINT fk_return_items_batches
FOREIGN KEY (batch_id)
REFERENCES medicine_batches(batch_id);



SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS foreign_table,
    ccu.column_name AS foreign_column
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
ORDER BY tc.table_name;