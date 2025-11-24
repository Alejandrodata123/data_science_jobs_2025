/* Question: What are the skills required for those top payed jobs?

- We will use the second query about from the 01 file and update it to get some insight in those invaluables skills we 
want to learn */

-- I'll use 2 temporal tables CTE in order to join all the infromation we need from the tables --




------------------------------------------------------------------------
WITH second_cte AS
(-----------------------------------------------------------------------
WITH first_cte AS 
(
SELECT c.name AS company,
job_id,
    job_title,
        job_location,
            job_schedule_type,
                salary_year_avg,
                    job_posted_date

 FROM
job_postings_fact

 LEFT JOIN company_dim AS c
 USING (company_id)

 WHERE
job_title_short = 'Data Analyst' AND
job_location= 'Anywhere' AND
salary_year_avg IS NOT NULL

ORDER BY
salary_year_avg DESC

LIMIT 40 
)---------------------------------------------------------------
SELECT * 
    FROM first_cte

INNER JOIN skills_job_dim
USING (job_id)
)-----------------------------------------------------------------------
SELECT a.job_id, a.company,
          a.job_title AS title,
                a.salary_year_avg AS salary,
                    b.skills AS skill

FROM second_cte AS a
INNER JOIN skills_dim AS b
USING (skill_id)

;



--------------------------------------------------------------------------------------------------------------------------------

/* All in all, the top tier data analytic vacancies ask for a lot of skills as well as expertise I'm sure, when it comes to 
the skills I'll state here the top 5 vacancies and the skills they demand in a candidate



- Asociate director/ Data Analyst AT&T >>> sql, python, r, azure, databricks, aws, pandas, pyspark, jupyter, excel, tableau, power bi, powerpoint

- Data Analyst Pinterest >>> sql, python, r, hadoop, tableau

- Data Analyst Uclahealthcareers >>> sql, crystal, oracle, flow

- Principal Data Analyst SmartAsset >>> sql, python, go, snowflake, pandas, numpy, excel, tableaut, gitlab

- Director Data Analyst Inclusively	sql, python, oracle, snowflake, tableau, power bi, sap, jenkins,bitbucket, atlassian, jira,confluence