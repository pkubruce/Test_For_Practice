from bs4 import BeautifulSoup

html_doc = """
<html><head><title>The Dormouse's story</title></head>
<body>
<p class="title"><b>The Dormouse's story</b></p>
<p class="story">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
<a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>

<p class="story">...</p>
"""
soup = BeautifulSoup(html_doc, 'html.parser')  #声明BeautifulSoup对象
find = soup.find('p')  #使用find方法查到第一个p标签
print(soup.p)        #直接查到第一个p标签
print("find's content is", find)  #输出find获取的值
print("find's Tag Name is ", find.name)  #输出标签的名字
print("find's Attribute(class) is ", find['class'])  #输出标签的class属性值
print('NavigableString is：', find.string)# 标签里面的内容


for finda in soup.find_all('p'):     #使用find_all方法查到所有p标签
    print("find's content are", finda)
    print('NavigableString are：', finda.string) #如果 tag 包含了多个子节点，tag 就无法确定，string 方法应该调用哪个子节点的内容，.string 的输出结果是 None
# end


for link in soup.find_all('a'):   # for循环遍历所有a标签，返回列表中的内容赋给link
    print(link.get('href')) # 获取a标签中的url链接

