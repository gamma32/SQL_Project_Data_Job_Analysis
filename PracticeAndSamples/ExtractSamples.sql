SELECT f.job_posted_date 
, EXTRACT (year from f.job_posted_date) as TheYear -- works as a function (part od date , from a field name)
, EXTRACT (month from f.job_posted_date) as TheMonth
, f.job_posted_date 
, f.job_posted_date at time zone 'UTC' at TIME zone 'EST' as "TimeZoned_EST"
, f.job_posted_date at time zone 'UTC'  as "TimeZoned_UTC"
,VERSION()
from job_postings_fact f 
LIMIT 15 ;

select count(jf.company_id) as JobPostedCount
    , EXTRACT ( month from jf.job_posted_date ) as JobMonth
from job_postings_fact jf 
where jf.job_title = 'Data Analyst'
group by JobMonth --, jf.job_title
-- HAVING jf.job_title = 'Data Analyst'
order by 2 ;
