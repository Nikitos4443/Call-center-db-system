CREATE OR REPLACE FUNCTION is_operator_working(_operator_id INT, check_date DATE)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
    DECLARE
        work_days INT[];
        day_of_week INT;
BEGIN

SELECT string_to_array(days_of_week, ',')::INT[]
INTO work_days
FROM operator_schedule
WHERE operator_id = _operator_id;

IF work_days IS NULL THEN
        RETURN FALSE;
END IF;

    day_of_week := EXTRACT(ISODOW FROM check_date);

RETURN day_of_week = ANY(work_days);
END;
$$;

SELECT is_operator_working(1, '2024-11-09');
