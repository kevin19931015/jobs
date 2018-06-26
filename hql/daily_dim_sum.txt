DROP TABLE IF EXISTS daily_dim_sum;
CREATE TABLE IF NOT EXISTS daily_dim_sum(
dim_type STRING COMMENT 'dim types',
cnt_val int COMMENT 'count(job_name) group by dim_type')
COMMENT 'daily dimisons sum info'
PARTITIONED BY ( `pt` STRING COMMENT 'job post date(format yyyymmdd)' )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
NULL DEFINED AS ''
STORED AS SEQUENCEFILE;
