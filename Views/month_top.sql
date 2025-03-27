CREATE VIEW durationsByMonth AS
SELECT TO_CHAR(date, 'yyyy-MM') AS month,
       SUM(calls_duration)
FROM operators_report op
GROUP BY date
ORDER BY SUM(calls_duration) DESC
LIMIT 10;

SELECT * FROM durationsByMonth;


