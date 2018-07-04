DROP TABLE IF EXISTS rpt_job;
CREATE TABLE IF NOT EXISTS rpt_job(
web_id STRING COMMENT 'web id',
web_type STRING COMMENT 'website type, fixed 01, 02',
job_url STRING COMMENT 'job url',
job_name STRING COMMENT 'job name',
job_location STRING COMMENT 'job location',
joblocation_type STRING COMMENT 'dim_joblocation.joblocation_type',
edu STRING COMMENT 'education',
edu_type STRING COMMENT 'dim_edu.edu_type',
gender STRING COMMENT 'gender',
language STRING COMMENT 'language',
major STRING COMMENT 'major',
work_year STRING COMMENT 'work years',
workyear_type STRING COMMENT 'dim_workyear.workyear_type',
salary STRING COMMENT 'salary',
salary_type STRING COMMENT 'dim_salary.salary_type',
job_date STRING COMMENT 'job date',
company_name STRING COMMENT 'company name',
vip_flg STRING COMMENT 'is vip jobinfo, 0 or 1')
COMMENT 'dm_job left join dim_* , the output data dump into hbase'
PARTITIONED BY ( `pt` STRING COMMENT 'job post date(format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
NULL DEFINED AS '' 
STORED AS SEQUENCEFILE;
