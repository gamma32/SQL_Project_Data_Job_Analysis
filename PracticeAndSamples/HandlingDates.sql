Select t.job_posted_date , t.job_posted_date::DATE as "OnlyDate"
, '2025/05/21' as "TheString"
    , '2025-05-20':: DATE as "TheDate"
    , '124'::integer as "TheInteger"
    , 1::boolean as "TheBoolean" , 'false'::Boolean as "TheBoolean2"
    ,'3.14'::Real as "The Real"
from job_postings_fact t
LIMIT 5 ;

SELECT j.job_location, job_title, job_country, j.job_posted_date
, j.job_posted_date at time zone 'UTC' at TIME zone 'EST' as "TimeZoned_EST"
-- EST is five hours behind UTC
from job_postings_fact j 
LIMIT 5; 
