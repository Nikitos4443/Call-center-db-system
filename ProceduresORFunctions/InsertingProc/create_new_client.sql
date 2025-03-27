CREATE OR REPLACE PROCEDURE create_client(
    _name VARCHAR,
    _surname VARCHAR,
    _email VARCHAR,
    _phone VARCHAR,
    _address VARCHAR,
    _operator_id INT,
    _duration INTERVAL
)
    LANGUAGE plpgsql
AS
$$
DECLARE
    _client_id INT;
    _call_id INT;
    _date DATE:= TO_CHAR(NOW(), 'YYYY-MM-DD');
BEGIN
    INSERT INTO clients
    VALUES(default, _name, _surname, _email, _phone, _address)
    RETURNING id INTO _client_id;

    INSERT INTO calls
    VALUES(default, _operator_id, _client_id, _date, _duration)
    RETURNING id INTO _call_id;

    INSERT INTO issues
    VALUES(default, 6, 'Клієнт хоче підписати новий договір', 'Оброблюється', _call_id);
END;
$$;


CALL create_client('Andriy', 'Ponchick', 'andriy_ponchick@example.com', '+380877852398', 'вул. Червоноармійська 15, Київ', 2, '8 mins')