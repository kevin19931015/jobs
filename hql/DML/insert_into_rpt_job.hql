INSERT INTO TABLE rpt_job PARTITION (pt)
    SELECT
    dmj.web_id,
    dmj.web_type,
    dmj.job_url,
    dmj.job_name,
    dmj.job_location,
    dim_joblocation.joblocation_type,
    dmj.edu,
    '1',
    dmj.gender,
    dmj.language,
    dmj.major,
    dmj.work_year,
    '1',
    dmj.salary,
    '1',
    dmj.job_date,
    dmj.company_name,
    dmj.vip_flg,
    dmj.pt
    FROM dm_job dmj
    LEFT OUTER JOIN  dim_joblocation
    ON ( dmj.pt = dim_joblocation.pt
         and dmj.web_type = dim_joblocation.web_type
         and dmj.job_name = dim_joblocation.job_name
         and dmj.company_name = dim_joblocation.company_name
         and dmj.job_location = dim_joblocation.joblocation_detail)
    LEFT OUTER JOIN  dim_edu
    ON ( dmj.pt = dim_edu.pt
         and dmj.web_type = dim_edu.web_type
         and dmj.job_name = dim_edu.job_name
         and dmj.company_name = dim_edu.company_name
         and dmj.edu = dim_edu.edu_detail     )
    LEFT OUTER JOIN  dim_workyear
    ON ( dmj.pt = dim_workyear.pt
         and dmj.web_type = dim_workyear.web_type
         and dmj.job_name = dim_workyear.job_name
         and dmj.company_name = dim_workyear.company_name
         and dmj.work_year = dim_workyear.workyear_detail     )
    LEFT OUTER JOIN  dim_salary
    ON ( dmj.pt = dim_salary.pt
         and dmj.web_type = dim_salary.web_type
         and dmj.job_name = dim_salary.job_name
         and dmj.company_name = dim_salary.company_name
         and dmj.salary = dim_salary.salary_detail     )
    where dmj.pt='20180702';