DROP TABLE IF EXISTS dim_workyear;
CREATE TABLE IF NOT EXISTS dim_workyear(
web_type STRING COMMENT 'website type, fixed 01, 02',
job_name STRING COMMENT 'job name',
company_name STRING COMMENT 'company name',
workyear_detail STRING COMMENT 'raw data from webpage work years info',
workyear_type STRING COMMENT 'work year enum type 01,02,03')
COMMENT 'work years dimision info from s_job' 
PARTITIONED BY ( `pt` STRING COMMENT 'job post date(format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
NULL DEFINED AS ''
STORED AS SEQUENCEFILE;
