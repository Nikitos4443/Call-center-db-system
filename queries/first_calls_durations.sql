SELECT DISTINCT ON (c.id) c.name, c.surname, c.email, cs.duration
FROM clients c
INNER JOIN calls cs ON cs.client_id = c.id
ORDER BY c.id, cs.date;