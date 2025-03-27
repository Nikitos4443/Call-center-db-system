SELECT solution FROM issue_solutions
WHERE issue_category_id = (
    SELECT id FROM issue_categories
    WHERE name='Технічні проблеми'
);