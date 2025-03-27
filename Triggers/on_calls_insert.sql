CREATE OR REPLACE FUNCTION before_insert_calls()
    RETURNS TRIGGER AS
$$
    DECLARE
        id_to_delete INT;
BEGIN
    IF NOT is_operator_working(NEW.operator_Id, NEW.date) THEN
        RAISE NOTICE 'Це не робочий день оператора';
        RETURN NULL;
    END IF;

    SELECT id INTO id_to_delete FROM calls cs
    WHERE cs.id NOT IN (
        SELECT call_id FROM issues
            WHERE description='Клієнт хоче підписати новий договір'
    )
    ORDER BY date
    LIMIT 1;

    RAISE NOTICE 'Trigger';

    DELETE FROM calls WHERE id = id_to_delete;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_before_insert_calls
    BEFORE INSERT ON calls
    FOR EACH ROW
EXECUTE FUNCTION before_insert_calls();

INSERT INTO calls
VALUES (default, 1, 5, '2024-11-03', '3 mins')
