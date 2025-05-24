-- create a tab;e for Jan, Feb, March job records

--CREATE TABLE January_Jobs AS
    SELECT * 
    FROM job_postings_fact J 
    WHERE EXTRACT(MONTH FROM J.job_posted_date) = 1;

--CREATE TABLE February_Jobs AS
    SELECT * 
    FROM job_postings_fact J 
    WHERE EXTRACT(MONTH FROM J.job_posted_date) = 2;

--CREATE TABLE March_Jobs AS
    SELECT * 
    FROM job_postings_fact J 
    WHERE EXTRACT(MONTH FROM J.job_posted_date) = 3;

