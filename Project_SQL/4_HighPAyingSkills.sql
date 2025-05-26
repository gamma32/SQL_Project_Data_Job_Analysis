/*
Question: What are the top skills based on salary
-- look at the avg salary associated with each skill for Data Analyst position
*/
select 'Top skills based on AVG salary' as "Q4",
    sd.skills , round(avg(jpf.salary_year_avg),2) as average_salary
from job_postings_fact jpf
    inner join skills_job_dim sjd on jpf.job_id = sjd.job_id
        and jpf.salary_year_avg is not null and jpf.job_work_from_home
    inner join skills_dim sd on sjd.skill_id=sd.skill_id
where jpf.job_title_short='Data Analyst'
group by sd.skills
order by 3 desc 
limit 25 ;