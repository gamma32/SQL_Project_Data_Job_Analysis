
-- Subqueries is a nested query inside a larger query
SELECT outerQuery.* 
from (  Select s.skill_id, s.skills SKILLZs, s.type from skills_dim s ) as OuterQuery limit 3;

SELECT * 
from ( select * from job_postings_fact jpf 
        where extract (month from  jpf.job_posted_date ) =1 
        ) as JanuaryPostedJobs LIMIT 10;

