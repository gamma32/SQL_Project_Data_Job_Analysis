drop table job_applied;

CREATE TABLE job_applied (
job_id int,
application_sent_date DATE,
custom_resume boolean,
resume_file_name VARCHAR(255),
cover_letter_sent boolean,
cover_letter_file_name VARCHAR(255),
status VARCHAR(50)
);


