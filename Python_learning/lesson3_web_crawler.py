# r=requests.get(url,params,**kwargs) -----
# url: 需要爬取的网站地址。
# params: url中的额外参数，字典或者字节流格式，可选。
# **kwargs : 12个控制访问的参数
# 例1 ：爬取输入指定关键字的内容
import requests
kv={"wd":"袁隆平"}#拼接的内容用字典储存
r=requests.get("https://www.baidu.com/s",params=kv)
print(r.text)

# 例2 ：爬取百度贴吧的内容
import requests
baseurl = 'http://tieba.baidu.com/f?'
params = {
  'kw' : '钟南山吧',
  'pn' : '50'
}
# 自动对params进行编码,然后自动和url进行拼接,去发请求
res = requests.get(baseurl,params=params)
print(res.text)

# 例3 ：访问“知乎发现”直接爬取会出错
# 携带请求头参数访问知乎:
import requests
#请求头字典
headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36'
}
#在get请求内，添加user-agent
response = requests.get(url='https://www.zhihu.com/explore', headers=headers)
print(response.status_code)  # 200
print(response.text)

# response 举例
import requests
r=requests.get("http://www.baidu.com")
print(r.status_code)
print(r.encoding)
print(r.apparent_encoding)
print(r.text)

# 爬取网页通用代码
 import requests
def   getHTML(url):
    try:
        r= requests.get(url)
        r.raise_for_status()   # 如果返回的状态码不是200， 则抛出异常;
        r.encoding = r.apparent_encoding  # 判断网页的编码格式， 便于r.text知道如何解码;
        return r.text
    except:
        return "产生异常"
if __name__ == '__main__':
   print(getHTML("https://www.baidu.com"))
   
# 爬取360
# 例4 ：输入查询关键字，提交搜索360获取访问结果
import requests
def keyword_post(url, data):
    try:
        user_agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.109 Safari/537.36"
        response = requests.get(url, params=data, headers={'User-Agent': user_agent})
        response.raise_for_status()   # 如果返回的状态码不是200， 则抛出异常;
        response.encoding = response.apparent_encoding  # 判断网页的编码格式， 便于respons.text知道如何解码;
    except Exception as e:
        print("爬取错误"+e)
    else:
        print(response.url)
        print("爬取成功!")
        return  response.content
def search360():
    url = "https://www.so.com/s"
    keyword = input("请输入搜索的关键字:")
    # q是360需要
    data = {
        'q': keyword
    }
    content = keyword_post(url, data)

    with open('360.html', 'wb') as f:
        f.write(content)      
if __name__ == '__main__':
    search360()

# 一个简单的# coding:utf-8
import requests
from bs4 import BeautifulSoup
r=requests.get("http://www.bjmu.edu.cn")
r.encoding='utf-8'
soup=BeautifulSoup(r.text,'html.parser')
print(soup)  # 输出响应的html对象
print(soup.prettify())  # 使用prettify()格式化显示输出


