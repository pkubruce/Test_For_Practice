import requests  # 导入requests包

import re  # 导入re包，正则表达式使用

# 抓取QQ号

url="https://www.yiibai.com/python3"; # 需要请求的网址

html= requests.get(url) # 发送Get请求

pat= 'QQ群：(\d*)'

result= re.compile(pat).findall(html.text)

print(result)

# 抓取title标签间的内容

content= requests.get("http://www.baidu.com/") 

content.encoding=content.apparent_encoding

title= re.findall(r'<title>(.*?)</title>',content.text)

print(title)
