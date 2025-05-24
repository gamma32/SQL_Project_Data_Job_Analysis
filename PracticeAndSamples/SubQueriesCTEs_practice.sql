/*find the companies with the most job opennings
-- total of jobs by company
--include the company name in the results*/
select CD.name , JF.jobcount
from company_dim cd
    inner join (
                SELECT count(jpf.job_id) as JobCount , jpf.company_id
                from job_postings_fact jpf
                group by jpf.company_id
                ) as JF on cd.company_id = JF.company_id
 order by jf.jobcount desc
 ;

With JobCounts as (
    SELECT count(jpf.job_id) as JobCount , jpf.company_id
    from job_postings_fact jpf
    group by jpf.company_id
    )
select JC.JobCount, CD.name 
from company_dim CD  left JOIN JobCounts JC on  CD.company_id = JC.company_id
order by JC.jobcount desc
;
