CREATE OR REPLACE PROCEDURE delete_old_closed_issues()
    LANGUAGE plpgsql
AS
$$
BEGIN
DELETE FROM issues
WHERE status = 'Закрите' AND description != 'Клієнт хоче підписати новий договір'
  AND call_id IN (
    SELECT id FROM calls
    WHERE date < NOW() - INTERVAL '18 month'
    );

RAISE NOTICE 'Старі закриті запити успішно видалено';
END;
$$;

CALL delete_old_closed_issues();