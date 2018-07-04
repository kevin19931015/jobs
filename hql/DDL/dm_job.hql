DROP TABLE IF EXISTS dm_job;
CREATE TABLE IF NOT EXISTS dm_job(
web_id STRING COMMENT 'web id ',
web_type STRING COMMENT 'website type, fixed 01, 02 ',
job_url STRING COMMENT 'job url ',
job_name STRING COMMENT 'job name ',
job_location STRING COMMENT 'job location ',
edu STRING COMMENT 'education ',
gender STRING COMMENT 'gender ',
language STRING COMMENT 'language ',
major STRING COMMENT 'major ',
work_year STRING COMMENT 'work years ',
salary STRING COMMENT 'salary ',
job_date STRING COMMENT 'jobdate',
company_name STRING COMMENT 'company name ',
vip_flg STRING COMMENT 'is vip jobinfo, 0 or 1')
COMMENT 'compute vip flag from s_job'
PARTITIONED BY ( `pt` STRING COMMENT 'job post date(format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
NULL DEFINED AS ''
STORED AS SEQUENCEFILE;
