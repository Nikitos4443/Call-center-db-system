SELECT o.name, o.surname, o.email, cs.date
FROM operators o
    INNER JOIN calls cs ON cs.operator_id = o.id
WHERE cs.id IN (
    SELECT call_id
    FROM issues
    WHERE status != 'Закрите'
)