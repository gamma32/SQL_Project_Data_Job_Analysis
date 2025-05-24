-- CTE common table expressions 
-- Defines a temporary results that can be referenced to Select , Insert, Update, or  Delete ACTIONS
-- It is defined with key word "WITH"
With January_Jobs as (-- CTE starts here...
                    select * from job_postings_fact
                    where extract  (month from job_posted_date)=1
                    )
 Select JJ.* from January_Jobs  JJ limit 10;

select co.company_id, co.name CoName 
from company_dim co
where co.company_id 
    in (  select f.company_id --, f.job_no_degree_mention
            from job_postings_fact f
        where f.job_no_degree_mention = TRUE )
order by co.company_id        
limit 10 ;
 

    