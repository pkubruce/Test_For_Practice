import time
import requests
from multiprocessing.dummy import Pool
from bs4 import BeautifulSoup
import requests
#请求头字典
headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36'
}
#在get请求内，添加user-agent
# 网页抓取 ='https://www.chunyuyisheng.com/pc/hospitallist/0/0/'

# 利用bs4抓取特定内容
def gethospitalname(url):
  response = requests.get(url, headers=headers)
  soup = BeautifulSoup(response.text, 'html.parser')
  for hospital_name in soup.find_all('div',class_="top-title"):
    print(hospital_name.string) # 医院名字输出

url = []
for i in range(7):
  newurl = 'https://www.chunyuyisheng.com/pc/hospitallist/'+str(i)+'/0/'
  url.append(newurl)

time1 = time.time()
for i in url:
  print(i)
  gethospitalname(i)

time2 = time.time()
print (time2 - time1)

delta_time = {}# 不同n下，使用pool和未使用pool的时间差值

for j in range(1,19):
  pool = Pool(j)
  time3 = time.time()
  result = pool.map(gethospitalname, url)
  pool.close()
  pool.join()
  time4 = time.time()
  delta  = (time2-time1)-(time4-time3)
  delta_time.update({str(j):delta})
  
for key,value in delta_time.items():
  print(key,value) #输出j肉眼比较时间差

# 每一次结果都不一样，差值的绝对值最大大概率出现在pool(13)
# 没有经过统计学方法做多次验证，所以取13
pool = Pool(13)
time3 = time.time()
result = pool.map(gethospitalname, url)
pool.close()
pool.join()
time4 = time.time()

print("未采用多进程所用时间：",time2-time1)
print("采用多进程(进程数量13)所用时间：",time4-time3)
