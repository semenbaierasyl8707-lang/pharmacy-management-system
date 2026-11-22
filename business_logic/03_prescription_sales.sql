-- PHARMACY MANAGEMENT SYSTEM
-- BUSINESS LOGIC 03. PRESCRIPTION SALES

-- 1. Рецепт қажет ететін дәрілер
SELECT
    medicine_id,
    medicine_name,
    prescription_required
FROM medicines
WHERE prescription_required = TRUE;

-- 2. Рецепт қажет ететін дәрілердің сатылымдары
SELECT
    s.sale_id,
    m.medicine_name,
    s.prescription_number,
    si.quantity,
    si.unit_price
FROM sales s
JOIN sale_items si
    ON s.sale_id = si.sale_id
JOIN medicine_batches mb
    ON si.batch_id = mb.batch_id
JOIN medicines m
    ON mb.medicine_id = m.medicine_id
WHERE m.prescription_required = TRUE;

-- 3. Әр сатылымда рецепт нөмірінің бар-жоғын тексеру
SELECT
    s.sale_id,
    s.prescription_number,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM sale_items si
            JOIN medicine_batches mb
                ON si.batch_id = mb.batch_id
            JOIN medicines m
                ON mb.medicine_id = m.medicine_id
            WHERE si.sale_id = s.sale_id
              AND m.prescription_required = TRUE
        )
        AND s.prescription_number IS NOT NULL
            THEN 'Prescription recorded'
        WHEN EXISTS (
            SELECT 1
            FROM sale_items si
            JOIN medicine_batches mb
                ON si.batch_id = mb.batch_id
            JOIN medicines m
                ON mb.medicine_id = m.medicine_id
            WHERE si.sale_id = s.sale_id
              AND m.prescription_required = TRUE
        )
            THEN 'Prescription missing'
        ELSE 'Prescription not required'
    END AS prescription_status
FROM sales s;