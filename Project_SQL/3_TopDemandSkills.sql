/*
with SummarySkills as (
        select count(RS.job_id) JobsCount, RS.skill_id 
        from (
                    SELECT jpf.job_id, sjd.skill_id --, job_work_from_home
                    from job_postings_fact jpf inner JOIN skills_job_dim sjd on jpf.job_id=sjd.job_id
                    where jpf.job_work_from_home = true  
                        and jpf.job_title_short='Data Analyst'
            ) as RS
        GROUP BY RS.skill_id
        order by JobsCount DESC limit 5
) 
SELECT 'Skills required for those top paying role' as "Question 1", SK.JobsCount, SK.skill_id, SD.skills --SD.skills , SummarySkills.JobsCount 
from skills_dim SD inner join SummarySkills SK on SD.skill_id=SK.skill_id
order by SK.JobsCount desc
; */

Select 'top 5, Most in demand skills for a role' as "Question 2",
    SD.skills, count(SD.Skill_id) as Skill_Demand_Count
from job_postings_fact jpf 
    inner join skills_job_dim SJD   USING(job_id)
    inner join skills_dim SD        using (skill_id) 
   where JPF.job_title_short = 'Data Analyst' and JPF.job_work_from_home
group by SD.skill_ID
order by 3 desc
limit 5 ;   

   /*
Question: What are top paying jobs for my role?
--1 What are the skills required for those top paying role?
--2 What are the most in demand skills for my role
--3 What are the top Skills for my role
--4 what are top skills based on salary for my role.
--5 What are the most optimal skills to learn
    --a High demand and high paying.
*/