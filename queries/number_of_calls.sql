SELECT o.id, o.name, COUNT(c.id) FROM operators o
INNER JOIN calls c ON c.operator_id=o.id
GROUP BY o.id, o.name;