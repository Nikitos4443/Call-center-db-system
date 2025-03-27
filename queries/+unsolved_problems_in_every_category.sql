SELECT c.name AS category_name, COUNT(i.id) AS in_process FROM issue_categories c
INNER JOIN issues i ON i.issue_category_id=c.id
WHERE i.status!='Закрите'
GROUP BY c.name;