-- Delete this later... 5/24/25 by MVT
-- renamed later to top paying jobs 5/24/25 5:10
/* Question: What are the top paying data analyst jobs?
    -- identify top 10 highest paying roles data analyst that are available remotly.
    -- focus on job postings with specified salaries, ( remove nulls) 
    --  
*/

select f.job_id, f.job_title, f.job_location, f.job_schedule_type
    , f.salary_year_avg, f.job_posted_date , c.name as CompanyName
from job_postings_fact f
    left join company_dim c on f.company_id = c.company_id
where f.job_title_short = 'Data Analyst' and f.job_location='Anywhere'
    and f.salary_year_avg is not null
order by f.salary_year_avg desc 
limit 10
;