import requests
#请求头字典
headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36'
}
#在get请求内，添加user-agent
response = requests.get(url='https://www.chunyuyisheng.com/pc/hospitallist/0/0/', headers=headers)# 网页抓取
print(response.status_code)  # 200
print(response.text)

# 利用bs4抓取特定内容
from bs4 import BeautifulSoup
soup = BeautifulSoup(response.text, 'html.parser') 
print(soup.prettify()) #显示一个好看的结构

hospital_name=soup.find_all('div',class_="top-title") # 抓取医院名字部分
hospital_order=soup.find_all('div',class_="sub-title")# 抓取排名部分
  
for hospital_name in soup.find_all('div',class_="top-title"):
  print(hospital_name.string) # 医院名字输出
  

 
for hospital_order in soup.find_all('div',class_="sub-title"):
  print(hospital_order.contents[0]) # 排名输出

# 所要结果
for i in range(10):
  print("医院排名：",hospital_order[i].contents[0],"医院名字：",hospital_name[i].string)# 根据前面的测试，将输出结果做一个拼接
