# 获取《人民日报》的新浪微博
import requests, time
from urllib.parse import urlencode

base_url = 'https://weibo.com/ajax/statuses/mymblog?' # 查看获取链接前面
headers = {
    'Host': 'weibo.com',
    'Referer': 'https://weibo.com/u/2803301701', # 人民日报的网址
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',
    'X-Requested-With': 'XMLHttpRequest',
    'cookie': "SINAGLOBAL=8364466200875.737.1666076645032; XSRF-TOKEN=KpB7q_6AgoqkqChzFAPizbgN; _s_tentry=weibo.com; Apache=7233903140989.6.1666077448772; ULV=1666077448835:2:2:2:7233903140989.6.1666077448772:1666076645060; login_sid_t=91593df2b318e6df70b7f5919a02b9a1; cross_origin_proto=SSL; wb_view_log=1463*9151.75; SUBP=0033WrSXqPxfM725Ws9jqgMF55529P9D9WFDImWQO1BKDUV_4Wyvy-Sx5JpX5o275NHD95Qc1K2ce0-Xehn7Ws4Dqcjz-2_HBrifqc-t; ALF=1697615005; SSOLoginState=1666079006; SUB=_2A25OSilODeRhGeBH6lQS9SrMwzyIHXVtPh2GrDV8PUNbmtAKLUTZkW9NQcVfHmmT4ZlDh2JZDFhAaC_b6-XrjFy8; WBPSESS=53X_pLUhj5G29UGcibu841IvoM27hetVRHg6BWCu0Rw3Jmu7IvC4IzZHYIcNbg6UVozu04dsZfK3tjaE-1s-4cV1tMGXqfPq42yzuDj3LXvb8EDKGnfmXCHo9P9hX_R2XgfNaL-Ee7wkBhOUD-rmaw=="
} # cookie很重要，要不然爬取为403（禁止访问）# 其实cookie也是个人隐私

def get_page(page,since_id=None):
    # 构造参数字典
    if page==1: # 根据csdn的提示，第一个里面是没有since_id的所以根本用不上
       params = {
        'uid': '2803301701',
        'page':page,
        'feature':'0'
        }
    else:
      params = {
        'uid': '2803301701',
        'page':page,
        'feature':'0',
        'since_id':since_id}
    # 拼接参数与url
    url = base_url + urlencode(params) #拼凑功能
    try:
        res = requests.get(url, headers=headers)
        if res.status_code == 200:
            json = res.json()
            next_since_id = json.get('data')['since_id'] # 获取since_id
            # 根据这个csdn的提示，since_id在page-1对应的预览的data里面
            return (json, next_since_id)
    except Exception as e:
        print('Error:', e.args)

def parse(res):
    weibo = {}
    if res:
        weibo['data'] = res.get('data')
        yield weibo # 生成generator对象

if __name__ == "__main__":
    for page in range(1, 15):
        if page==1:
            result = get_page(page=1) # 不需要since_id
            weibo_data = parse(result[0]) # 获取json对象
            for data in weibo_data:
                print(data)
        else:
            result = get_page(page,result[1])  # 把since_id放过去，不然生成不了
            weibo_data = parse(result[0]) # 获取json 对象
            for data in weibo_data:
                print(data)


