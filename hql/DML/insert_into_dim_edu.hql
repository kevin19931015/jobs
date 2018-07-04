INSERT INTO TABLE dim_edu PARTITION (pt)
SELECT  web_type,
        job_name,
        company_name,
        edu AS edu_detail,
        CASE
        WHEN (edu LIKE '%大专%' = TRUE OR edu LIKE '%专科%' = TRUE)    THEN 'B1'
        WHEN (edu LIKE '%本科%' = TRUE)    THEN 'B2'
        WHEN (edu LIKE '%硕士%' = TRUE OR edu LIKE '%研究生%' = TRUE)    THEN 'B3'
        ELSE 'B9'
        END  AS edu_type,
        pt
        FROM   s_job
        where  s_job.pt='20180702';