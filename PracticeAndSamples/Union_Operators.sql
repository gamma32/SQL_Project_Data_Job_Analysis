/* problem 8 see 2:54:56 
--> get skill and skill type for each job posting in Q1
*/
Select job_title_short, job_location, job_via, job_posted_date::date
    ,salary_year_avg
from (
select * from january_jobs JJ
union ALL
select * from february_jobs
UNION ALL
select * from march_jobs
) as Q1_Job_postings
where Q1_Job_postings.salary_year_avg > 70000
    and job_title_short = 'Data Analyst'
   ORDER BY salary_year_avg desc 
/*
 select --JPF.job_id, 
    --JPF.job_posted_date,
    JPF.salary_year_avg ,
    sjd.* , SD.skills, SD.type
 from job_postings_fact JPF
    left JOIN skills_job_dim SJD on JPF.job_id = SJD.job_id
    left join skills_dim SD on SJD.skill_id=SD.skill_id
where EXTRACT(quarter from  JPF.job_posted_date ) =1
    and JPF.salary_year_avg > 70000
 limit 200 ;
*/
/*
select 'Jan' as TheMonth, job_title_short, company_id, job_location from january_jobs 
union ALL
SELECT 'Feb', job_title_short, company_id, job_location  from february_jobs 
union ALL
select 'Mar', job_title_short, company_id, job_location  from march_jobs  
order by 1
;
-- UNION excludes duplicates -- UNION ALL includes all records even if they are duplicates.
*/
