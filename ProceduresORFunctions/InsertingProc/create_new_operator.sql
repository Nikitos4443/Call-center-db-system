CREATE OR REPLACE PROCEDURE create_operator(
    _name VARCHAR,
    _surname VARCHAR,
    _email VARCHAR,
    _has_higher_education BIT
)
    LANGUAGE plpgsql
AS
$$
    DECLARE
        _phone VARCHAR;
BEGIN

    SELECT phone INTO _phone FROM operators_phones
    WHERE operator_id IS NULL
    LIMIT 1;

    IF _phone IS NULL THEN
        RAISE NOTICE 'Неможливо додати нового оператора, бо не знайдено вільних телефонів';
        RETURN;
    END IF;

    INSERT INTO operators
    VALUES(default, _name, _surname, _email, CURRENT_DATE, _has_higher_education);
END;
$$;

CALL create_operator('salaga', 'pokemon', '222@gmail.com', B'0');


