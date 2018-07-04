INSERT INTO TABLE dm_job PARTITION (pt)
SELECT
web_id,
web_type,
job_url,
job_name,
job_location,
edu,
gender,
language,
major,
work_year,
salary,
job_date,
company_name,
CASE
    WHEN (company_name LIKE '%腾讯%' = TRUE OR company_name LIKE '%阿里%' = TRUE OR company_name LIKE '%百度%' = TRUE)    THEN '1'
    ELSE '0'
END  AS vip_flg,
pt
    FROM   s_job
    where  s_job.pt='20180702';