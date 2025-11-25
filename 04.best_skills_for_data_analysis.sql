/* most demanded skill for Data Analysis */


-- Most in demand for Data Analysis: --





-- QUERY 1 (SHORT) -- DOUBLE INNER JOIN --

-------------------------------------------------------------------


SELECT c.skill_id AS id_skill,
     c.skills AS skill,
         COUNT (a.job_id) AS n_vacancies_where_required

FROM job_postings_fact AS a


INNER JOIN skills_job_dim AS b USING (job_id)
INNER JOIN skills_dim AS c USING (skill_id)

WHERE a.job_title LIKE '%Data Analyst%' OR a.job_title LIKE '%data analyst%'

GROUP BY c.skill_id
ORDER BY n_vacancies_where_required DESC
;




-- QUERY 2 -- LONER ONE CTE --
------------------------------

    WITH cte_1 AS 
(
SELECT *
FROM job_postings_fact


INNER JOIN skills_job_dim
USING (job_id)

WHERE job_postings_fact.job_title LIKE '%Data Analyst%' 
OR job_postings_fact.job_title LIKE '%data analyst%'

)
SELECT b.skill_id AS id_skill, b.skills AS skill, COUNT(job_id) AS n_vacancies_where_required
FROM cte_1 AS a

INNER JOIN skills_dim AS b
USING (skill_id)

GROUP BY b.skill_id

ORDER BY n_vacancies_where_required DESC

LIMIT 20;

----------------------------------------------
--CONCLUSIONS--
----------------------------------------------

/*


 for data Analytics the top skills are 
1- sql  2- excel    3- python   4- tableau  5- power bi
    6- r    7- sas    8- PowerP
    
    
*/

