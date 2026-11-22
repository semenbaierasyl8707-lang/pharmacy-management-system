-- PHARMACY MANAGEMENT SYSTEM
-- 04. CHECK CONSTRAINTS

ALTER TABLE medicine_batches
ADD CONSTRAINT chk_manufacture_expiry
CHECK (expiry_date > manufacture_date);

ALTER TABLE medicine_batches
ADD CONSTRAINT chk_purchase_price
CHECK (purchase_price > 0);

ALTER TABLE medicine_batches
ADD CONSTRAINT chk_sale_price
CHECK (sale_price > 0);

ALTER TABLE inventory
ADD CONSTRAINT chk_inventory_quantity
CHECK (quantity >= 0);

ALTER TABLE inventory
ADD CONSTRAINT chk_minimum_quantity
CHECK (minimum_quantity >= 0);

ALTER TABLE purchase_items
ADD CONSTRAINT chk_purchase_item_quantity
CHECK (quantity > 0);

ALTER TABLE purchase_items
ADD CONSTRAINT chk_purchase_item_price
CHECK (unit_price > 0);

ALTER TABLE sale_items
ADD CONSTRAINT chk_sale_item_quantity
CHECK (quantity > 0);

ALTER TABLE sale_items
ADD CONSTRAINT chk_sale_item_price
CHECK (unit_price > 0);

ALTER TABLE sale_items
ADD CONSTRAINT chk_sale_discount
CHECK (discount >= 0);

ALTER TABLE payments
ADD CONSTRAINT chk_payment_amount
CHECK (amount > 0);

ALTER TABLE return_items
ADD CONSTRAINT chk_return_quantity
CHECK (quantity > 0);

ALTER TABLE return_items
ADD CONSTRAINT chk_refund_amount
CHECK (refund_amount >= 0);

ALTER TABLE inventory
ADD CONSTRAINT chk_inventory_quantity
CHECK (quantity >= 0);