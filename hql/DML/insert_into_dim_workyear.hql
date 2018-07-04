INSERT INTO TABLE  dim_workyear PARTITION (pt)
    SELECT
    web_type,
    job_name,
    company_name,
    work_year AS workyear_detail,
    CASE
    WHEN (work_year LIKE '%经验不限%' = TRUE OR work_year LIKE '%1年%' = TRUE OR work_year LIKE '%２年%' = TRUE)    THEN 'C1'
    WHEN (work_year LIKE '%３年%' = TRUE OR work_year LIKE '%４年%' = TRUE OR work_year LIKE '%５年%' = TRUE)    THEN 'C2'
    WHEN (work_year LIKE '%６年%' = TRUE OR work_year LIKE '%７年%' = TRUE OR work_year LIKE '%８年%' = TRUE)THEN 'C3'
    ELSE 'C9'
    END  AS workyear_type,
    pt
    FROM   s_job
    where  s_job.pt='20180702';