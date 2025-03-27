SET enable_seqscan = OFF;
EXPLAIN ANALYZE  SELECT
    o.name AS operator_name,
    o.surname AS operator_surname,
    c.name AS client_name,
    c.surname AS client_surname,
    cs.duration AS calls_duration
FROM operators o
    INNER JOIN calls cs ON cs.operator_id=o.id
    INNER JOIN clients c ON cs.client_id = c.id
    WHERE cs.duration BETWEEN '3 mins' AND '6 mins';

--duration
