SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT c.name, c.surname, c.email, COUNT(DISTINCT ca.id) AS total_calls
FROM clients c
         INNER JOIN calls ca ON c.id = ca.client_id
         INNER JOIN issues i ON ca.id = i.call_id
WHERE i.issue_category_id = 2
GROUP BY c.name, c.surname, c.email
HAVING COUNT(DISTINCT ca.id) > 1;

--a little bit index issue_category_id