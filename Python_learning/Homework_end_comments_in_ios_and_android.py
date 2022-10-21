# 获取APPstore的医疗类评论
# (1)获取前十的对应ID https://apps.apple.com/cn/charts/iphone/%E5%8C%BB%E7%96%97-apps/6020?chart=top-free
# (2)获取对应的ID的名字，更改代码中获取名字的文件
# (3)根据要求修改输出txt的名字(文件名用APP的名字命名)后面加上"-appstore"区别第二个作业
# (4)挪用上一个代码的评论获取的def

# 库导入
import requests
import re
from bs4 import BeautifulSoup
import pandas as pd
# 获取前十app的名字以及ID
appinformation_url = "https://apps.apple.com/cn/charts/iphone/%E5%8C%BB%E7%96%97-apps/6020?chart=top-free"
def getAppnameID(url):
    r = requests.get(url)
    r.raise_for_status()
    r.encoding = "utf-8"
    s = BeautifulSoup(r.text,'html.parser')
    # 挑选出带有app的名字和序号的部分
    str_s = str(s.find_all('li', class_="l-column--grid small-valign-top we-lockup--in-app-shelf l-column small-6 medium-3 large-2")) 
    # 匹配的正则表达式
    pattern3 = 'a aria-label="号码 ([0-9]*)。 (.*?)。 (.*?)。" class="we-lockup targeted-link" href="https://apps.apple.com/cn/app/(.*?)/id([0-9]*)"' 
    # 提取的结果
    appinformation = re.findall(pattern3,str_s)
    # 得到一个list，里面对象是tupple
    df_appinformation = pd.DataFrame(columns=['order','name','name_en','url_name','id'],data=appinformation)
    return(df_appinformation)

# 获取页面情况，转化为txt
def getHTMLText(url): 
    try:
        r = requests.get(url)
        r.raise_for_status()
        r.encoding = "utf-8"
        print(r.text)
        return r.text
    except:
        return ''
 
def fillUnivlist(titles, comments, stars, html): # 获取评论的主体部分，这个要保留
    try:
        pattern = re.compile(r'"title":{"label":(.*?)}, "content"', re.S) #提取标题
        nbaInfo = re.findall(pattern, str(html)) #提取title

        # findStr = '"title":{"label":'
        # nbaInfo = nbaInfo1[nbaInfo1.find(findStr)+len(findStr):]
        patternFloor = re.compile(r'"content":{"label":(.*?), "attributes":{"type":"text"}}', re.S) #提取content
        floorText = re.findall(patternFloor, str(html))

        patternStar = re.compile(r'"im:rating":{"label":(.*?)}, "id"', re.S)  # 提取星级
        star = re.findall(patternStar, str(html))
        # print(str(star))

        number = len(nbaInfo)
        print(number)
        for i in range(number):
            Info = nbaInfo[i] #利用Tools类移除不想要的格式字符
            if i==0:Info = Info[Info.find('"title":{"label":')+len('"title":{"label":'):]
            # print(Info)
            Info1 = floorText[i]
            Info2 = star[i]
            # print(Info2+"hello")
            titles.append('title:' + Info)
            comments.append('content:' + Info1)
            stars.append('star:' + Info2)
    except:
        return ''

def writeText(titleText, fpath): # 输出APP的名字，搭配获取名字使用
    try:
        with open(fpath, 'a', encoding='utf-8') as f:
            f.write(str(titleText)+'\n')
            f.write('\n')
            f.close()
    except:
        return ''

def writeUnivlist(titles, comments, stars, fpath, num): # 输出评论在下面 # 和搭配评论使用
    with open(fpath, 'a', encoding='utf-8') as f:
        for i in range(num):
            f.write(str(stars[i]) + '\n')
            f.write('*' * 10 + '\n')
            f.write(str(titles[i]) + '\n')
            f.write('*' * 50 + '\n') #输入一行*号
            f.write(str(comments[i]) + '\n')
            f.write('*' * 100 + '\n')
        f.close()


def main(app_id,appname,outputfile): # 获取想要的结果
    count = 0
    writeText(appname, output_file) # 获取评论
    for i in range(10):
        i = i + 1
        titles = []
        comments = []
        stars = []
        url = 'https://itunes.apple.com/rss/customerreviews/page=' + str(i) + '/id='+str(app_id)+'/sortby=mostrecent/json?l=en&&cc=cn'
        html = getHTMLText(url)
        fillUnivlist(titles, comments, stars, html)
        writeUnivlist(titles, comments, stars, output_file, len(titles))
        # print(html)
        count = count + 1
        print("\r当前进度: {:.2f}%".format(count * 100 / 10), end="")


