SET enable_seqscan = OFF;
EXPLAIN ANALYZE  SELECT c.id, c.name, c.surname, c.email, cs.duration FROM clients c
INNER JOIN calls cs ON cs.client_id=c.id
ORDER BY cs.duration DESC
LIMIT 10;

--duration index