SELECT teachers.name as teacher_name, count(assistance_requests.*)
FROM assistance_requests
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teacher_name;