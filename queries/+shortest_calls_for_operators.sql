SELECT o.name, o.surname, EXTRACT(EPOCH FROM c.duration) FROM operators o
INNER JOIN calls c ON c.operator_id=o.id
WHERE c.duration = (
    SELECT MIN(duration)
    FROM calls
    WHERE operator_id=o.id
)
ORDER BY duration;