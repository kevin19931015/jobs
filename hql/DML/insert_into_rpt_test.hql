INSERT INTO TABLE rpt_test PARTITION (pt)
    SELECT
    t.name,
    t.gender,
    t.age,
    job.job,
    salary.salary,
    t.pt
    FROM test t
    LEFT OUTER JOIN  job
    ON ( t.pt = job.pt
         and t.name = job.name)
    LEFT OUTER JOIN  salary
    ON ( t.pt = salary.pt
         and t.name = salary.name)
    where t.pt='20180704';



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