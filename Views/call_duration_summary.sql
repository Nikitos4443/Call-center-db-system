CREATE VIEW total_category_durations AS
SELECT
    CASE
        WHEN cs.duration < INTERVAL '3 mins' THEN 'Short'
        WHEN cs.duration BETWEEN '3 mins' AND '7 mins' THEN 'Medium'
        ELSE 'Long'
        END AS call_duration_category, COUNT(*)
FROM calls cs
GROUP BY call_duration_category;

SELECT * FROM total_category_durations;
