# install selenium（需要关闭clash）
# 用不了ajax
# 所以只有模拟点击了
import requests, time
from bs4 import BeautifulSoup
import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By # 加载by才能使用
from selenium.webdriver.chrome.service import Service as ChromeService
import re
# 分析网页
headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36'
}

# use selenium
opt = webdriver.ChromeOptions()
driver = webdriver.Chrome(options=opt) # 用chrome当然也可以用别的
driver.get('http://bmfw.www.gov.cn/hsjcjgcx/index.html')

# 定义一个抓取机构信息的函数
def get_institution(page_content):
    url_content = BeautifulSoup(page_content,'html.parser')
    search_content = url_content.find_all('div',class_="search-content")
    name_of_content = [] # 机构名字
    place_of_content = [] # 所在区县
    phone_of_content = [] # 联系电话
    address_of_content = [] # 机构地址
    content_extract = []
    for content in search_content:
        content = BeautifulSoup(str(content),'html.parser')
        name_extract = content.find('p', class_="li-title").text
        name_of_content.append(name_extract)
        place_extract = content.find_all('span', class_="detail-content")[0].text
        place_of_content.append(place_extract)
        phone_extract = content.find_all('span', class_="detail-content")[1].text
        phone_of_content.append(phone_extract)
        address_extract = content.find_all('span', class_="detail-content")[2].text
        address_of_content.append(address_extract)
        content_once = [name_extract,place_extract,phone_extract,address_extract]
        content_extract.append(content_once)
    return(name_of_content, place_of_content, phone_of_content, address_of_content,content_extract)
# x_test = []

# get_institution(driver.page_source)[0] # try 成功了
# x_test.extend(get_institution(driver.page_source)[4])
# 上述三行为测试代码，用extend作为添加

# 开始找到要点击的要素
# 2是北京 2~34+1=35
name_extract = [] # 提取机构名字
place_extract = []# 提取机构所处区县
phone_extract = []# 提取机构电话
address_extract = [] # 提取所在地址
content_extract = []
time1 = time.time()
for i in range(2,35):
    driver.find_element(By.XPATH,"//ul[@class='province']/li["+str(i)+"]").click() # 找到点击的省份 
    time.sleep(3)# 得先暂停一下，要不然反映不过来
    province_content = BeautifulSoup(driver.page_source,'html.parser')  # 页面内容，是一个str和response.text一样
    pages_box_extract = province_content.find('div',class_="pages-box").find_all('button') # 页面提取
    max_pages = pages_box_extract[len(pages_box_extract)-3].text # 页面最大值
    # 这里加一个循环 # 因为每一次点击之后页面都不一样
    for page_num in range(1,int(max_pages)):
        driver.find_element(By.XPATH,"//div[@class='pages-box']/button[@id='nextPage']").click()
        time.sleep(5) #等待加载 给点反映时间
        name_extract.extend(get_institution(driver.page_source)[0])
        place_extract.extend(get_institution(driver.page_source)[1])
        phone_extract.extend(get_institution(driver.page_source)[2])
        address_extract.extend(get_institution(driver.page_source)[3])
        content_extract.extend(get_institution(driver.page_source)[4])
        time.sleep(3) # 给足够的时间 休息

time2 = time.time()
time2-time1 #20535.069386720657s
import pandas as pd
import cpca
df_content = pd.DataFrame(columns=['name','place','phone','address'],data = content_extract)
df_place = cpca.transform(df_content['place'])
# type(df_place) data.frame
df_addrress = cpca.transform(df_content['address'])
df_place.columns = ['所属省','所属市','所属区','所属地址','adcode']
df_addrress.columns = ['地址省','地址市','地址区','具体地址','adcode_address']
df_content.columns = ['机构名字','所属地区','电话','地址']

df_bind = pd.concat([df_content,df_place,df_addrress],axis=1)
df_bind.to_csv('Python_learning/机构.csv',encoding = 'utf_8_sig')
driver.close()
