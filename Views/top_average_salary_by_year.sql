CREATE VIEW top_average_salary AS
SELECT o.id, o.name AS operator_name, o.surname AS operator_surname, AVG(opr.total_salary) AS avg_salary FROM operators o
INNER JOIN operators_report opr ON opr.operator_id=o.id
GROUP BY o.id, o.name, o.surname
ORDER BY AVG(opr.total_salary) DESC;

SELECT * FROM top_average_salary;