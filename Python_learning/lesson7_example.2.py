"""pytesseract识别图形验证码"""
# 应该是安装pytesseract包，安装tesseract包不合适
# 删除包代码：pip uninstall tesseract 
# pip install pytesseract
import pytesseract
from PIL import Image
image = Image.open('Python_learning/CheckCode_01.jpg')
text = pytesseract.image_to_string(image)
print(text)

image = Image.open('Python_learning/CheckCode_02.jpg')
text = pytesseract.image_to_string(image)
print(text)
# 模式L为灰色图像，它的每个像素用8个bit表示，0表示黑，255表示白，其他数字表示不同的灰度。
image = image.convert('L')
# 黑白化处理，自定义灰度界限，大于这个值为黑色，小于这个值为白色
text = pytesseract.image_to_string(image)
print(text)

threshold = 137
table = []
for i in range(256):
    if i < threshold:
        table.append(0)
    else:
        table.append(1)

# 图片二值化
image = image.point(table, '1')
# 保存
image.save('Python_learning//Rebuild_CheckCode_02.jpg')

image = Image.open('Python_learning//Rebuild_CheckCode_02.jpg')
text = pytesseract.image_to_string(image)
print(text)

