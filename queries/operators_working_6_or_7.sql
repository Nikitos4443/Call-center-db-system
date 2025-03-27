SELECT o.name, o.surname, days_of_week FROM operators o
INNER JOIN operator_schedule os ON os.operator_id=o.id
WHERE days_of_week LIKE '%6%' OR days_of_week LIKE '%7%';