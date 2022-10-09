import re
a = "123abc456"
print(re.search("([0-9]*)([a-z]*)([0-9]*)",a).group(0))   #123abc456,返回整体
print(re.search("([0-9]*)([a-z]*)([0-9]*)",a).group(1))   #123
print(re.search("([0-9]*)([a-z]*)([0-9]*)",a).group(2))   #abc
print(re.search("([0-9]*)([a-z]*)([0-9]*)",a).group(3))   #456

import re
s="'bat', 'bit', 'but', 'hat', 'hit', 'hut"
content=re.findall(r"..t",s)
print(content)

import re
s="xiasd@163.com, sdlfkj@.com sdflkj@180.com solodfdsf@123.com sdlfjxiaori@139.com saldkfj.com oisdfo@.sodf.com.com"
content=re.findall(r"\w+@\w+.com",s)
print(content)

# homework -----------------
s='''se234 1987-02-09 07:30:00 
1987-02-10 07:25:00'''
print(re.findall('\d{4}-\d{2}-\d{2}',s)) # 找出年份
print(re.findall('\d{2}:\d{2}:\d{2}',s)) # 找出时间
print(re.findall('\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}',s)) # 找出年份、时间

title = u'你好，hello，世界' 
print(re.findall(u'[\u4e00-\u9fa5]',title))

