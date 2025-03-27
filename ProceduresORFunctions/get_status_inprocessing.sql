CREATE Or REPLACE PROCEDURE get_processing()
    LANGUAGE plpgsql
AS
$$
BEGIN
    CREATE TEMP TABLE old_inprocessing (
     id SERIAL,
     issue VARCHAR,
     date DATE
    );

    INSERT INTO old_inprocessing (issue, date)
    SELECT i.description, c.date
    FROM issues i
    JOIN calls c ON i.call_id = c.id
    WHERE i.status = 'Оброблюється'
      AND c.date < NOW() - INTERVAL '1 month';
END;
$$;

CALL get_processing();

SELECT * FROM old_inprocessing
ORDER BY date;