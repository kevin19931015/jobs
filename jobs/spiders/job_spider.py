# -*- coding: utf-8 -*-  
import scrapy
from jobs import items


class JobSpider(scrapy.Spider):
    name = "job"
    allowed_domains = ["www.liepin.com"]
    start_urls = ['https://www.liepin.com/job/1913662711.shtml','https://www.liepin.com/cjob/750631.shtml']

    # def __init__(self):
    #     link_file = open('/home/kevin/projects/jobs/data/job_links.txt', 'r')
    #     for each_link in link_file:
    #         each_link = each_link.replace('\r', '')
    #         each_link = each_link.replace('\n', '')
    #         self.start_urls.append(each_link)
    #     link_file.close()

    def parse(self, response):
        html = scrapy.Selector(response)
        if 'cjob' in response.url:
            job_name = html.xpath('//div[@class="job-title"]/h1/text()').extract()[0].encode('utf8').strip()
            salary = html.xpath('//div[@class="job-main-title"]/strong/text()').extract()[0].encode('utf8').strip()
            company_name = html.xpath('//div[@class="job-title"]/h2/text()').extract()[0].encode('utf8').strip()
            job_location = html.xpath(
                '//div[@class="job-main"]/p[@class="job-main-tip"]/span/a/text()').extract()
            if len(job_location) > 0:
                job_location = job_location[0].encode('utf8')
            else:
                job_location = html.xpath('//div[@class="job-main"]/p[@class="job-main-tip"]/span/text()').extract()[1].encode('utf8').strip()
            desc = html.xpath('//div[@class="job-main"]/p[@class="job-qualifications"]/span/text()').extract()
            job_desc = html.xpath('//div[@class="job-info-content"]/text()').extract()[0].encode('utf8').strip()

        else:
            job_name = html.xpath('//div[@class="title-info"]/h1/text()').extract()[0].encode('utf8').strip()
            salary = html.xpath('//div[@class="job-title-left"]/p[@class="job-item-title"]/text()').extract()[0].encode('utf8').strip()
            company_name = html.xpath('//div[@class="title-info"]/h3/a/text()').extract()[0].encode('utf8').strip()
            job_location = html.xpath('//div[@class="job-title-left"]/p[@class="basic-infor"]/span/a/text()').extract()
            if len(job_location) > 0:
                job_location = job_location[0].encode('utf8')
            else:
                job_location = html.xpath('//div[@class="job-title-left"]/p[@class="basic-infor"]/span/text()').extract()[1].encode('utf8').strip()
            desc = html.xpath('//div[@class="job-qualifications"]/span/text()').extract()
            job_desc_arr = html.xpath('//div[@class="content content-word"]/text()').extract()
            job_desc = ''
            for str in job_desc_arr:
                job_desc = job_desc+str.encode('utf8')+'\n'
            job_desc =  job_desc.strip()
        edu = desc[0].strip()
        work_year = desc[1].strip()

        data = items.JobsItem()
        data['web_id'] = 'liepin'
        data['web_type'] = '1'
        data['job_url'] = response.url
        data['job_name'] = job_name
        data['job_location'] = job_location
        data['job_desc'] = job_desc
        data['salary'] = salary
        data['company_name'] = company_name
        data['edu'] = edu
        data['work_year'] = work_year
        data['company_address'] = job_location
        return data
