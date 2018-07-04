INSERT INTO TABLE  dim_salary PARTITION (pt)
    SELECT
    web_type,
    job_name,
    company_name,
    salary AS salary_detail,
    parse_salary(salary) AS salary_type,
    pt
    FROM   s_job
    WHERE  s_job.pt='20180702';