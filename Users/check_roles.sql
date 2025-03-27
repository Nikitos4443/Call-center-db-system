SELECT * FROM issues;

DELETE FROM issues
WHERE id=100;

INSERT INTO mail_client
VALUES(default, 9, 1, NOW());

CREATE TABLE temp (
    id SERIAL,
    name VARCHAR
);

DROP TABLE temp;

SELECT COUNT(grantor), grantee
FROM information_schema.role_table_grants
WHERE grantee != 'postgres' AND grantee != 'PUBLIC'
GROUP BY grantee;

SELECT rolname
FROM pg_roles
WHERE rolname NOT LIKE 'pg%';
