-- DELETE from job_applied ;

INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
  )
VALUES  (1,'2025-05-20',    true,    'MVT_1.WRD',    true,    'TheCoverLetter',    'Active'  ),
 (2, '2025-05-02',true,'TheTwoResumeFile.pdf', true, 'CoverLetter2.pdf', 'active 2'),
 (3, '2025-05-03',true,'TheThreeResumeFile.pdf', true, 'CoverLetter3.pdf', 'active 3'),
 (4, '2025-05-04',true,'The4ResumeFile.pdf', true, 'CoverLetter4.pdf', 'Rejected 4');