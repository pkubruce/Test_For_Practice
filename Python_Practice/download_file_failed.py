import requests
from multiprocessing.dummy import Pool
from bs4 import BeautifulSoup
import re

#请求头字典
headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36'
}

url = "https://data.cnki.net/trade/Yearbook/Single/N2022010155?zcode=Z020"

response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.text, 'html.parser')

year_url = soup.find_all('div',class_="s_year clearfix")[0].select('a') 
# 加个0选出转化为Tag，不加则无法用select操作

url_download = {} # 创建一个 字典储存年份和链接

for url_sub in year_url:
  url_download_head = re.search("(/)(N[0-9]*)(\\?)",url_sub.get('href')).group(2) # 根据文件命名提取对应的前面
  url_download_combine = "https://data.cnki.net/download/excel?filecode="+url_download_head+"000009" # 下载文件的链接
  url_year = url_sub.get_text()
  url_download.update({url_year:url_download_combine})


 
with open('Python_Practice/download.txt', 'a', encoding='utf8') as file:
  for key,values in url_download.items():
    file.write(values+'\n')
# failed

