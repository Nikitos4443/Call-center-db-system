CREATE OR REPLACE PROCEDURE callIn()
    LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO calls (operator_id, client_id, date, duration)
    WITH random_data AS (
        SELECT
            FLOOR(1 + (14) * RANDOM())::INT AS operator_id,
            (DATE '2023-01-01' + (RANDOM() * (DATE '2024-11-30' - DATE '2023-01-01'))::INT) AS random_date
        FROM generate_series(1, 20000)
    )
    SELECT
        rd.operator_id,
        FLOOR(1 + (94) * RANDOM())::INT AS client_id,
        rd.random_date,
        INTERVAL '10 seconds' + (RANDOM() * (INTERVAL '10 minutes' - INTERVAL '10 seconds')) AS duration
    FROM random_data rd
    WHERE is_operator_working(rd.operator_id, rd.random_date);
END;
$$;

CALL callIn();