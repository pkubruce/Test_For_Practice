# -*- coding: utf-8 -*-
"""
Created on Wed Sep  7 18:55:50 2022

@author: Lenovo
"""

char_a = "a"

char_b = "b"

print(char_a+char_b)


# 数字
var1 = 1
number = 10
var3=24.22
print(number)
print(var1)
print(float(number)) #数据类型转换
print(int(var3))
del var1

# string
# if else
a = "Hello"
b = "Python"
print("a + b 输出结果：", a + b)
print("a * 2 输出结果：", a * 2)
print("a[1] 输出结果：", a[1])
print("a[1:4] 输出结果：", a[1:4])
if( "H" in a) :
    print("H 在变量 a 中")
else :
    print("H 不在变量 a 中")
if( "M" not in a) :
    print("M 不在变量 a 中")
else :
    print("M 在变量 a 中")

var1 = 'Hello World!' 
var2 = "Runoob" 
print ("var1[0]: ", var1[0]) 
print ("var2[1:5]: ", var2[1:5])


# 字符串的统计
s='asjbsbjjdj'
print(len(s))                                          
print(s[0])                  
print(s[-1] ) 
# 字符串的删除
s=' ---anj123kks+++ '
s.strip()               #删除两边的空白
print(s.strip())                   # 测试打印的结果


#字符串的替换
str = "this is string example....wow!!! this is really string" 
print (str.replace("is", "was"))
#thwas was string example....wow!!! thwas was really string

#字符串切割
t='I love you more than I can say'
t.split(' ')                                              
#按空格切割['I', 'love', 'you', 'more', 'than', 'I', 'can', 'say']

# list
# 截取
list1 = ['Google', 'Runoob', 'Taobao']

list1[2]	         #'Taobao'	读取列表中第三个元素
list1[-2]	#'Runoob'	读取列表中倒数第二个元素
list1[1:]	#['Runoob', 'Taobao']	从第二个元素开始截取列表

# len(list)   返回列表元素个数。
# 例如：
list1 = ['Google', 'Runoob', 'Taobao']
print(len(list1))
list2=list(range(5)) # 创建一个 0-4 的列表
print(len(list2))

#list.index(x[, start[, end]]) 从列表中找出某个值第一个匹配项的索引位置。
#x-- 查找的对象。
#start-- 可选，查找的起始位置。
#end-- 可选，查找的结束位置。
#例如：
list1 = ['Google', 'Runoob', 'Taobao']
print('Taobao 索引值为',list1.index('Taobao'))
# 从指定位置开始搜索
print('Runoob 索引值为',list1.index('Runoob',1))


# list.insert(index, obj)   将指定对象插入列表的指定位置。
# list.pop([index])移除列表中的一个元素，并且返回该元素的值。
#index -- 可选参数，要移除列表元素的索引值，不能超过列表总长度，默认-1，删除最后一个列表值。
#例如：
list1 = ['Google', 'Runoob', 'Taobao'] 
list1.insert(1,'Baidu')
print('列表插入元素后为 : ',list1)
list1.pop() 
print("列表现在为 : ",list1) 
list1.pop(1) 
print("列表现在为 : ",list1)

# 键必须唯一，值可以为任何类型
info={'name':'张宏', 'id':2019100, 'address':'北京'}

# input函数

# input和split()连用

a=1.23678
print("%.3f"%a)

a=1233456
print("%.4s"%a)

input() 接收多个值，可以结合split()方法变通使用

#下句输入三角形的三边长
a,b,c = (input("请输入三角形三边的长(用空格分隔)：").split())
a= float(a)
b= float(b)
c= float(c)
 #计算三角形的半周长p
p=(a+b+c)/2
 #计算三角形的面积s
s=(p*(p-a)*(p-b)*(p-c))**0.5
 #输出三角形的面积
print("三角形面积为：",format(s,'.2f'))

# homework

# 1.输入年、月，输出本月有多少天。合理选择分支语句完成设计任务(if条件分支练习)。
# 输入样例1：2004 2
# 输出结果1：本月29天
# 输入样例2：2010 4
# 输出结果2：本月30天

year,month = (input('请输入年、月（空格隔开）：')).split( ) 
year = int(year)
month = int(month)
day31_month = [1,3,5,7,8,10,12]
day30_month = [4,6,9,11]
if(month in day31_month):
  print("本月31天")
elif(month in day30_month):
  print("本月30天")
elif(month==2 and ((year % 4 == 0 and year % 100 != 0) or (year % 400 == 0))):
  print("本月29天")
else:
  print("本月28天")

# 2.输出 1-100 内的所有奇数
print([x for x in range(1,101) if x%2!=0])

# 3.求1-2+3-4+5 ... 99的所有数的和
end = 0
for i in range(1,100):
  if (i%2==0):end=end-i
  else:end=end+i
print(end)
  
  
