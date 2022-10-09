import time
import requests
from multiprocessing.dummy import Pool

def getresource(url):
    html = requests.get(url)
   
    
url = []
for i in range(1,11):
    newpage = 'http://tieba.baidu.com/p/3522395718?pn=' + str(i)
    url.append(newpage)

time1 = time.time()
for i in url:
    getresource(i)
time2 = time.time()
print (time2 - time1)

pool = Pool(8)
time3 = time.time()
result = pool.map(getresource, url)
pool.close()
pool.join()
time4 = time.time()
print (time4 - time3)