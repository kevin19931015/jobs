DROP TABLE IF EXISTS dim_edu;
CREATE TABLE IF NOT EXISTS dim_edu(
web_type STRING COMMENT 'website type, fixed 01, 02',
job_name STRING COMMENT 'job name',
company_name STRING COMMENT 'company name',
edu_detail STRING COMMENT 'raw data from webpage edu info',
edu_type STRING COMMENT 'edu enum type 01,02,03')
COMMENT 'edu dimision info from s_job'
PARTITIONED BY ( `pt` STRING COMMENT 'job post date(format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
NULL DEFINED AS ''
STORED AS SEQUENCEFILE;
