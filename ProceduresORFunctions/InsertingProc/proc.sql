CREATE OR REPLACE PROCEDURE add()
    LANGUAGE plpgsql
AS
$$
DECLARE
    counter INT := 1;
    op_id INT;
    dur INTERVAL;
BEGIN
    WHILE counter < 96
        LOOP
        dur = INTERVAL '10 seconds' + (RANDOM() * (INTERVAL '10 minutes' - INTERVAL '10 seconds'));
        op_id = FLOOR(1 + (14) * RANDOM())::INT;
            INSERT INTO calls
            VALUES (default, op_id, counter, '2023-02-07', dur);
        counter = counter + 1;
        END LOOP;
END;
$$;

CALL add();
