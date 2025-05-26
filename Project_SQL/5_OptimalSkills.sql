/* What are the most optimal skills to learn
    Optimal: high demand and high paying
    using two CTE and then conbine them into one by joining on skill ID
*/
With Skills_Demand as (
    Select --'top 5, Most in demand skills for a role' as "Question 2",
        sjd.skill_id, SD.skills, count(SD.Skill_id) as Skill_Demand_Count
    from job_postings_fact jpf 
        inner join skills_job_dim SJD   USING(job_id)
        inner join skills_dim SD        using (skill_id) 
    where JPF.job_title_short = 'Data Analyst' 
        and JPF.job_work_from_home = true
        and jpf.salary_year_avg is not null
    group by SJD.skill_ID  ,sjd.skill_id, SD.skills
) ,  --> this is the way to declare two or more CTEs, "WITH" is used only for the first CTE
  Average_Salary as (
    select --'Top skills based on AVG salary' as "Q4",
        sjd.skill_id, sd.skills , round(avg(jpf.salary_year_avg),2) as average_salary
    from job_postings_fact jpf
        inner join skills_job_dim sjd on jpf.job_id = sjd.job_id            
        inner join skills_dim sd on sjd.skill_id=sd.skill_id
    where jpf.job_title_short='Data Analyst' 
        and jpf.job_work_from_home =TRUE
        and jpf.salary_year_avg is not null
    group by sd.skill_id ,sjd.skill_id, SD.skills
) 

select SD.skill_id, SD.skills
    , Skill_Demand_Count, average_salary 
from Skills_Demand SD inner join Average_Salary AVS on SD.skill_id=AVS.skill_ID
where SD.Skill_Demand_Count > 10    
order by  Average_salary DESC, skill_demand_Count DESC
limit 25 
;