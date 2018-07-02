DROP TABLE IF EXISTS s_job;
CREATE TABLE IF NOT EXISTS s_job(
web_id STRING COMMENT 'web id',
web_type STRING COMMENT 'website type, 01, 02,...',
job_url STRING COMMENT 'job url',
job_name STRING COMMENT 'job name',
job_location STRING COMMENT 'job location',
job_date STRING COMMENT 'job date',
edu STRING COMMENT 'education',
gender STRING COMMENT 'gender',
language STRING COMMENT 'language',
major STRING COMMENT 'major',
work_year STRING COMMENT 'work years',
salary STRING COMMENT 'salary',
company_name STRING COMMENT 'company name')
COMMENT 'all flat data from webpage'
PARTITIONED BY ( `pt` STRING COMMENT 'job post date (format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
NULL DEFINED AS ''
STORED AS TEXTFILE ;
