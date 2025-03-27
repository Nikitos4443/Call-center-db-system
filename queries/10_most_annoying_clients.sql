SET enable_seqscan = OFF;
EXPLAIN ANALYZE  SELECT cl.id, cl.name,cl.surname, COUNT(c.client_id) AS number_of_calls FROM clients cl
right JOIN calls c ON cl.id = c.client_id
GROUP BY cl.id, cl.name, cl.surname
ORDER BY COUNT(c.client_id) DESC
LIMIT 10;

--client_id index