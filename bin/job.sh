#!/usr/bin/env bash
echo 清空老数据...
rm /home/kevin/projects/jobs/data/job_detail.txt
echo 开始收集信息...
scrapy crawl job &> /home/kevin/projects/jobs/logs/job.log
echo 收集结束.