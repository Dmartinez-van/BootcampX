SELECT students.name AS name, AVG(assignment_submissions.duration) AS avg_completion_time
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY avg_completion_time DESC;