SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT c.name, c.surname, c.email, cs.date, COUNT(cs.id) FROM clients c
INNER JOIN calls cs ON cs.client_id=c.id
GROUP BY c.name, c.surname, c.email, cs.date
HAVING COUNT(cs.id) > 3;

--index client_id