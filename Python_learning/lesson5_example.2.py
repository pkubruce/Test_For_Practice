"""爬猫眼"""
import requests
import re
# 猫眼电影网站有反爬虫措施，设置headers后可以爬取
headers = {
    'Content-Type': 'text/plain; charset=UTF-8',
    'Origin': 'https://maoyan.com',
    'Referer': 'https://maoyan.com/board/4',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
}
# 爬取网页源代码
def get_one_page(url, headers):
    try:
        response = requests.get(url, headers=headers)
        if response.status_code == 200:
            return response.text
        return None
    except Exception:
        return None

# 正则表达式提取信息
def parse_one_page(html):
    pattern = re.compile('<dd>.*?name"><a'
                         + '.*?>(.*?)</a>.*?star">(.*?)</p>.*?releasetime">(.*?)</p>.*?integer">(.*?)</i>.*?fraction">(.*?)</i>.*?</dd>',re.S)
    items = re.findall(pattern, html)
    for item in items:
        yield {
            'title': item[0],
            'actor': item[1].strip()[3:],
            'time': item[2].strip()[5:],
            'score': item[3] + item[4]
        }


def main(offset):
    url = "https://maoyan.com/board/4?offset=" + str(offset)
    html = get_one_page(url, headers) 
    for item in parse_one_page(html):
        print(item)
    
if __name__ == '__main__':

    # 对每一页信息进行爬取
    for i in range(10):
        main(i * 10)
        



