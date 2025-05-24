/* Find the count of number of remote jobs postings per skill
    -- dispaly top 5 skills by their demand in remote jobs.
    -- Include skil ID, name, and coount of postings requiring the skill */
   
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
   SELECT SK.JobsCount, SK.skill_id, SD.skills --SD.skills , SummarySkills.JobsCount 
   from skills_dim SD inner join SummarySkills SK on SD.skill_id=SK.skill_id
   order by SK.JobsCount desc
   ;

/*
   SELECT count(job_id) JobCountPerSkill, skill_id
   from skills_job_dim sjd 
   group by sjd.skill_id
   order by JobCountPerSkill desc
   limit 5; */