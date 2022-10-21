import requests
import json


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

def main():
    depth = 5
    infoList = []
    for i in range(depth):
        try:
            url = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.user.commenList3&serviceType=20&reqPageNum='+str(i)+'&maxResults=25&appid=C10191382&version=10.0.0&zone=&locale=zh_CN'
            #url = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.user.commenList3&serviceType=20&reqPageNum='+str(i)+'&maxResults=25&appid=C10113015&version=10.0.0&zone=&locale=zh_CN'
            #url = 'https://web-drcn.hispace.dbankcloud.cn/uowap/index?method=internal.user.commenList3&serviceType=20&reqPageNum=5&maxResults=25&appid=C10191382&version=10.0.0&zone=&locale=zh_CN'
            html = getHTMLText(url).decode("utf-8")
            result=json.loads(html)    
            for i in range(len(result['list'])):
                #print(result['list'][i]['accountName'])
                comment = result['list'][i]['commentInfo']
                #print(comment)
                infoList.append(comment)
            #print(result)
            #parsePage(infoList, html)
            
        except:
            continue
    #printGoodsList(infoList)
    print(infoList)
    # 把评论数据保存到文件中
    with open('Python_learning/zuoyebangComment1.txt', 'a', encoding='utf-8') as f:
        f.write(json.dumps(infoList, ensure_ascii=False) + '\n')


main()
