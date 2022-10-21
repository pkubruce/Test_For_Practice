import requests, time
from urllib.parse import urlencode

base_url = 'https://weibo.com/a/aj/transform/loadingmoreunlogin?'
headers = {
    'Host': 'weibo.com',
    'Referer': 'https://weibo.com/',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',
    'X-Requested-With': 'XMLHttpRequest',
}

def get_page(page):
       # 构造__rnd参数
    rnd = int(time.time())
    # 构造参数字典
    params = {
        'ajwvr': '6',
        'category': '0',
        'page': page,
        'lefnav': '0',
        'cursor': '',
        '__rnd': rnd

    }
    # 拼接参数与url
    url = base_url + urlencode(params)
    try:
        res = requests.get(url, headers=headers)
        if res.status_code == 200:
            return res.json()
    except Exception as e:
        print('Error:', e.args)

def parse(res):
    weibo = {}
    if res:
        weibo['data'] = res.get('data')
        yield weibo

if __name__ == "__main__":
    for page in range(1, 11):
        result = get_page(page)
        weibo_data = parse(result)
        for data in weibo_data:
            print(data)