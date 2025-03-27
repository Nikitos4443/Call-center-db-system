SELECT ic.name AS category_name,
       ROUND((SELECT COUNT(*)
              FROM issues i
              WHERE i.status = 'Закрите'
                AND ic.id = i.issue_category_id) * 100 / (SELECT COUNT(*)
                                                          FROM issues i
                                                          WHERE ic.id = i.issue_category_id)) AS solved_percentage
FROM issue_categories ic
ORDER BY solved_percentage;