                                 
                                 -- 01 DATABSE REVIEW --



/* welcome to my very first public data analytics project, in which I'll get some information
about the data science current job warket. 

I uploaded a database from a course which proved to be very unseful to me, in this first
file I'll just write the code to create the database localy in my Postgres server 
and in the next files I'll get some conclusions about the skills that are most valued
in the industy, the skills needed for an entry job, the salary expectations for a senior 
role, and very much. 

Hope u find it interesting :) */


----------------------- CREATION OF THE DATABASE ------------------------------------------
CREATE DATABASE sql_course;
------------------------ TABLE CREATION ---------------------------------------------------

-- Create company_dim table with PRIMARY KEY
CREATE TABLE public.company_dim
(
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);

-- Create skills_dim table with PRIMARY KEY
CREATE TABLE public.skills_dim
(
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT
);

-- Create job_postings_fact table with PRIMARY KEY
CREATE TABLE public.job_postings_fact
(
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES public.company_dim (company_id)
);

-- Create skills_job_dim table with a composite primary key and foreign keys
CREATE TABLE public.skills_job_dim
(
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES public.job_postings_fact (job_id),
    FOREIGN KEY (skill_id) REFERENCES public.skills_dim (skill_id)
);


--------------------------------- ALTERATION OF THE TABLES---------------------------------


      -- USER POSTGRES WILL BE THE OWNER --
-- Set ownership of the tables to the postgres user
ALTER TABLE public.company_dim OWNER to postgres;
ALTER TABLE public.skills_dim OWNER to postgres;
ALTER TABLE public.job_postings_fact OWNER to postgres;
ALTER TABLE public.skills_job_dim OWNER to postgres;


     
-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_company_id ON public.job_postings_fact (company_id);
CREATE INDEX idx_skill_id ON public.skills_job_dim (skill_id);
CREATE INDEX idx_job_id ON public.skills_job_dim (job_id);





-------------------------------------------------------------------------------------------
--------------- MODIFIYING THE FILE PATHS TO UPLOAD THE CSV FILES TO EACH TABLE -----------


/*                                       ⚠️⚠️⚠️


Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM '[Insert File Path]/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '[Insert File Path]/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '[Insert File Path]/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '[Insert File Path]/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding

COPY company_dim
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

--------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------
/* HAVING UPLOADED THE FULL DATABASE NOW I'LL SELECT * FROM THE TABLES IN ORDER TO REVIEW IT */


SELECT * FROM company_dim;

SELECT * FROM job_postings_fact;

SELECT * FROM skills_dim;

SELECT * FROM skills_job_dim;

