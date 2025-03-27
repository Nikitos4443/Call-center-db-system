CREATE OR REPLACE FUNCTION get_schedule(_operator_id INT)
    RETURNS TABLE
            (
                operator_name       VARCHAR,
                operator_surname    VARCHAR,
                current_days_of_week VARCHAR,
                current_shift_start  TIME,
                current_shift_end    TIME
            )
    LANGUAGE plpgsql
AS
$$
DECLARE
    op_name         VARCHAR;
    op_surname      VARCHAR;
    _days_of_week_OLD VARCHAR;
    _days_of_week_NEW VARCHAR;
    _shift_start  TIME;
    _shift_end    TIME;

BEGIN
    SELECT name, surname
    INTO op_name, op_surname
    FROM operators
    WHERE id = _operator_id;

    SELECT days_of_week, shift_start, shift_end
    INTO  _days_of_week_OLD, _shift_start, _shift_end
    FROM operator_schedule
    WHERE operator_id=_operator_id;

    RAISE NOTICE 'Value: %', _days_of_week_OLD;

    SELECT string_agg(
                   CASE
                       WHEN day = '1' THEN 'Понеділок'
                       WHEN day = '2' THEN 'Вівторок'
                       WHEN day = '3' THEN 'Середа'
                       WHEN day = '4' THEN 'Четвер'
                       WHEN day = '5' THEN 'П''ятниця'
                       WHEN day = '6' THEN 'Субота'
                       WHEN day = '7' THEN 'Неділя'
                       END, ', '
           ) INTO _days_of_week_NEW
    FROM unnest(string_to_array( _days_of_week_OLD, ', ')) AS day;

    RAISE NOTICE 'Value: %', _days_of_week_NEW;

    RETURN QUERY
        SELECT op_name, op_surname, _days_of_week_NEW, _shift_start, _shift_end;
END
$$;

SELECT * FROM get_schedule(2);

