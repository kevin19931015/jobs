import scrapy


class LinkSpider(scrapy.Spider):
    name = "link"
    allowed_domains = ["www.liepin.com"]
    model_url = 'https://www.liepin.com/zhaopin/?curPage='
    start_urls = ['https://www.liepin.com/zhaopin/']

    # def __init__(self):
    #     for num in range(0, 100):
    #         if num>0:
    #             d_curPage = num -1
    #             self.start_urls.append(self.model_url + str(num)+'&d_curPage='+str(d_curPage))
    #         else:
    #             self.start_urls.append(self.model_url + str(num))
    def parse(self, response):
        html = scrapy.Selector(response)
        links = html.xpath('//div[@class="job-info"]/h3/a/@href').extract()
        alllink = ''
        for link in links:
            if len(link)>0:
                alllink = alllink+link+"\n"
        open("/soft/ScrapyProjects/jobs/data/job_links.txt",'a').write(alllink)

