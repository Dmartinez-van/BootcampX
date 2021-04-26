SELECT students.name AS name, ROUND(AVG(assignment_submissions.duration),2) AS avg_completion_time, ROUND(AVG(assignments.duration),2) AS avg_estimated_time
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY avg_completion_time;