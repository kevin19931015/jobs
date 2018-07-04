INSERT INTO TABLE rpt_job PARTITION (pt)
    SELECT
    web_id,
    web_type,
    job_url,
    job_name,
    job_location,
    CASE
    WHEN (job_location LIKE '%北京%' = TRUE)    THEN 'A1'
    WHEN (job_location LIKE '%上海%' = TRUE)    THEN 'A2'
    WHEN (job_location LIKE '%广州%' = TRUE)THEN 'A3'
    WHEN (job_location LIKE '%深圳%' = TRUE)    THEN 'A4'
    WHEN (job_location LIKE '%南京%' = TRUE)    THEN 'A5'
    WHEN (job_location LIKE '%杭州%' = TRUE)    THEN 'A6'
    ELSE 'A9'
    END  AS joblocation_type,
    edu,
    CASE
    WHEN (edu LIKE '%大专%' = TRUE OR edu LIKE '%专科%' = TRUE)    THEN 'B1'
    WHEN (edu LIKE '%本科%' = TRUE)    THEN 'B2'
    WHEN (edu LIKE '%硕士%' = TRUE OR edu LIKE '%研究生%' = TRUE)    THEN 'B3'
    ELSE 'B9'
    END  AS edu_type,
    gender,
    language,
    major,
    work_year,
    CASE
    WHEN (work_year LIKE '%经验不限%' = TRUE OR work_year LIKE '%1年%' = TRUE OR work_year LIKE '%２年%' = TRUE)    THEN 'C1'
    WHEN (work_year LIKE '%３年%' = TRUE OR work_year LIKE '%４年%' = TRUE OR work_year LIKE '%５年%' = TRUE)    THEN 'C2'
    WHEN (work_year LIKE '%６年%' = TRUE OR work_year LIKE '%７年%' = TRUE OR work_year LIKE '%８年%' = TRUE)THEN 'C3'
    ELSE 'C9'
    END  AS workyear_type,
    salary,
    parse_salary(salary) AS salary_type,
    job_date,
    company_name,
    vip_flg,
    pt
    FROM dm_job
    where pt='20180702';