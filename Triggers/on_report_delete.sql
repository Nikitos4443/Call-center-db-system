CREATE OR REPLACE FUNCTION before_delete_report()
    RETURNS TRIGGER AS
$$
BEGIN
    IF(OLD.date > NOW() - INTERVAL '6 month') THEN
        RAISE NOTICE 'Не можна видаляти звіти, що були сформовані за останні 6 місяців';
        RETURN NULL;
    END IF;

    RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_before_delete_report
    BEFORE DELETE ON operators_report
    FOR EACH ROW
EXECUTE FUNCTION before_delete_report();

DELETE FROM operators_report
WHERE date='2024-08-31'