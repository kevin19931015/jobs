# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import sys


class JobsPipeline(object):
    def process_item(self, item, spider):
        reload(sys)
        sys.setdefaultencoding('utf8')
        fname = '/soft/ScrapyProjects/jobs/data/job_detail.txt'
        outfile = open(fname, 'a')
        outfile.write(item['job_name'] + ',' + item['company'] + ',' + item['salary'] + ',' + item['work_year'] + ',' + item['edu'] + ',' + item['age'] + '\n')
        return item
