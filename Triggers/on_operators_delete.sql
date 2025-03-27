CREATE OR REPLACE FUNCTION before_delete_operator()
    RETURNS TRIGGER AS
$$
    DECLARE
        opid INT;
BEGIN
    SELECT operator_id INTO opid FROM calls
        WHERE date > NOW() - INTERVAL '1 month' AND operator_id=OLD.id;

    IF opid IS NOT NULL THEN
        RAISE NOTICE 'Не можна видаляти опаратора, який мав дзвінки впродовж останнього місяця';
        RETURN NULL;
    END IF;

    RETURN OLD;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_before_delete_operator
    BEFORE DELETE ON operators
    FOR EACH ROW
EXECUTE FUNCTION before_delete_operator();

DELETE FROM operators
WHERE id=1;