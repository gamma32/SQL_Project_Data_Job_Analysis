    Select --'top 5, Most in demand skills for a role' as "Question 2",
        sjd.skill_id, SD.skills, 
        count(SD.Skill_id) as Skill_Demand_Count, 
        round(avg(jpf.salary_year_avg),2) as Average_Salary
    from job_postings_fact jpf 
        inner join skills_job_dim SJD   USING(job_id)
        inner join skills_dim SD        using (skill_id) 
    where JPF.job_title_short = 'Data Analyst' 
        and JPF.job_work_from_home = true
        and jpf.salary_year_avg is not null
    group by SJD.skill_ID  ,sjd.skill_id, SD.skills
    having count(SD.Skill_id) > 10  -- Alias field can not be referenced in Having clause.
    order by Skill_Demand_Count desc, average_salary desc
    limit 25
    ;