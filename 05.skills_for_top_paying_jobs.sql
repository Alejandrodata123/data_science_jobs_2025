
/* 
• Look at the average salary associated with each skill for Data Analyst positions
• Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
the most financially rewarding skills to acquire or improve
*/

SELECT
     a.skills AS skills,
         ROUND(AVG(c.salary_year_avg),0) AS avg_salary


FROM skills_dim AS a
INNER JOIN skills_job_dim AS b USING (skill_id)
INNER JOIN job_postings_fact AS c USING (job_id)

WHERE (c.job_title LIKE '%Data Analyst%'
OR c.job_title LIKE '%data analyst%')
AND c.salary_year_avg IS NOT NULL


GROUP BY a.skills

ORDER BY avg_salary DESC
LIMIT 25;



/* So the most repeated skills in top payed jobs are the next ones 

        yarn	340000$
        dplyr	196250$
        fastapi	185000$
        golang	161750$
        couchbase	160515$
        vmware	147500$
        perl	141921$
        dynamodb	140000$