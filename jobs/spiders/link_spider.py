# -*- coding: utf-8 -*-
import scrapy


class LinkSpider(scrapy.Spider):
    name = "link"
    allowed_domains = ["www.liepin.com"]
    model_url = 'https://www.liepin.com'
    start_urls = ['https://www.liepin.com/zhaopin/']

    def parse(self, response):
        html = scrapy.Selector(response)
        links = html.xpath('//div[@class="job-info"]/h3/a/@href').extract()
        alllink = ''
        for link in links:
            if link.startswith("https"):
                alllink = alllink + link + "\n"
        open("/home/kevin/projects/jobs/data/job_links.txt", 'a').write(alllink)

        page_urls = html.xpath('//div[@class="pagerbar"]/a/@href').extract()

        next_url = self.model_url + page_urls[7]

        yield scrapy.Request(next_url, callback=self.parse)
