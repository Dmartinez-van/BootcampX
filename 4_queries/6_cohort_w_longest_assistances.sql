SELECT cohorts.name AS cohort_name, AVG(completed_at - started_at) AS MAX_average_assistance_time
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohort_name
ORDER BY MAX_average_assistance_time DESC
LIMIT 1;