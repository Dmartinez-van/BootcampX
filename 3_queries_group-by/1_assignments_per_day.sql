SELECT day, COUNT(*) AS total_submissions
FROM assignments
GROUP BY day 
ORDER BY day; 