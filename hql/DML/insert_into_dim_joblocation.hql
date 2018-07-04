INSERT INTO TABLE  dim_joblocation PARTITION (pt)
    SELECT
    web_type,
    job_name,
    company_name,
    job_location AS joblocation_detail,
    CASE
    WHEN (job_location LIKE '%北京%' = TRUE)    THEN 'A1'
    WHEN (job_location LIKE '%上海%' = TRUE)    THEN 'A2'
    WHEN (job_location LIKE '%广州%' = TRUE)THEN 'A3'
    WHEN (job_location LIKE '%深圳%' = TRUE)    THEN 'A4'
    WHEN (job_location LIKE '%南京%' = TRUE)    THEN 'A5'
    WHEN (job_location LIKE '%杭州%' = TRUE)    THEN 'A6'
    ELSE 'A9'
    END  AS joblocation_type,
    pt
    FROM   s_job
    where  s_job.pt='20180702';