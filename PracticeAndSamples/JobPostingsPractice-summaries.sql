
-- 3 find companies (include company name) 
--that have posted jobs affering Health Insurance and posting were made on 2Q of 2023
-- use extract to filter by quarter
select cd.name, jpf.job_health_insurance, jpf.job_posted_date
    ,EXTRACT (quarter from jpf.job_posted_date) -- ,jpf.* 
from job_postings_fact jpf 
    left join company_dim cd on jpf.company_id=cd.company_id
where jpf.job_health_insurance = TRUE
    and extract(month from jpf.job_posted_date ) in (4, 5, 6)
    and extract(year from jpf.job_posted_date) =2023
limit 10
;



--2  Number of job postings for each month in 2023 adjusting time date to be 
-- America / NY time zone before extracting the month.
-- Assume job_posted Date is stored in UTC 
-- group by and order by the month
/*
select count(jpf.job_posted_date) as JobCount
    --, jpf.job_posted_date 
    , extract (month from jpf.job_posted_date at Time Zone 'EST') PostMonth
    --, jpf.* 
from job_postings_fact jpf
where EXTRACT (year from jpf.job_posted_date ) = 2023
GROUP BY PostMonth
order by 2
--limit 10 
;
*/

-- 1 get a list of avg salary for both yearly and hourly for job postings after June 1st 2023
-- group the reult by job schedule type
/*
SELECT avg(jf.salary_hour_avg) AvgPerHour, avg(jf.salary_year_avg) AvgPerYear
    , jf.job_schedule_type
--, jf.job_posted_date
from job_postings_fact jf 
where jf.job_posted_date > '2023-06-01'::date
GROUP BY jf.job_schedule_type
--limit 5
;
*/

