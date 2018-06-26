import scrapy
from jobs import items

class JobSpider(scrapy.Spider):
    name = "job"
    allowed_domains = ["www.liepin.com"]
    start_urls = []

    def __init__(self):
        link_file = open('/soft/ScrapyProjects/jobs/data/job_links.txt', 'r')
        for each_link in link_file:
            each_link = each_link.replace('\r', '')
            each_link = each_link.replace('\n', '')
            self.start_urls.append(each_link)
        link_file.close()

    def parse(self, response):
        html = scrapy.Selector(response)
        job_name = html.xpath('//div[@class="title-info"]/h1/text()').extract()[0].encode('utf8')
        salary = html.xpath('//div[@class="job-title-left"]/p[@class="job-item-title"]/text()').extract()[0].encode('utf8').strip()
        company = html.xpath('//div[@class="title-info"]/h3/a/text()').extract()[0].encode('utf8')
        company_location = html.xpath('//div[@class="job-title-left"]/p[@class="basic-infor"]/span/a/text()').extract()[0].encode('utf8')
        desc = html.xpath('//div[@class="job-qualifications"]/span/text()').extract()
        edu = desc[0]
        work_year = desc[1]
        age = desc[3]
        data = items.JobsItem()
        data['job_name'] = job_name
        data['salary'] = salary
        data['company'] = company
        data['edu'] = edu
        data['work_year'] = work_year
        data['age'] = age
        data['company_location'] = company_location
        return data
