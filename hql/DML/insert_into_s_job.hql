INSERT OVERWRITE TABLE  s_job PARTITION (pt)
SELECT
       distinct
       web_id,
       web_type,
       job_url,
       job_name,
    CASE
        WHEN job_location IS NULL OR TRIM(job_location) = '' THEN "--"
        ELSE job_location
    END job_location,
    CASE
        WHEN edu IS NULL OR TRIM(edu) = '' THEN "--"
        ELSE edu
    END edu,
        gender,
        language,
        major,
    CASE
        WHEN work_year IS NULL OR TRIM(work_year) = '' THEN "--"
        ELSE  work_year
    END work_year,
    CASE
        WHEN salary IS NULL OR TRIM(salary) = '' THEN "--"
        ELSE salary
    END salary,
        job_date,
        company_name,
        pt
    FROM   stg_job
    WHERE   pt = '20180702';