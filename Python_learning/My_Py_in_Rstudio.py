print("hello world")
## example 1
import requests
response=requests.get("https://www.baidu.com")
response.encoding=response.apparent_encoding
print(response.text)
print(response.headers)
print(response.status_code)


## example 2
import requests
response=requests.get("https://cambrian-images.cdn.bcebos.com/a8e0f1d50bdbb152d681a49f43a85a28_1530519716895.jpeg")
print(response.content)
with open("pictureget/1.gif","wb") as f:
    f.write(response.content)
    f.close()

## example myself 
## change the place of picture
# https://i0.hdslb.com/bfs/archive/94e313789965248990cd0ea8402c01c86f3f992c.jpg@672w_378h_1c.webp
import requests
response=requests.get("https://i0.hdslb.com/bfs/archive/94e313789965248990cd0ea8402c01c86f3f992c.jpg@672w_378h_1c.webp")
print(response.content)
with open("pictureget/zhibo.gif","wb") as f:
    f.write(response.content)
    f.close()
# the bilibili.com
import requests
response=requests.get("https://www.bilibili.com/")
response.encoding=response.apparent_encoding
print(response.text)
print(response.headers)
print(response.status_code)

