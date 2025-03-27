CREATE FUNCTION getEX(_id INT)
    RETURNS INTEGER
    LANGUAGE plpgsql
AS
$$
DECLARE
    hd DATE;
    years INTEGER;
BEGIN
    SELECT hire_date INTO hd
    FROM operators o
    WHERE o.id = _id;

    years := EXTRACT(YEAR FROM AGE(NOW(), hd));

    RETURN years;
END;
$$;

SELECT getEX(2)