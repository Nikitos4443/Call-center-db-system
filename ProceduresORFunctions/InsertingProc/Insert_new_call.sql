CREATE OR REPLACE PROCEDURE new_call(
    _operator_id INT,
    _client_id INT,
    _duration INTERVAL,
    _issue_category_id INT,
    _description VARCHAR,
    _status VARCHAR
)
    LANGUAGE plpgsql
AS $$
DECLARE
    _call_id INT;
BEGIN
    INSERT INTO calls
    VALUES(default, _operator_id, _client_id, NOW(), _duration)
    RETURNING id INTO _call_Id;

    INSERT INTO issues
    VALUES(default, _issue_category_id, _description, _status, _call_id);
END;
$$;



CALL new_call(2, 3, '6 mins', 6, 'Клієнт хоче підписати новий договір', 'Закрите');
