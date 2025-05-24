-- A CASE statement in SQL is a way to apply logic within your SQL queries.
-- can be used to reclassified some values in a field.
/*
SELECT CASE
    when f.job_id=1 then 'a'
    when f.job_id=2 THEN 'b'
    else 'default value' end as TheCase
from job_postings_fact f     limit 5   ; 

 select count(job_id)  JobCount
    , case when job_location = 'New York, NY' then 'Local'
    when job_location='Anywhere' then 'Remote'
    else 'On site' end as LocationType
 from job_postings_fact f
 where  job_title_short='Data Analyst'
 GROUP BY locationType  
; */

select company_id, salary_rate, job_country, job_location, salary_hour_avg
    , case when salary_hour_avg >= 150 then 'high'
        when salary_hour_avg > 80 then 'Standard'
        when salary_hour_avg > 40 then 'Low' end as SalaryRange
 from job_postings_fact f
 where f.job_title_short='Data Analyst' and salary_rate='hour'
 order by salaryRange
 limit 100 ;