--Вибрати Олександра, якого, за жовтень приймав оператор з найменшою середньою зп за останній рік

SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT
    c.id AS client_id, c.name AS client_name, c.surname AS client_surname,
    tas.id AS operator_id, tas.operator_name, tas.operator_surname
FROM clients c
         INNER JOIN calls cs ON cs.client_id=c.id
         INNER JOIN top_average_salary tas ON tas.id=cs.operator_id
WHERE c.name='Олександр' AND cs.date >= '2024-10-01' AND cs.date <= '2024-10-31'
ORDER BY tas.avg_salary
LIMIT 1;

-- index calls date