const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2];
// const limit = process.argv[3] || 5;
const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher;
`;
console.log('connected...');
pool.query(queryString, [`%${cohort}%`])
  .then(res => {
    res.rows.forEach(teacher => {
      // console.log(teacher);
      console.log(`${teacher.cohort}: ${teacher.teacher}`);
    });
    pool.end();
  }).catch(err => console.error('query error', err.stack));