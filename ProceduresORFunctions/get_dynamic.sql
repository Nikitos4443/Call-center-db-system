CREATE OR REPLACE FUNCTION dynamic_get(_columns text, _table varchar)
    RETURNS SETOF RECORD
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY EXECUTE 'SELECT ' || _columns || ' FROM ' || _table;
END;
$$;

SELECT * FROM dynamic_get('id, name, surname, email', 'clients')
                  AS (id INT, name VARCHAR, surname VARCHAR, email VARCHAR);