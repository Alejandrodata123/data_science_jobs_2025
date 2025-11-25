/* in order to have te relation between skills that are well payed and skills that are mor demanded I'll combine the querries
from file 4 and file 5 as CTEs */



WITH most_used_skills AS (
        SELECT c.skill_id AS id_skill,
        c.skills AS skills,
            COUNT (a.job_id) AS n_vacancies_where_required

    FROM job_postings_fact AS a


    INNER JOIN skills_job_dim AS b USING (job_id)
    INNER JOIN skills_dim AS c USING (skill_id)

    WHERE a.job_title LIKE '%Data Analyst%' OR a.job_title LIKE '%data analyst%'

    GROUP BY c.skill_id
), best_payed_skills AS (
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


)
SELECT *
FROM most_used_skills
INNER JOIN best_payed_skills
USING (skills)
ORDER BY n_vacancies_where_required DESC, avg_salary DESC;





/* running this query it is shown that the skills that are actually very worth to learn based on the job market are:

 
                    n_vac   avg_sal
        sql	 	    86220	99121
        excel		58792	88955
        python		52967	103517
        tableau		44964	100805
        power bi	35736	93900
        r		    28142	101144
        sas	        12666   95175


*/
