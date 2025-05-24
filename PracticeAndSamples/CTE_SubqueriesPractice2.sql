/* Determine size category (S, M, L ) for each company by first identifying the job postings they have.
-- Use a subquery to calculate the number of job postings.
-- S for less than 10 job opennings.
-- M between 10 and 50
-- L more then 50 jobs
--> Implement subquery to aggregate job counts per company before classify them by size.
*/
with JobsCounts as (
select jpf.company_id, count(jpf.company_id) as JobsCount from job_postings_fact jpf
group by jpf.company_id )

select JC.company_id , JC.JobsCount
    , case when JC.JobsCount > 50 then 'L'
        when JC.JobsCount BETWEEN 10 and 50 then 'M'
        when JC.JobsCount <10 then 'S' end as CompanySize
, CD.name  as company_name
from JobsCounts JC INNER join company_dim CD on JC.company_id = CD.company_id
order by 2 desc;

/* Identify top 5 skills that are most frequently mentioned in job postings. Use subquery t find most used skills ID. with 
the hoghest count in Skills_Job_dim table 
-- join result with skill_dim table to get skill names. */
with SkillCounts as (
            select skill_id, count(skill_id) SkillsCount
            from skills_job_dim sjd
            GROUP by sjd.skill_id
            order by SkillsCount desc limit 5 )
SELECT SD.Skills, SC.SkillsCount from skills_dim SD inner join SkillCounts SC on SD.skill_id=SC.skill_id
;
