CREATE OR REPLACE FUNCTION before_update_clients()
    RETURNS TRIGGER AS
$$
BEGIN
    RAISE NOTICE 'Value: %', LENGTH(NEW.phone);
    IF NEW.phone NOT LIKE '+380%' OR LENGTH(NEW.phone) != 13 THEN
        RAISE NOTICE 'Некоректний номер телефону, правильний має починатися з +380 і мати 13 символів';
        RETURN NULL;
    END IF;

    IF NEW.email NOT LIKE '%@%.%' THEN
        RAISE NOTICE 'Некоректний імейл';
        RETURN NULL;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_before_update_clients
    BEFORE UPDATE OR INSERT ON clients
    FOR EACH ROW
EXECUTE FUNCTION before_update_clients();

UPDATE clients
SET email='ggg'
WHERE id=48
