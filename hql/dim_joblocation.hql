DROP TABLE IF EXISTS dim_joblocation;
CREATE TABLE IF NOT EXISTS dim_joblocation(
web_type STRING COMMENT 'website type, fixed 01, 02',
job_name STRING COMMENT 'job name',
company_name STRING COMMENT 'company name',
joblocation_detail STRING COMMENT 'raw data from webpage job location info',
joblocation_type STRING COMMENT 'job location enum type 01,02,03')
COMMENT 'job location dimision info from s_job'
PARTITIONED BY ( `pt` STRING COMMENT 'job post date(format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
NULL DEFINED AS ''
STORED AS SEQUENCEFILE;
