SELECT o.name, o.surname, p.phone FROM operators o
INNER JOIN operators_phones p ON p.operator_id=o.id;