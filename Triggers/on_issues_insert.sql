CREATE OR REPLACE FUNCTION before_insert_issues()
    RETURNS TRIGGER AS
$$
DECLARE
    _client_id INT;
    inserting_date DATE;
    expected_date DATE;
BEGIN
    SELECT date, client_Id INTO inserting_date, _client_id FROM calls
    WHERE id=NEW.call_id;

    SELECT c.date INTO expected_date FROM calls c
    WHERE c.id IN (
        SELECT call_id FROM issues
        WHERE status='Оброблюється' AND issue_category_id=NEW.issue_category_id
    )
      AND inserting_date - INTERVAL '1 month' < c.date AND c.client_id = _client_id
    LIMIT 1;

    IF expected_date IS NOT NULL THEN
        RAISE NOTICE 'Не можна вставляти проблему, якщо вже існує проблема в того-ж клієнта з такою-ж категорією, що не була вирішена впродовж останнього місяця';
        RETURN NULL;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_before_insert_issues
    BEFORE INSERT ON issues
    FOR EACH ROW
EXECUTE FUNCTION before_insert_issues();

INSERT INTO issues
VALUES(default, 13, 'ЗАпитує про щось', 'Оброблюється', 14397);
