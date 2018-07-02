# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import sys
import json


class JobsPipeline(object):
    def process_item(self, item, spider):
        reload(sys)
        sys.setdefaultencoding('utf8')
        fname = '/home/kevin/projects/jobs/data/job_detail.txt'
        # str = json.dumps(dict(item), ensure_ascii=False) + "\n";
        # data = unicode.encode(str, 'utf-8');
        outfile = open(fname, 'a')

        outfile.write(item['web_id'] + ',' +
                      item['web_type'] + ',' +
                      item['job_url'] + ',' +
                      item['job_name'] + ',' +
                      item['job_location'] + ',' +
                      item['edu'] + ',' +
                      item['gender'] + ',' +
                      item['language'] + ',' +
                      item['major'] + ',' +
                      item['work_year'] + ',' +
                      item['salary'] + ',' +
                      item['job_date'] + ',' +
                      item['company_name'] +
                      '\n')
        return item
