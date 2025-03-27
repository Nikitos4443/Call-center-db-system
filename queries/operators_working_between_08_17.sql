SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT o.name, o.surname, o.email, os.days_of_week FROM operators o
INNER JOIN operator_schedule os ON os.operator_id=o.id
WHERE shift_start='08:00' AND shift_end='17:00';

--index operator_id