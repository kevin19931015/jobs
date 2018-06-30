# -*- coding: utf-8 -*-  
import scrapy
from jobs import items

class JobSpider(scrapy.Spider):

    name = "job"
    allowed_domains = ["www.liepin.com"]
    start_urls = []

    def __init__(self):
        link_file = open('/home/kevin/projects/jobs/data/job_links.txt', 'r')
        for each_link in link_file:
            each_link = each_link.replace('\r', '')
            each_link = each_link.replace('\n', '')
            self.start_urls.append(each_link)
        link_file.close()

    def parse(self, response):
        html = scrapy.Selector(response)
        if 'cjob' not in response.url:
            job_name = html.xpath('//div[@class="title-info"]/h1/text()').extract()[0].encode('utf8').strip()
            salary = html.xpath('//div[@class="job-title-left"]/p[@class="job-item-title"]/text()').extract()[0].encode('utf8').strip()
            company_name = html.xpath('//div[@class="title-info"]/h3/a/text()').extract()[0].encode('utf8').strip()
            company_url = html.xpath('//div[@class="title-info"]/h3/a/@href').extract()[0].encode('utf8').strip()
            job_location = html.xpath('//div[@class="job-title-left"]/p[@class="basic-infor"]/span/a/text()').extract()
            if len(job_location)>0:
                job_location = job_location[0].encode('utf8')
            else:
                job_location = html.xpath('//div[@class="job-title-left"]/p[@class="basic-infor"]/span/text()').extract()[0].encode('utf8')
            job_date = html.xpath('//div[@class="job-title-left"]/p[@class="basic-infor"]/time/@title').extract()[0].encode('utf8')
            desc = html.xpath('//div[@class="job-qualifications"]/span/text()').extract()
            job_desc_arr = html.xpath('//div[@class="content content-word"]/text()').extract()
            job_desc = ''
            for str in job_desc_arr:
                job_desc = job_desc+str.encode('utf8')+'\n'
            job_desc =  job_desc.strip()
            language = desc[2].encode('utf8').strip()
            major = html.xpath('//div[@class="content"]/ul/li/label/text()').extract()[1].encode('utf8').strip()
            edu = desc[0].encode('utf8').strip()
            work_year = desc[1].encode('utf8').strip()

        data = items.JobsItem()
        data['web_id'] = 'liepin'
        data['web_type'] = '1'
        data['job_url'] = response.url
        data['job_name'] = job_name
        data['job_location'] = job_location
        data['job_desc'] = job_desc
        data['edu'] = edu
        data['gender'] = '不限'
        data['language'] = language
        data['major'] = major
        data['work_year'] = work_year
        data['salary'] = salary
        data['job_date'] = job_date
        data['company_name'] = company_name

        yield scrapy.Request(company_url, meta={'data': data}, callback=self.company_parse)


    def company_parse(self, response):
        html = scrapy.Selector(response)
        company_desc_arr = html.xpath('//p[@class="profile"]/text()').extract()
        company_desc= ''
        for str in company_desc_arr:
            company_desc = company_desc + str.encode('utf8') + '\n'
        company_desc = company_desc.strip()
        company_info = html.xpath('//ul[@class="new-compintro"]/li').extract()
        for info in company_info:
            htm = scrapy.http.HtmlResponse(url="my HTML string", body=info.encode('utf8').strip())
            title_info = htm.xpath('//span/text()').extract()[0].encode('utf8').strip()
            print info.encode('utf8').strip()
            print title_info
            if title_info.startswith('公司地址'):
                company_address = htm.xpath('//li/text()').extract()[0].encode('utf8').strip()

            if title_info.startswith('公司规模'):
                company_scale = htm.xpath('//li/text()').extract()[0].encode('utf8').strip()
        company_worktype = html.xpath('//ul[@class="new-compintro"]/li/a/text()').extract()[0].encode('utf8').strip()
        company_prop = '不详'
        company_website = '不详'
        data = response.meta['data']
        data['company_desc'] = company_desc
        data['company_address'] = company_address
        data['company_worktype'] = company_worktype
        data['company_scale'] = company_scale
        data['company_prop'] = company_prop
        data['company_website'] = company_website
        return data
