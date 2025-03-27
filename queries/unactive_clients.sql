SET enable_seqscan = OFF;
EXPLAIN ANALYZE SELECT c.id, c.name, c.surname, c.email
FROM clients c
    LEFT JOIN calls cs ON c.id = cs.client_id
    AND cs.date >= NOW() - INTERVAL '30 day'
WHERE cs IS NULL;

-- calls date