if __name__ == '__main__':
    df_appinformation = getAppnameID(appinformation_url)
    for ordersub in range(1,11):
        df_sub = df_appinformation.loc[df_appinformation['order']==str(ordersub)]
        app_id = df_sub['id'].values.tolist()[0]
        appname = df_sub['name'].values.tolist()[0]
        output_file = 'Python_learning/result_of_appstore/'+str(ordersub)+appname+'-appstore.txt'
        main(app_id,appname,output_file)

# 获取华为store，属于动态网页，所以用到ajax，无论怎么处理，url都不会变
# 通过ajax发现医疗健康类情况'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.getTabDetail&serviceType=20&reqPageNum=1&uri=48e46dc5bda04fa7b8eee6699d05c9d7&maxResults=25&zone=&locale=zh'
# 评论页面，保持不变https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.user.commenList3&serviceType=20&reqPageNum=
# 页面1滚动就会发生变化
# &maxResults=25&
# appid=C101708533 # appid决定了页面
# &version=10.0.0&zone=&locale=zh
# 

# 加载库
import json

# 获取网页内容函数
def getHTMLText_huawei(url):
    header = {
        'referer': 'https://appgallery.huawei.com/',
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36 SE 2.X MetaSr 1.0',
        'Connection': 'keep-alive'
    }
    try:
        r = requests.get(url, timeout=30,headers=header)
        r.raise_for_status()
        r.encoding = r.apparent_encoding
        return r.content
    except:
        return ""
# 获取医疗健康类别的内容，是一个json文件
huaweimedurl = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.getTabDetail&serviceType=20&reqPageNum=1&uri=48e46dc5bda04fa7b8eee6699d05c9d7&maxResults=25&zone=&locale=zh'
def getnameid(url):
    huaweimedtext = getHTMLText_huawei(url) # 获取页面内容
    html = huaweimedtext.decode("utf-8")
    pattern_name = '"bundleSize":0,"COMNUM":"1","minAge":18,"name":"(.*?)"' # 获取APP名字的正则表达式
    pattern_id = '"installConfig":0,"appid":"(.*?)"' # 获取appid的正则表达式
    appname = re.findall(pattern_name, html)
    appid = re.findall(pattern_id, html)
    return(appname,appid) # 获得app名字和ids

def main(appid,fpath):
    depth = 5
    infoList = []
    for i in range(depth):
        try:
            url = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.user.commenList3&serviceType=20&reqPageNum='+str(i)+'&maxResults=25&appid='+appid+'&version=10.0.0&zone=&locale=zh_CN'
            #url = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.user.commenList3&serviceType=20&reqPageNum='+str(i)+'&maxResults=25&appid=C10113015&version=10.0.0&zone=&locale=zh_CN'
            #url = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.user.commenList3&serviceType=20&reqPageNum=5&maxResults=25&appid=C10191382&version=10.0.0&zone=&locale=zh_CN'
            html = getHTMLText(url).encode('utf-8').decode('utf-8') 
            result=json.loads(html)    
            for i in range(len(result['list'])):
                userid = result['list'][i]['commentId'] # 用户id
                userphone = result['list'][i]['phone'] # 用户设备
                commenttime = result['list'][i]['operTime'] # 用户评论时间
                comment = result['list'][i]['commentInfo'] # 评论内容
                comment_text = {'用户id':userid,'用户设备':userphone,'评论时间':commenttime,'评论内容':comment}
                #print(comment)
                infoList.append(comment_text) # 字典直接添加
        except:
            continue
    print(infoList) #输出评论内容
    # 把评论数据保存到文件中
    with open(fpath, 'a', encoding='utf-8') as f:
        for j in range(len(infoList)):
            f.write( str(infoList[j])+ '\n') # dict 不能直接写入，所以转化为字符串
        f.close()

huaweimedurl = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.getTabDetail&serviceType=20&reqPageNum=1&uri=48e46dc5bda04fa7b8eee6699d05c9d7&maxResults=25&zone=&locale=zh'

if __name__ == '__main__':
    for i in range(10):
        appname = getnameid(huaweimedurl)[0][i]
        appid = getnameid(huaweimedurl)[1][i]
        fpath = 'Python_learning/result_of_huawei/'+str(i)+appname+'-huaweistore.txt'
        main(appid,fpath)
    


