DROP TABLE IF EXISTS dim_salary;
CREATE TABLE IF NOT EXISTS dim_salary(
web_type STRING COMMENT 'website type, fixed 01, 02',
job_name STRING COMMENT 'job name',
company_name STRING COMMENT 'company name',
salary_detail STRING COMMENT 'raw data from webpage salary info',
salary_type STRING COMMENT 'salary enum type 01,02,03')
COMMENT 'job salary dimision info from s_job'
PARTITIONED BY ( `pt` STRING COMMENT 'job post date(format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
NULL DEFINED AS ''
STORED AS SEQUENCEFILE;
