-- PHARMACY MANAGEMENT SYSTEM
-- 08. PROCEDURES AND FUNCTIONS

-- 1. Дәрінің жалпы қоймадағы санын есептеу
CREATE OR REPLACE FUNCTION get_medicine_quantity(p_medicine_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    total_quantity INT;
BEGIN
    SELECT COALESCE(SUM(i.quantity), 0)
    INTO total_quantity
    FROM inventory i
    JOIN medicine_batches mb
        ON i.batch_id = mb.batch_id
    WHERE mb.medicine_id = p_medicine_id;

    RETURN total_quantity;
END;
$$;

-- Функцияны тексеру
SELECT get_medicine_quantity(1);


-- 2. Дәрінің ағымдағы бағасын анықтау
CREATE OR REPLACE FUNCTION get_medicine_price(p_medicine_id INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    current_price NUMERIC;
BEGIN
    SELECT sale_price
    INTO current_price
    FROM medicine_batches
    WHERE medicine_id = p_medicine_id
    ORDER BY expiry_date DESC
    LIMIT 1;

    RETURN current_price;
END;
$$;

-- Функцияны тексеру
SELECT get_medicine_price(1);