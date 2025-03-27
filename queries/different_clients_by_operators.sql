SELECT o.name AS operator_name, o.surname AS operatorsurname, COUNT(DISTINCT c.client_id) AS number_of_clients  FROM operators o
INNER JOIN calls c ON o.id = c.operator_id
GROUP BY o.name, o.surname
