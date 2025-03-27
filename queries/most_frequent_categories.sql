SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT c.name, COUNT(i.id) AS issue_count
FROM issue_categories c
JOIN issues i ON c.id = i.issue_category_id
GROUP BY c.name
ORDER BY issue_count DESC
LIMIT 8;