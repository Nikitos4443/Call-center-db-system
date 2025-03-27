CREATE VIEW number_of_calls_by_month AS
SELECT o.name AS operator_name, o.surname AS operator_surname, TO_CHAR(c.date, 'yyyy-mm') AS month, COUNT(c.operator_id) AS number_of_calls
FROM operators o
INNER JOIN calls c ON o.id = c.operator_id
GROUP BY o.name, o.surname, month
ORDER BY month DESC;

SELECT * FROM number_of_calls_by_month;

