/*
Question: What are the top-paying data analyst jobs?

    -Identify the top 10 highest-paying Data Science roles (Data Scientist, Data Analyst, Data Engineer and so on) 
that are available remotely. 
Focuses on job postings with specified salaries (remove nulls).

Why?
     -Highlight the top-paying opportunities for Data Analysts,
 offering insights into the skills needed and so on */

---------------------- QUERY 1 ----------------------
 ----------------------------------------------------
 -- top 10 most high-payed remote roles in AVERAGE --
 ----------------------------------------------------

 SELECT job_title_short,
    
 ROUND(AVG(salary_year_avg), 0) AS average_year_salary_in_dollars
            

 FROM job_postings_fact

WHERE job_work_from_home = 'true'
    AND salary_year_avg IS NOT NULL

 GROUP BY job_title_short

 ORDER BY average_year_salary_in_dollars DESC

 LIMIT 10;

------------ THE CLEAR INSIGHT THE MORE CORE AND THEORETICSL THE JOB IS, THE BETTER IT IS PAID --------------------------------
---- Data Science (150 k), Machine Learning Engineering (148 k) and Data engineering (140k) are above the 100k dollars --------
---- Data Analysis and Buisness Analysis are paid in an aprox. average of 95k -------------------------------------------------



------------------------------------------------------ QUERY 2 ------------------------------------------------------------------
--- now I'll specify and check the most payed Data Analytics job SPECIFIC VACANCIES in this moment since I'll start my data career
--- in this sphere --


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

LIMIT 40;



-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------