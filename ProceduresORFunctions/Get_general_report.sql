CREATE OR REPLACE FUNCTION get_rep(_date DATE)
    RETURNS TABLE(call_duration INTERVAL, number_of_calls INT, unsolved_problems INT)
    LANGUAGE plpgsql
AS
$$
    DECLARE
        cd INTERVAL;
        noc INT;
        up INT;
BEGIN
        SELECT SUM(duration), COUNT(duration) INTO cd,noc FROM calls c
        WHERE c.date <= _date AND c.date >= _date - INTERVAL '1 month';

        SELECT COUNT(*) INTO up FROM issues i
        INNER JOIN calls c ON i.call_id=c.id
        WHERE c.date <= _date AND c.date >= _date - INTERVAL '1 month' AND i.status!='Закрите';

    RETURN QUERY
        SELECT cd, noc, up;
END;
$$;

SELECT * FROM get_rep('2024-06-25');