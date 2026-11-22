-- ==========================================
-- PHARMACY MANAGEMENT SYSTEM
-- 01. CREATE TABLES
-- ==========================================

-- 1. Categories
CREATE TABLE categories (
    category_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 2. Manufacturers
CREATE TABLE manufacturers (
    manufacturer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    manufacturer_name VARCHAR(150) NOT NULL,
    country VARCHAR(100),
    contact_phone VARCHAR(30)
);

-- 3. Suppliers
CREATE TABLE suppliers (
    supplier_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    country VARCHAR(100),
    phone VARCHAR(30),
    email VARCHAR(100)
);

-- 4. Branches
CREATE TABLE branches (
    branch_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_name VARCHAR(150) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(100),
    phone VARCHAR(30)
);

-- 5. Medicines
CREATE TABLE medicines (
    medicine_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    medicine_name VARCHAR(150) NOT NULL,
    category_id INTEGER NOT NULL,
    manufacturer_id INTEGER NOT NULL,
    description TEXT,
    prescription_required BOOLEAN DEFAULT FALSE,
    active BOOLEAN DEFAULT TRUE
);

-- 6. Warehouses
CREATE TABLE warehouses (
    warehouse_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INTEGER NOT NULL,
    warehouse_name VARCHAR(150) NOT NULL,
    address TEXT
);

-- 7. Medicine Batches
CREATE TABLE medicine_batches (
    batch_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    medicine_id INTEGER NOT NULL,
    supplier_id INTEGER NOT NULL,
    batch_number VARCHAR(100) NOT NULL,
    manufacture_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    purchase_price NUMERIC(12,2) NOT NULL,
    sale_price NUMERIC(12,2) NOT NULL
);

-- 8. Inventory
CREATE TABLE inventory (
    inventory_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    warehouse_id INTEGER NOT NULL,
    batch_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0,
    minimum_quantity INTEGER DEFAULT 10,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 9. Purchases
CREATE TABLE purchases (
    purchase_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    warehouse_id INTEGER NOT NULL,
    purchase_date DATE DEFAULT CURRENT_DATE,
    total_amount NUMERIC(12,2) DEFAULT 0,
    status VARCHAR(30) DEFAULT 'completed'
);

-- 10. Purchase Items
CREATE TABLE purchase_items (
    purchase_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    purchase_id INTEGER NOT NULL,
    batch_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(12,2) NOT NULL
);

-- 11. Customers
CREATE TABLE customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30),
    email VARCHAR(100),
    registration_date DATE DEFAULT CURRENT_DATE
);

-- 12. Sales
CREATE TABLE sales (
    sale_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_id INTEGER NOT NULL,
    warehouse_id INTEGER NOT NULL,
    customer_id INTEGER,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(12,2) DEFAULT 0,
    prescription_number VARCHAR(100)
);

-- 13. Sale Items
CREATE TABLE sale_items (
    sale_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sale_id INTEGER NOT NULL,
    batch_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(12,2) NOT NULL,
    discount NUMERIC(12,2) DEFAULT 0
);

-- 14. Payments
CREATE TABLE payments (
    payment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sale_id INTEGER NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount NUMERIC(12,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(30) DEFAULT 'completed'
);

-- 15. Returns
CREATE TABLE returns (
    return_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sale_id INTEGER NOT NULL,
    customer_id INTEGER,
    return_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reason TEXT,
    total_refund NUMERIC(12,2) DEFAULT 0
);

-- 16. Return Items
CREATE TABLE return_items (
    return_item_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    return_id INTEGER NOT NULL,
    sale_item_id INTEGER NOT NULL,
    batch_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    refund_amount NUMERIC(12,2) NOT NULL
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;