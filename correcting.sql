DELETE FROM mail
WHERE id < 101;

ALTER SEQUENCE issues_id_seq RESTART WITH 1;

SET CLIENT_ENCODING TO 'UTF8';

SELECT c.name, c.surname, COUNT(*) AS occurrences
FROM clients c
GROUP BY c.name, c.surname
HAVING COUNT(*) > 1;

ALTER TABLE mail_client
Add date DATE DEFAULT NOW();

DROP TABLE operator_schedule;

DELETE FROM operators_report
WHERE id < 5000;

UPDATE issues
SET status = SUBSTRING(status FROM 2);


ALTER TABLE operators_report
ALTER calls_duration TYPE INTERVAL;

ALTER TABLE calls RENAME COLUMN new_duration TO duration;

UPDATE calls
SET new_duration = duration::TEXT::INTERVAL;

SELECT setval('calls_id_seq', 1, true);

CREATE TABLE temp_table AS
SELECT * FROM calls;

CREATE TABLE temp_table_issues AS
SELECT * FROM issues;

SELECT * FroM temp_table;

DELETE FROM issues
WHERE id > 600;

WITH data_to_insert AS (
    SELECT issue_category_id, description, status, call_id+360 AS call_id
    FROM issues
)
INSERT INTO issues (issue_category_id, description, status, call_id)
SELECT issue_category_id, description, status, call_id
FROM temp_table_issues;

DELETE FROM calls
WHERE id < 1000000;

SELECT client_id, id FROM calls
WHERE date>'2023-08-01' AND date < '2023-08-31'
AND id IN (
    SELECT call_id FROM issues
                   WHERE status='Оброблюється'
    );

INSERT INTO calls
VALUES(20000, 13, 91, '2023-08-19', '3 mins');

DELETE FROM calls WHERE id=20000;

INSERT INTO issues
VALUES(default, 13, 'ЗАпитує про щось', 'Оброблюється', 14397);

DELETE FROM calls WHERE date='2024-12-17'

SELECT c.name, cs.date, i.description FROM clients c
INNER JOIN calls cs ON cs.client_id = c.id
INNER JOIN issues i ON i.call_id=cs.id
WHERE i.description='Клієнт хоче підписати новий договір'

SELECT id FROM operators o
WHERE o.id IN (
    SELECT operator_id FROM calls c
        WHERE c.date > NOW() - INTERVAL '1 month'
)



WITH ids AS (
    SELECT id
    FROM issues
    WHERE description = 'Клієнт хоче підписати новий договір'
    ORDER BY id
    LIMIT 95
),
     ids_with_call_ids AS (
         SELECT id, 16416 + ROW_NUMBER() OVER () - 1 AS new_call_id
         FROM ids
     )
UPDATE issues
SET call_id = ids_with_call_ids.new_call_id
FROM ids_with_call_ids
WHERE issues.id = ids_with_call_ids.id;


