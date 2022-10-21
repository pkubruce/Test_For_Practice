# packages intalling
# install.packages(c(
#   "colorBlindness", "directlabels", "dplyr", "gameofthrones", "ggforce", 
#   "gghighlight", "ggnewscale", "ggplot2", "ggraph", "ggrepel", 
#   "ggtext", "ggthemes", "hexbin", "Hmisc", "mapproj", "maps", 
#   "munsell", "ozmaps", "paletteer", "patchwork", "rmapshaper", "scico", 
#   "seriation", "sf", "stars", "tidygraph", "tidyr", "wesanderson" 
# ))

# BAPC -----
library(BAPC)
library(INLA)
data("FemLCSweden")
data("FemPYSweden")
data("whostandard")
apclist_test <- APCList(FemLCSweden, FemPYSweden, gf=5)
bapc_list <- BAPC(apclist_test)

extract_data <- agespec.rate(bapc_list)
name_age <- names(extract_data)

for (i in 1:length(name_age)) {
  dt_sub <- as.data.frame(extract_data[[i]])
  dt_sub$year <- rownames(dt_sub)
  rownames(dt_sub) <- 1:dim(dt_sub)[1]
  dt_sub$age <- name_age[i]
  if(i==1){dt_out <- dt_sub}
  else{dt_out <- rbind(dt_out,dt_sub)}
}

# 九九乘法表 -----
for(i in 1:9){
  out2 <- c()
  for(j in 1:i){
    out <- paste0(i,"*",j,"=",i*j,"")
    out2 <- c(out2,out)
  }
  print(out2)
}

# Homework 算字数------
library(stringr)
count_char <- function(x){
  table(str_split(x,pattern = "")[[1]])}
# 原始数据
count_char(c("KEXHBAEBXKNXBECKACNEABECAEKNACXKHCBKNBHE
HCBANXKXCAXNKHXNHECHBAHKENXCKBNHCANXEANX——80 
ABXKACEHKXEHNEABKCEKHCAEKCABHCBKNXNHBXAB
NEHXBHNAHECABHEXCHNBKAXHEAHXKANEXBCXNACK——160 
XBKNACHENCAHNCNBKCBAXKBENCBKHEXKENKEBXHC
BAHKEXKBHXCEABKEXANKHCEBKHNAEXHBNEXKHCNA——240 
HXENACBANCKBCANCNKEXNEXCABXKHNACKXHNEBKH
CBXHCNCXKANEAXBKHENCABKEXCAXNXHKCBKENHEB——320 
HKNEXCAKNXABEHANCXABHKCBHKXEBHAENHAKEHBX
BECXBAKCHNXCNXHBEKCABEKCNBAKNCHABNEXCAHE——400 
XNAKHENBNKAXKBNCHEBEXCHKAHBCKNBHEXANKXEC
ACXEKAXCACKHBXHKBAHCENKBHNXEABKEXABKEHCN——480 
KHNAEBHXCKXEHCNAHXEXACBANCBNCABCENAXNEXA
CKBNHXCBKEHNEBHKXENCBKAXKHNAKCXHNEBAHCBX——560 
NCHBXKAHEACBKHENCABKEXCAXNBHCKBKEHNEANXE
AHBNACXABKNCEXKHEBHANEHKAHECXBECXABKCHNX——640 
KBNCXEHCABENXKHCBEKBHXENCBAKNCNACBENAXKH
HNCENKAXCAHXKNCEHKBAXEKABEXNHKBXEKHABHBE——720 
NHEKACKHBNXCAXEKBAXNKHEBCAEKANXBHCNXCBHA
BENHKXCNAHKXCABXENAXENCKEBCAKEHXBNCNHXCK——800 
ABCEXNKAHXBEHNEAHBXEBHKCNHKCXANAHBEXANKC
CNXHKACXAKEACXBCEKEXKAHNXNAEKBXBCKHEBKNH——880 
XAEXHBNKEXHCNACKEXBHCXEHNKCBANHABNCBKNCX
ENCBKAHXCEKABNEHNCABKEXCAXKHBKBEHKNEBHEA——960 
KENHAXKCNHBXHBCXAENKECBXECNXAEHBANCKABHN
AHBNCAXABKNCEXKHEBHANEHKAHECXBECXABCKHNX——1040 
KBNCXEHCABENXKHCBEKBHXENCBAKNCNACBENAXKH
HNCKNKAXCAHXKNCEHKBAXEKABEXNHKBXEKHABHBE——1120 
NHEKACKHBNXCAXEIBAXNKHEBCAEKANXBHCNXCBHA
BENHKXCNAHKXCABXENAXENCKEBCAKEHXBNCNHXCK——1200 
"))
## 上课前
count_char(c("KEXBAEBXKNXBECKACNEABECAEKNACXKHCBKNBE
CBANXKXCAXNKXNECBAKENXCKBNCANXEANX——80 
ABXKACEKXENEABKCEKCAEKCABCBKNXNBXAB
NEXBNAECABHEXCNBKAXEAXKANEXBCXNACK——160 
XBKNACENCANCNBKCBAXKBENCBKEXKENKEBXC
BAKEXKBXCEABKEXANKCEBKNAEXBNEXKCNA——240 
XENACBANCKBCANCNKEXNEXCABXKNACKXNEBK
CBXCNCXKANEAXBKENCABKEXCAXNXKCBKENEB——320 
KNEXCAKNXABEANCXABKCBKXEBAENAKEBX
BECXBAKCNXCNXBEKCABEKCNBAKNCABNEXCAE——400 
XNAKENBNKAXKBNCEBEXCHKABCKNBEXANKXEC
ACXEKAXCACKBXKBACENKBNXEABKEXABKECN——480 
KNAEBXCKXEHCNAXEXACBANCBNCABCENAXNEXA
CKBNXCBKENEBHKXENCBKAXKNAKCXNEBACBX——560 
NCBXKAEACBKENCABKEXCAXNBCKBKENEANXE
ABNACXABKNCEXKEBANEKAECXBECXABKCNX——640 
KBNCXECABENXKCBEKBXENCBAKNCNACBENAXK
NCENKAXCAXKNCEKBAXEKABEXNHKBXEKABBE——720 
NEKACKBNXCAXEKBAXNKEBCAEKANXBCNXCBA
BENKXCNAKXCABXENAXENCKEBCAKEXBNCNXCK——800 
ABCEXNKAXBENEABXEBKCNKCXANABEXANKC
CNXKACXAKEACXBCEKEXKANXNAEKBXBCKEBKN——880 
XAEXBNKEXCNACKEXBCXENKCBANABNCBKNCX
ENCBKAXCEKABNENCABKEXCAXKBKBEKNEBEA——960 
KENAXKCNHBXBCXAENKECBXECNXAEBANCKABN
ABNCAXABKNCEXKEBANEHKAECXBECXABCKNX——1040 
KBNCXECABENXKCBEKBXENCBAKNCNACBENAXK
NCKNKAXCAXKNCEKBAXEKABEXNKBXEKABBE——1120 
NEKACKBNXCAXEIBAXNKEBCAEKANXBCNXCBA
BENKXCNAKXCABXENAXENCKEBCAKEXBNCNXCK——1200
"))


## 上课后
count_char(c("KEXBAEBXKNXBECKACNEABECAEKNACXKCBKNBE
CBANXKXCAXNKXNECHBAKENXCKBNCANXEANX——80 
ABXKACEKXEHNEABKCEKCAEKCABCBKNXNBXAB
NEXBNAHECABEXCHNBKAXEAXKANEXBCXNACK——160 
XBKNACENCANCNBKCBAXKBENCBKEXKENKEBXC
BAKEXKBXCEABKEXANKCEBKNAEXBNEXKCNA——240 
XENACBANCKBCANCNKEXNEXCABXKHNACKXHNEBK
CBXCNCXKANEAXBKENCABKEXCAXNXKCBKENEB——320 
KNEXCAKNXABEANCXABHKCBKXEBAENHAKEBX
BECXBAKCNXCNXBEKCABEKCNBAKNCABNEXCAE——400 
XNAKENBNKAXKBNCEBEXCKAHBCKNBEXANKXEC
ACXEKAXCACKHBXKBACENKBNXEABKEXABKECN——480 
KNAEBHXCKXECNAXEXACBANCBNCABCENAXNEXA
CKBNXCBKENEBKXENCBKAXKNAKCXNEBACBX——560 
NCBXKAHEACBKENCABKEXCAXNBCKBKENEANXE
ABNACXABKNCEXKEBHANEKAECXBECXABKCNX——640 
KBNCXECABENXKCBEKBXENCBAKNCNACBENAXK
NCENKAXCAXKNCEKBAXEKABEXNKBXEKABBE——720 
NEKACKBNXCAXEKBAXNKEBCAEKANXBCNXCBA
BENKXCNAHKXCABXENAXENCKEBCAKEXBNCNXCK——800 
ABCEXNKAXBEHNEABXEBKCNKCXANABEXANKC
CNXKACXAKEACXBCEKEXKAHNXNAEKBXBCKEBKN——880 
XAEXBNKEXCNACKEXBCXEHNKCBANABNCBKNCX
ENCBKAHXCEKABNENCABKEXCAXKBKBEKNEBEA——960 
KENAXKCNHBXBCXAENKECBXECNXAEBANCKABN
ABNCAXABKNCEXKEBHANEHKAECXBECXABCKNX——1040 
KBNCXECABENXKCBEKBXENCBAKNCNACBENAXK
NCKNKAXCAXKNCEKBAXEKABEXNKBXEKABBE——1120 
NEKACKHBNXCAXEIBAXNKEBCAEKANXBCNXCBA
BENKXCNAHKXCABXENAXENCKEBCAKEXBNCNXCK——1200 

"))

# -----------


# pdf reading----
library(readtext)


library(pdftools)
text_pdf <- pdf_data(pdf_subset("Supplementary.pdf",pages = 4))[[1]]


## 分面线性面积图---------------------

df2 <- data.frame(year=rep(c(1990,2019),4),
                  val=rep(c(1,2,-1,-2),2),
                  sex=rep(c("Female","Female","Male","Male"),2),
                  group=rep(c("A","B"),c(4,4)))
library(ggplot2)
ggplot(df2,aes(x=year,y=val,fill=sex))+
  geom_point()+geom_line()+geom_area()+facet_grid(.~group)+
  theme(panel.spacing = unit(0, "lines"))+
  scale_x_continuous(breaks = c(1990,2019),expand=c(0.5,0.5))


# 尝试画合并图----------
age_effect <- rnorm(10,0,1)
age <- seq(1,10,1)
year_effect <- rnorm(12,0,1)
year <- seq(2001,2012,1)
cohort_effect <- rnorm(2011-1991+1,0,1)
cohort <- seq(1991,2011,1)
df <- data.frame(x=c(age,year,cohort),
                 y=c(age_effect,year_effect,cohort_effect),
                 group=rep(c("age_effect","year_effect","cohort_effect"),
                           c(10,12,2011-1991+1)))

library(ggplot2)
ggplot(df, aes(x=x,y=y))+
  geom_point()+geom_line()+facet_grid(.~group,scales = "free",as.table = T)+
  scale_x_continuous(expand=c(0,0))+
  theme(panel.spacing = unit(1, "lines"),
        panel.border = element_rect(linetype = 1, fill = NA),
        panel.background = element_rect(fill = "white", colour = "grey50"),
        panel.grid = element_line())

library(openxlsx)
write.xlsx(df,file = "data.xlsx") # draw in excel

# from Epi-------
library(Epi)
# Danish population at 1 Jan each year by sex and age
data( N.dk )

# An illustrative subset
( Nx <- subset( N.dk, sex==1 & A<5 & P<1975 ) )
# Show the data in tabular form
xtabs( N ~ A + P, data=Nx )
# Lexis triangles as data frame
Nt <- N2Y( data=Nx, return.dfr=TRUE )
# Calculation of PY for persons born 1970 in 1972
( N.1.1972 <- subset( Nx, A==1 & P==1972)$N )
( N.2.1973 <- subset( Nx, A==2 & P==1973)$N )
N.1.1972/3 + N.2.1973/6
N.1.1972/6 + N.2.1973/3

# my code------
num_matrix <- matrix(Nx$N,nrow=4,ncol=5,byrow = T,dimnames = list(seq(1971,1974,1),
                                                                  seq(0,4,1)))
py_matrix <- matrix(NA,nrow=3,ncol=3,dimnames = list(P=seq(1971,1973,1),
                                                      A=seq(1,3,1)))
for (age in 1:3) {
  for (year in 1971:1973) {
    age_ch <- as.character(age)
    year_ch <- as.character(year)
    py_matrix[year_ch,age_ch] <- num_matrix[year_ch,as.character(age-1)]/6+
      num_matrix[year_ch,age_ch]/3+num_matrix[as.character(year+1),age_ch]/3+
      num_matrix[as.character(year+1),as.character(age+1)]/6
  }
}
### 拼凑后对比------
library(tidyverse)
df <- data.frame(A=rep(1:3,3),
                 P=rep(1971:1973,rep(3,3)),
                 Yt=NA)
for (i in 1:3) {
  for (j in 1971:1973) {
    df[df$A==i&df$P==j,]$Yt <- py_matrix[as.character(j),as.character(i)]
  }
}

inner_join(inner_join(df,testisDK, by = c("A","P")),Nx,by=c("A","P"))


## 示例-----------------
data(Y.dk)
data(M.dk)
data(N.dk)
# 选择sex==1的数据
M.dk_male <- subset(M.dk,sex==1&A<=3&A>=1&P<=1976)
# 用N.dk数据来计算
# 选出要用数据
N.dk_male <- subset(N.dk,sex==1&A<=4&A>=0&P<=1977&P>=1974)
# 验证
# 转化为矩阵
num_matrix <- matrix(N.dk_male$N,
                     nrow=4,ncol=5,
                     byrow = T,
                     dimnames = list(P=seq(1974,1977,1),A=seq(0,4,1)))
# 结果矩阵
py_matrix <- matrix(NA,
                    nrow=3,ncol=3,
                    dimnames = list(P=seq(1974,1976,1),A=seq(1,3,1)))
for (age in 1:3) {
  for (year in 1974:1976) {
    age_ch <- as.character(age)
    year_ch <- as.character(year)
    py_matrix[year_ch,age_ch] <- num_matrix[year_ch,as.character(age-1)]/6+
      num_matrix[year_ch,age_ch]/3+num_matrix[as.character(year+1),age_ch]/3+
      num_matrix[as.character(year+1),as.character(age+1)]/6
  }
}
# lungDK
data("lungDK")
# Taylor a dataframe that meets the requirements for variable names
exd <- lungDK[,c("Ax","Px","D","Y")]
names(exd)[1:2] <- c("A","P")
# Three different ways of parametrizing the APC-model, ML
ex.1 <- apc.fit( exd, npar=7, model="ns", dr.extr="1", parm="ACP", scale=10^5 )
ex.D <- apc.fit( exd, npar=7, model="ns", dr.extr="D", parm="ACP", scale=10^5 )
ex.Y <- apc.fit( exd, npar=7, model="ns", dr.extr="Y", parm="ACP", scale=10^5 )
# Sequential fit, first AC, then P given AC.
ex.S <- apc.fit( exd, npar=7, model="ns", parm="AC-P", scale=10^5 )
# Show the estimated drifts
ex.1[["Drift"]]
ex.D[["Drift"]]
ex.Y[["Drift"]]
ex.S[["Drift"]]
# Plot the effects
lt <- c("solid","22")[c(1,1,2)]
apc.plot( ex.1, lty=c(1,1,3) )
apc.lines( ex.D, col="red", lty=c(1,1,3) )
apc.lines( ex.Y, col="limegreen", lty=c(1,1,3) )
apc.lines( ex.S, col="blue", lty=c(1,1,3) )

data("testisDK")
subset(lungDK, A5==50&P5==1978)
subset(testisDK, A==50&P==1978)

data("Y.dk")
subset(Y.dk,  A==50&P==1978)

attach( lungDK )
Lexis.diagram( age=c(40,90), date=c(1943,1993), coh.grid=TRUE )
text( Px, Ax, paste( Y ), cex=0.7 )
detach(lungDK)

library(Epi)
data(lungDK)

## draw picutures "pie" TRY-------------
library(ggplot2)
# 生成模拟数据
df1 <- data.frame(group=rep(c('A','B','C'),rep(3,3)),
                  ingroup=rep(c('a','b','c'),3),
                  num=round(runif(9,1,100)))
# 加入x=group是环
ggplot(df1, aes(x=group,y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "stack") # x=group position=stack,单纯分组堆叠

ggplot(df1, aes(x=group,y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "fill") # group position=fill,纵坐标0~1，百分比堆叠

ggplot(df1, aes(x=group,y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "stack")+
  facet_grid(~group)+
  coord_polar("y") # 不完整环状

ggplot(df1, aes(x=group,y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "fill")+
  facet_grid(~group)+
  coord_polar("y") # 完整环状

# 不加入x=group是环

ggplot(df1, aes(x="",y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "stack")# x= position=stack,不分组堆叠

ggplot(df1, aes(x="",y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "fill")# x= position=fill,不分组百分比堆叠

ggplot(df1, aes(x="",y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "stack")+
  facet_grid(~group)+
  coord_polar("y") # 不完整环状

ggplot(df1, aes(x="",y=num,fill=ingroup))+
  geom_bar(stat = 'identity',position = "fill")+
  facet_grid(~group)+
  coord_polar("y") # 完整环状

# spine plot --------------------


# install.packages("ggnewscale")
# install.packages("ggh4x")
# install.packages("ggprism")
# install.packages("patchwork")
# install.packages("ggsci")
# install.packages("grid")
library(patchwork)
library(ggplot2)
library(ggprism)
library(ggh4x)
library(cowplot)
library(grid)
library(ggsci)

df <- data.frame(group=c("healthy","healthy","tuberculosis","healthy","recover","tuberculosis","recover"),
                 xmin=c(0,1.05,1.05,1.55,1.55,5.05,7.05),
                 xmax=c(1,1.5,1.5,5,5,7,10),
                 ymin=c(0,0,0.61,0,0.81,0,0),
                 ymax=c(1,0.6,1,0.8,1,1,1))
ggplot(df,aes(xmin=xmin,xmax=xmax,ymin=ymin,ymax=ymax))+
  geom_rect(aes(fill=group))


# 模仿文献作图-------------------
ggplot(df, aes(x=xmin, y=ymin))+geom_point()+geom_line()+
  geom_bar(aes(y=ymin),stat = "identity")+
  scale_y_continuous(limits = c(0,1.0),
                     breaks = seq(0,1.0,0.2),
                     minor_breaks = seq(0,1.0,0.02),
                     guide = "prism_minor",
                     expand = c(0,0),
                     sec.axis = sec_axis(~.*1,
                                         breaks = seq(0,1,0.2)))+
  coord_cartesian(clip = "off")+
  annotation_ticks(sides = "r", 
                   type = "minor", 
                   outside = TRUE,
                   minor.length = unit(4.8, "pt"),
                   size = 1)+
  theme_prism(border = T)+
  theme(axis.text.y.right = element_blank())->p1

ggplot(df, aes(x=xmin, y=ymin))+geom_point()+geom_line()+
  geom_bar(aes(y=ymin),stat = "identity")+
  scale_y_continuous(limits = c(0,1.0),
                     breaks = seq(0,1.0,0.2),
                     minor_breaks = seq(0,1.0,0.02),
                     guide = "prism_minor",
                     expand = c(0,0),
                     sec.axis = sec_axis(~.*1,
                                         breaks = seq(0,1,0.2)))+
  coord_cartesian(clip = "off")+
  annotation_ticks(sides = "r", 
                   type = "minor", 
                   outside = TRUE,
                   minor.length = unit(4.8, "pt"),
                   size = 1)+
  theme_prism(border = T)+
  theme(axis.title.y = element_blank(),
        axis.text.y.left = element_blank())->p2

ggplot(df, aes(x=xmin, y=ymin))+geom_point()+geom_line()+
  geom_bar(aes(y=ymin),stat = "identity")+
  scale_y_continuous(limits = c(0,1.0),
                     breaks = seq(0,1.0,0.2),
                     minor_breaks = seq(0,1.0,0.02),
                     guide = "prism_minor",
                     expand = c(0,0),
                     sec.axis = sec_axis(~.*1,
                                         breaks = seq(0,1,0.2)))+
  coord_cartesian(clip = "off")+
  annotation_ticks(sides = "r", 
                   type = "minor", 
                   outside = TRUE,
                   minor.length = unit(4.8, "pt"),
                   size = 1)+
  theme_prism(border = T)+
  theme(axis.title.y = element_blank(),
        axis.text.y.left = element_blank(),
        axis.text.y.right = element_blank())->p3
p1+p3+p2
# 下面是最接近文献的分面图------------------
# 可是右边纵坐标名字出不来，我他喵的
ggplot(df, aes(x=xmin, y=ymin))+geom_point()+geom_line()+
  geom_bar(aes(y=ymin),stat = "identity")+
  facet_wrap(group~.,scales = "free_y")+
  coord_cartesian(clip = "off")+
  annotation_ticks(sides = "r", 
                   type = "minor", 
                   outside = TRUE,
                   minor.length = unit(4.8, "pt"),
                   size = 1)+
  annotation_ticks(sides = "l", 
                   type = "minor", 
                   outside = TRUE,
                   minor.length = unit(4.8, "pt"),
                   size = 1)->p

p+
  facetted_pos_scales(y=list(group=="healthy"~scale_y_continuous(limits = c(0,1.0),
                                                                 breaks = seq(0,1.0,0.2),
                                                                 minor_breaks = seq(0,1.0,0.02),
                                                                 guide = "prism_minor",
                                                                 expand = c(0,0),
                                                                 sec.axis = sec_axis(~.*1,
                                                                                     breaks = seq(0,1,0.2),
                                                                                     labels = NULL)),
                             group=="recover"~scale_y_continuous(limits = c(0,1.0),
                                                                 breaks = seq(0,1.0,0.2),
                                                                 labels = rep("",6),
                                                                 minor_breaks = seq(0,1.0,0.02),
                                                                 guide = "prism_minor",
                                                                 expand = c(0,0),
                                                                 sec.axis = sec_axis(~.*1,
                                                                                     breaks = seq(0,1,0.2),
                                                                                     labels = NULL)),
                             group=="tuberculosis"~scale_y_continuous(limits = c(0,1.0),
                                                                      breaks = seq(0,1.0,0.2),
                                                                      labels = rep("",6),
                                                                      minor_breaks = seq(0,1.0,0.02),
                                                                      guide = "prism_minor",
                                                                      expand = c(0,0),
                                                                      sec.axis = sec_axis(~.*1,
                                                                                          breaks = seq(0,1,0.2),
                                                                                          name = "IIII"))
                             ))+
  theme_prism(border = T)+
  theme(panel.spacing = unit(0, "lines"))


df$name <- "age groups"
# 最最接近文献的一副图片，对应于P2C、P2D-----
library(patchwork)
library(ggplot2)
library(ggprism)
library(ggh4x)
library(cowplot)
library(grid)
library(ggsci)
df <- data.frame(group=c("healthy","healthy","tuberculosis","healthy","recover","tuberculosis","recover"),
                 xmin=c(0,1.05,1.05,1.55,1.55,5.05,7.05),
                 xmax=c(1,1.5,1.5,5,5,7,10),
                 ymin=c(0,0,0.61,0,0.81,0,0),
                 ymax=c(1,0.6,1,0.8,1,1,1))
df_title <- data.frame(group=c("healthy","recover","tuberculosis"),
                       x=c(3,3,3),
                       y=c(0.9,0.9,0.9),
                       label=c("Healthy","Recover","Tuberculosis"))
ggplot(df, aes(x=xmin, y=ymin))+geom_point()+geom_line()+
  geom_bar(aes(y=ymin),stat = "identity")+
  facet_wrap2(group~.,axes = "all", remove_labels = "all")+# ggh4x是个神包来的，这样就把中间的全干掉了，还能缩
  coord_cartesian(clip = "off")+
  scale_y_continuous(limits = c(0,1.0),
                     breaks = seq(0,1.0,0.2),
                     minor_breaks = seq(0,1.0,0.02),
                     guide = "prism_minor",
                     expand = c(0,0),
                     sec.axis = sec_axis(~.*1,
                                         breaks = seq(0,1,0.2),
                                         name = expression({"mm5"^2}[2])))+# 这就很细节了，latex表示
  annotation_ticks(sides = "r", 
                   type = "minor", 
                   outside = TRUE,
                   minor.length = unit(3.0, "pt"),# 控制右坐标轴小刻度的显示
                   size = 0.9)+
  theme_prism(border = T,
              base_size = 12)+
  labs(x="age group",y=expression(paste("DALYs rates (×10"^2,")(per 100,000 people)")))+
  geom_text(df_title,mapping = aes(x=x,y=y,label=label),color=c("orange","red","blue"),size=5)+# 添加文字 #完成，太难了
  theme(panel.spacing = unit(0,"cm"),# 删去间距
        axis.text.x.bottom = element_text(angle = 90),
        strip.text = element_blank())+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-2,xmax = 8,ymin = -0.07,ymax = -0.07)+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-2.3,xmax = -2.3,ymin = 0.0,ymax = 1.0)


# 模仿另一个P2E的图片-------
# 生成数据
set.seed(1234)
df <- data.frame(x=runif(90,0,1))
df$y <- exp(df$x)
df$biggroup <- rep(letters[1:3],rep(30,3))
df$group <- rep(LETTERS[1:9],rep(10,9))
df$group2 <- rep(rep(c("delta","gama"),c(5,5)),9)
withy <- c("A","D","G")
withouty <- c("B","C","E","F","H","I")
df_title <- data.frame(x=rep(0.5,9),
                       y=rep(2.8,9),
                       group=LETTERS[1:9],
                       name=paste0(LETTERS[1:9],"~nice"),
                       biggroup=rep(letters[1:3],rep(3,3)))

# install.packages("jjAnno")
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(ggsci)
library(tidyverse)

## 用patchwork去生成这种图片，三个依次生成-----------
df %>% filter(biggroup =='a') %>% 
  ggplot(aes(x=x,y=y))+
  geom_point(aes(color=group2))+
  geom_line(aes(color=group2))+
  facet_wrap2(group~.,axes = "all", remove_labels = "all",nrow = 1)+# ggh4x是个神包来的，这样就把中间的全干掉了，还能缩
  coord_cartesian(clip = "off")+
  scale_y_continuous(limits = c(0,3),
                     breaks = seq(0,3,0.5),
                     minor_breaks = seq(0,3,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_x_continuous(limits = c(0,1),
                     breaks = seq(0,1,0.2))+
  theme_prism(base_size = 12)+
  scale_color_nejm()+
  labs(x="",y="")+
  geom_text(df_title %>% filter(biggroup=='a'),
            mapping=aes(x=x,y=y,label=name),colour=rep(pal_nejm("default")(3)[1]))+
  theme(axis.text.x.bottom = element_text(angle = 90),
        strip.text = element_blank())+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-2.42,xmax = -2.42,ymin = 0.0,ymax = 5.0)->p1
p1
df %>% filter(biggroup =='b') %>% 
  ggplot(aes(x=x,y=y))+
  geom_point(aes(color=group2))+
  geom_line(aes(color=group2))+
  facet_wrap2(group~.,axes = "all", remove_labels = "all",nrow = 1)+# ggh4x是个神包来的，这样就把中间的全干掉了，还能缩
  coord_cartesian(clip = "off")+
  scale_y_continuous(limits = c(0,3),
                     breaks = seq(0,3,0.5),
                     minor_breaks = seq(0,3,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_x_continuous(limits = c(0,1),
                     breaks = seq(0,1,0.2))+
  theme_prism(base_size = 12)+
  scale_color_nejm()+
  labs(x="",y=expression(paste("DALYs rates (×10"^2,")(per 100,000 people)")))+
  geom_text(df_title %>% filter(biggroup=='b'),
            mapping=aes(x=x,y=y,label=name),colour=rep(pal_nejm("default")(3)[1]))+
  theme(axis.text.x.bottom = element_text(angle = 90),
        strip.text = element_blank())+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-2.42,xmax = -2.42,ymin = 0.0,ymax = 5.0)->p2
p2
df %>% filter(biggroup =='c') %>% 
  ggplot(aes(x=x,y=y))+
  geom_point(aes(color=group2))+
  geom_line(aes(color=group2))+
  facet_wrap2(group~.,axes = "all", remove_labels = "all",nrow = 1)+# ggh4x是个神包来的，这样就把中间的全干掉了，还能缩
  coord_cartesian(clip = "off")+
  scale_y_continuous(limits = c(0,3),
                     breaks = seq(0,3,0.5),
                     minor_breaks = seq(0,3,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_x_continuous(limits = c(0,1),
                     breaks = seq(0,1,0.2))+
  theme_prism(base_size = 12)+
  scale_color_nejm()+
  labs(x="age group",y="")+
  geom_text(df_title %>% filter(biggroup=='c'),
            mapping=aes(x=x,y=y,label=name),colour=rep(pal_nejm("default")(3)[1]))+
  theme(axis.text.x.bottom = element_text(angle = 90),
        strip.text = element_blank())+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-0.1,xmax = 1.1,ymin = -0.5,ymax = -0.5)+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-2.42,xmax = -2.42,ymin = 0,ymax = 5.0)->p3
p3
p1/p2/p3

## P2E直接生成-------
df %>% 
  ggplot(aes(x=x,y=y))+
  geom_point(aes(color=group2))+
  geom_line(aes(color=group2))+
  facet_wrap2(group~.,scales = "free",remove_labels = "all",nrow = 3)+# ggh4x是个神包来的，这样就把中间的全干掉了，还能缩
  coord_cartesian(clip = "off")+# 关键步骤，没有它就不能用annotation添加直线
  scale_x_continuous(limits = c(0,1),
                     breaks = seq(0,1,0.2))+
  theme_prism(base_size = 12)+
  facetted_pos_scales(y=list(group%in%withouty~scale_y_continuous(limits = c(0,3),
                                                                  breaks = seq(0,3,0.5),
                                                                  labels = rep("",length(seq(0,3,0.5))),
                                                                  minor_breaks = seq(0,3,0.1),
                                                                  guide = "prism_minor",
                                                                  expand = c(0,0)),
                             group%in%withy~scale_y_continuous(limits = c(0,3),
                                                               breaks = seq(0,3,0.5),
                                                               minor_breaks = seq(0,3,0.1),
                                                               guide = "prism_minor",
                                                               expand = c(0,0))))+
  scale_color_nejm()+
  labs(x="age group",y=expression(paste("DALYs rates (×10"^2,")(per 100,000 people)")))+
  geom_text(df_title,
            mapping=aes(x=x,y=y,label=name),colour=rep(pal_nejm("default")(3),rep(3,3)))+
  theme(axis.text.x.bottom = element_text(angle = 90),
        strip.text = element_blank(),
        legend.position = "right")+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-0.1,xmax = 1.1,ymin = -7.5,ymax = -7.5)+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin=-2.43,xmax = -2.43,ymin = 0,ymax = 5.0)

# 生成P2E用cowplot------------------
# draw_line只画一条线段
# draw_label只添加文字，于是，我可以利用这种拼接的方式，加上去
library(ggplot2)
library(cowplot)
library(ggh4x)
library(tidyverse)


set.seed(1234)
df <- data.frame(x=runif(90,0,1))
df$y <- exp(df$x)
df$biggroup <- rep(letters[1:3],rep(30,3))
df$group <- rep(LETTERS[1:9],rep(10,9))
df$group2 <- rep(rep(c("delta","gama"),c(5,5)),9)
withy <- c("A","D","G")
withouty <- c("B","C","E","F","H","I")
df_title <- data.frame(x=rep(0.5,9),
                       y=rep(2.8,9),
                       group=LETTERS[1:9],
                       name=paste0(LETTERS[1:9],"~nice"),
                       biggroup=rep(letters[1:3],rep(3,3)))

df %>% 
  ggplot(aes(x=x,y=y))+
  geom_point(aes(color=group2))+
  geom_line(aes(color=group2))+
  facet_wrap2(group~.,scales = "free",remove_labels = "all",nrow = 3)+# ggh4x是个神包来的，这样就把中间的全干掉了，还能缩
  coord_cartesian(clip = "off")+# 关键步骤，没有它就不能用annotation添加直线
  scale_x_continuous(limits = c(0,1),
                     breaks = seq(0,1,0.2))+
  theme_prism(base_size = 12)+
  facetted_pos_scales(y=list(group%in%withouty~scale_y_continuous(limits = c(0,3),
                                                                  breaks = seq(0,3,0.5),
                                                                  labels = rep("",length(seq(0,3,0.5))),
                                                                  minor_breaks = seq(0,3,0.1),
                                                                  guide = "prism_minor",
                                                                  expand = c(0,0)),
                             group%in%withy~scale_y_continuous(limits = c(0,3),
                                                               breaks = seq(0,3,0.5),
                                                               minor_breaks = seq(0,3,0.1),
                                                               guide = "prism_minor",
                                                               expand = c(0,0))))+
  scale_color_nejm()+
  labs(x="",y="")+
  geom_text(df_title,
            mapping=aes(x=x,y=y,label=name),colour=rep(pal_nejm("default")(3),rep(3,3)))+
  theme(axis.text.x.bottom = element_text(angle = 90),
        strip.text = element_blank(),
        legend.position = "right")->p1

p1
ggdraw(xlim = c(0,1),ylim = c(0.94,0.98)) +
  draw_line(
    x = c(0.05,0.95),
    y = c(0.97,0.97),
    color = "black", size = 1
  )+
  draw_label(
    label = "age group",
    x=0.5,y=0.96)->p2

p2

ggdraw(xlim = c(0.1,0.135),clip = "off")+
  draw_line(
    x=c(0.13,0.13),
    y=c(0.1,0.99),
    color="black",
    size=1
  )+
  draw_label(
    label = expression(paste("DALYs rates (×10"^2,")(per 100,000 people)")),
    x=0.11,
    y=0.5,
    angle = 90
  )->p3
p3



plot_grid(plot_grid(p3,p1,ncol = 2,rel_widths = c(1,30))
          ,p2,
          ncol = 1,rel_heights = c(12,1))

# P2A画面积图 -------
# 老规矩，生成数据
set.seed(1234)
df <- data.frame(x=runif(10,0,1))
df$y <- exp(df$x)
for (i in 2:6) {
  df2 <- data.frame(x=df$x,
                    y=df$y/i)
  if(i==2){dfout <- rbind(df,df2)}
  else{dfout <- rbind(dfout,df2)}
}# /i后可以呈现出等比形态
dfout$group <- rep(LETTERS[1:6],rep(10,6))
dfout$biggroup <- letters[1]
df <- dfout
for (i in 2:3) {
  df2 <- data.frame(x=df$x,
                    y=df$y*i,
                    group=df$group)
  df2$biggroup <- letters[i] # 新的大组为用小写字母表示
  dfout <- rbind(dfout,df2)
}# *i为新的分面的列，为了显示出区别
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
df_title <- data.frame(x=0.27,
                       y=5.5,
                       name=c("25~49y","50~69y","70+y"),
                       biggroup=c("a","b","c"))
ggplot(dfout,aes(x=x,y=y))+
  geom_area(aes(fill=group),position = "identity")+
  scale_fill_manual(values = rev(brewer.pal(8,"YlOrRd"))[2:8])+
  scale_y_continuous(limits = c(0,8),
                     breaks = seq(0,8,2),
                     expand = c(0,0))+
  scale_x_continuous(limits = c(0,0.9),
                     breaks = seq(0.1,1,0.2),
                     expand = c(0,0))+
  labs(x="year",y=expression(paste("Total DALYs (×10"^6,")")))+
  geom_text(df_title,mapping=aes(x=x,y=y,label=name),size=6)+
  guides(fill=guide_legend(nrow = 2))+
  facet_wrap2(biggroup~.)+
  theme_prism()+
  theme(legend.position = c(0.2,0.9),
        panel.spacing = unit(0.9,"cm"),
        strip.text = element_blank())+
  coord_cartesian(clip = "off")+
  annotation_custom(grob = segmentsGrob(gp = gpar(col = "black",lwd = 2,lineend = "square")),
                    xmin = -0.07,xmax = 1.0, ymin = -0.7, ymax = -0.7)

## 模拟多维度森林图---------------
# 加载包
library(ggplot2)
library(ggh4x)


# 老规矩，创建模拟数据
set.seed(1122)
df <- data.frame(group1=rep(1:2,2),
                 group2="A",
                 group3=c(3,3,4,4),
                 group4="B",
                 x="a",
                 y=runif(4,0,1))
df$yl <- df$y-0.1
df$yh <- df$y+0.1
ggplot(df,aes(x=x,y=y))+
  geom_pointrange(aes(ymin=yl,ymax=yh))+# 点范围，erroebar是误差线，y决定了点的位置
  facet_nested(group2+group1~group4+group3)+
  coord_flip()

# P2B模拟图---------------
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
# 创建数据
set.seed(1234)
df <- data.frame(group=rep(c("a","b","c"),5),
                 biggroup=rep(LETTERS[1:5],rep(3,5)),
                 y=runif(15,0,1))

df %>% mutate(
  val = case_when(biggroup%in%c("A","B","C")~y*(-1),
                  TRUE~y),
  group = factor(group,c("a","b","c"),c("25~49years","50~69years","70+years")),
  biggroup = factor(biggroup,LETTERS[1:5],c("High SDI","High-middle SDI","Middle SDI","Low-middle SDI","Low SDI"))
) -> df # 创建出负数，对应于那边的图片
# 画图开始
ggplot(df,aes(x=biggroup, y=val, fill=group))+
  geom_bar(stat = "identity", 
           position = position_dodge2(padding = 0.2),
           width = 0.5)+
  geom_hline(yintercept = 0)+
  scale_y_continuous(limits = c(-1,1),
                     breaks = seq(-1,1,0.5),
                     expand = c(0,0))+
  scale_fill_nejm()+
  labs(x="",y=expression(paste("Percentage changes\nof DALYs rates (×10"^2,"%)")))+
  theme_prism(base_line_size = 0.5)+
  guides(fill = guide_legend(byrow = TRUE))+# 只有这个代码才能够调整
  theme(plot.margin = margin(.5,.5,.5,.5,"cm"),# 又学了一招，这个是调整图形大小的，top right left below
        axis.text.x = element_text(angle = 20),
        legend.position = c(0.2,0.95),
        legend.text = element_text(size = 18),
        legend.key.width = unit(1.2,"cm"),
        legend.key.height = unit(0.6,"cm"),
        legend.spacing.y = unit(1, "cm"))
# 完成
# 模仿P1A~D~E折线图-------
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(gridExtra)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
library(cowplot)
library(showtext)
# 数据创造
# 通过观察，大图最小值100，最大值350
# 小图是大概，然后为了显示清楚，小图里面嵌套大图大图/8
# 所以说有两个数据集够模仿了
# 为了凑齐名字，应该有第三个数据集，再除以8
# 画图的时候用patchwork里面的函数inset_element
# 尝试用patchwork拼图后，cowplot调整
# 注意横纵坐标
set.seed(1234)
df1 <- data.frame(x=rep(seq(1990,2019,1),6),
                  biggroup="IS",
                  group=rep(c(LETTERS[1:6]),rep(30,6)))
df1$y <- 0.1*df1$x
for(i in 1:dim(df1)[1]){
  for(j in 1:6){
    if(df1$group[i]==LETTERS[j]){df1$y[i] <- df1$y[i]-j*8}
  }
}
df2 <- data.frame(x=df1$x,
                  y=df1$y/8,
                  biggroup="ICH",
                  group=df1$group)
df3 <- data.frame(x=df2$x,
                  y=df2$y/8,
                  biggroup="SAH",
                  group=df2$group)
# P1A 复刻

ggplot(df1,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(150,210),
                     breaks = seq(150,210,10),
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="year",y="ASDR\n(per 100,000 people)")+
  annotate("text",x=2017,y=205,label="IS", #serif就是文献的字体
           size=12,color="#fa9fb5",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))

# P1C复刻
ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,210),
                     breaks = seq(0,200,50),
                     minor_breaks = seq(0,210,10),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="year",y="ASDR\n(per 100,000 people)")+
  annotate("text",x=2017,y=190,label="SAH", #serif就是文献的字体
           size=12,color="#fa9fb5",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))->pic_self

ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,10),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(2,4),
                     breaks = seq(2,4,0.5),
                     minor_breaks = seq(2,4,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))->pic_large

pic_self+
  inset_element(p = pic_large, # inset_element 合并图片
                left = 0.1,
                right = 1,
                bottom = 0.1,
                top = 1,
                on_top = F)
# type(P1E)=type(P1A)+type(P1C)
# need df2
ggplot(df1,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(150,210),
                     breaks = seq(150,210,20),
                     minor_breaks = seq(150,210,10),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="ASDR\n(per 100,000 people)")+
  annotate("text",x=2017,y=205,label="IS", #serif就是文献的字体
           size=12,color="#fa9fb5",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text.x = element_blank())->p1E_1
p1E_1

ggplot(df1,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(150,210),
                     breaks = seq(150,210,20),
                     minor_breaks = seq(150,210,10),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  annotate("text",x=2017,y=205,label="ICH", #serif就是文献的字体
           size=12,color="#bcbddc",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text.x = element_blank(),
        axis.text.y = element_blank())->p1E_2
p1E_2

ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,200),
                     breaks = seq(0,200,50),
                     minor_breaks = seq(0,200,25),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  annotate("text",x=2017,y=190,label="SAH", #serif就是文献的字体
           size=12,color="#9ecae1",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text = element_blank())->pic_self
pic_self
ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,10),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(2,4),
                     breaks = seq(2,4,0.5),
                     minor_breaks = seq(2,4,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))->pic_large
pic_large
pic_self+
  inset_element(p = pic_large, # inset_element 合并图片
                left = 0.1,
                right = 1,
                bottom = 0.1,
                top = 1,
                on_top = F)->p1E_3
p1E_3

ggplot(df1,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(150,210),
                     breaks = seq(150,210,20),
                     minor_breaks = seq(150,210,10),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="ASDR\n(per 100,000 people)")+
  annotate("text",x=2017,y=205,label="IS", #serif就是文献的字体
           size=12,color="#fa9fb5",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text.x = element_blank())->p1E_4
p1E_4

ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,200),
                     breaks = seq(0,200,50),
                     minor_breaks = seq(0,200,25),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  annotate("text",x=2017,y=190,label="ICH", #serif就是文献的字体
           size=12,color="#9ecae1",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text = element_blank())->pic_self
pic_self
ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,10),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(2,4),
                     breaks = seq(2,4,0.5),
                     minor_breaks = seq(2,4,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))->pic_large
pic_large
pic_self+
  inset_element(p = pic_large, # inset_element 合并图片
                left = 0.1,
                right = 1,
                bottom = 0.1,
                top = 1,
                on_top = F)->p1E_5
p1E_5

ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,200),
                     breaks = seq(0,200,50),
                     minor_breaks = seq(0,200,25),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  annotate("text",x=2017,y=190,label="SAH", #serif就是文献的字体
           size=12,color="#9ecae1",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text = element_blank())->pic_self
pic_self
ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,10),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(2,4),
                     breaks = seq(2,4,0.5),
                     minor_breaks = seq(2,4,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))->pic_large
pic_large
pic_self+
  inset_element(p = pic_large, # inset_element 合并图片
                left = 0.1,
                right = 1,
                bottom = 0.1,
                top = 1,
                on_top = F)->p1E_6
p1E_6

ggplot(df1,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(150,210),
                     breaks = seq(150,210,20),
                     minor_breaks = seq(150,210,10),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="ASDR\n(per 100,000 people)")+
  annotate("text",x=2017,y=205,label="IS", #serif就是文献的字体
           size=12,color="#fa9fb5",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))->p1E_7
p1E_7

ggplot(df1,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(150,210),
                     breaks = seq(150,210,20),
                     minor_breaks = seq(150,210,10),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  annotate("text",x=2017,y=205,label="ICH", #serif就是文献的字体
           size=12,color="#fa9fb5",family="serif")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text.y = element_blank())->p1E_8
p1E_8

ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,5),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,200),
                     breaks = seq(0,200,50),
                     minor_breaks = seq(0,200,25),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  annotate("text",x=2017,y=190,label="SAH", #serif就是文献的字体
           size=12,color="#9ecae1",family="serif")+
  theme_prism()+
  theme(legend.position = "right",
        axis.title.y = element_text(hjust = 0.5,family="serif"),
        axis.text.y = element_blank())->pic_self
pic_self
ggplot(df3,aes(x=x,y=y))+
  geom_point(aes(colour=group))+
  geom_line(aes(colour=group))+
  scale_x_continuous(limits = c(1990,2020),
                     breaks = seq(1990,2020,10),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(2,4),
                     breaks = seq(2,4,0.5),
                     minor_breaks = seq(2,4,0.1),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_color_nejm()+
  labs(x="",y="")+
  theme_prism()+
  theme(legend.position = "none",
        axis.title.y = element_text(hjust = 0.5,family="serif"))->pic_large
pic_large
pic_self+
  inset_element(p = pic_large, # inset_element 合并图片
                left = 0.1,
                right = 1,
                bottom = 0.1,
                top = 1,
                on_top = F)->p1E_9
p1E_9
# patchwork拼图
design_pic <- "123"
(p1E_1+p1E_2+p1E_3+plot_layout(design = design_pic))/(p1E_4+p1E_5+p1E_6+plot_layout(design = design_pic))/(p1E_7+p1E_8+p1E_9+plot_layout(design = design_pic))+
  plot_layout(design = "1
              2
              3",
              guides = "collect")->p1E_main

# 拼图
# 画直线
ggdraw(xlim = c(0,1),ylim = c(0.94,0.98)) +
  draw_line(
    x = c(0.05,0.95),
    y = c(0.97,0.97),
    color = "black", size = 1
  )+
  draw_label(
    label = "year",
    x=0.5,y=0.96)->p1E_line
# 拼图图
plot_grid(p1E_main,
          p1E_line,
          ncol = 1,
          rel_heights = c(10,1))
# p1E 完成模拟

# p1F模拟-------
# 经过观察，极有可能是分面造出来的，所以考虑ggh4x的分面或者简单facet_grid
# df_title 用于标注数字，也许不一定用得到
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(gridExtra)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
library(cowplot)
library(showtext)
# 创造数据，要知道一共5组，可以直接用嘛，哎，搞那么麻烦干嘛
df <- data.frame(y=c(27,67,7,29,61,10,34,53,14,52,40,7,63,28,9,43,47,10),
                 group=rep(c("IS","ICH","SAH"),6),
                 x=rep(c("Low SDI","Low-middle SDI","Middle SDI","High-middle SDI","High SDI","Global"),rep(3,6)),
                 year=1990)
df2 <- data.frame(y=c(34,60,6,38,55,7,47,47,6,59,35,6,59,29,11,48,45,7),
                  group=rep(c("IS","ICH","SAH"),6),
                  x=rep(c("Low SDI","Low-middle SDI","Middle SDI","High-middle SDI","High SDI","Global"),rep(3,6)),
                  year=2019)
df <- rbind(df,df2)

df %>% mutate(
  x = factor(x,rev(c("Low SDI","Low-middle SDI","Middle SDI","High-middle SDI","High SDI","Global")))
) -> df
df %>% ggplot(aes(x=x,y=y,fill=group))+
  geom_bar(stat = "identity",
           position = position_fill(reverse = T),
           width = 0.5)+
  geom_text(mapping = aes(label=y),
            position = position_fill(reverse = T,vjust = 0.5),
            size =7,
            hjust = 0.5,
            vjust = 0.1)+
  coord_flip()+
  scale_x_discrete(expand = c(0,0))+
  scale_y_continuous(breaks = seq(0,1,0.2),
                     labels = seq(0,100,20),
                     expand = c(0,0))+
  scale_fill_manual(values = c("#fa9fb5","#bcbddc","#9ecae1"))+
  labs(x="",y="")+
  facet_wrap2(year~.,nrow = 1,remove_labels = "all",axes = "all")+
  theme_prism()+
  theme(axis.ticks.y = element_blank(),
        strip.text = element_text(size = 20),
        panel.spacing = unit(0.5,"cm"))->p1F_main
p1F_main
# 画直线
ggdraw(xlim = c(0,1),ylim = c(0.94,0.98)) +
  draw_line(
    x = c(0,1),
    y = c(0.97,0.97),
    color = "black", size = 1
  )+
  draw_label(
    label = "Percentage (100%) in total stroke DALYs",
    x=0.5,y=0.96)->p1F_line
p1F_line
# 拼图图(cowplot)
plot_grid(p1F_main,p1F_line,ncol = 1,rel_heights = c(12,1))
# 拼图图(plot_layout) 这个显然看起来舒服，且比例合适
p1F_main/p1F_line+plot_layout(heights = c(12,1))
# p1F构造完毕

# p3F画面积图模仿 ---------------------------
# 加载包
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(gridExtra)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
library(cowplot)
library(showtext)
# 构造数据集
df <- data.frame(x=seq(1990,2019,1))
df$y <- exp((df$x-1989)/10) # 很beautiful的处理
df$group <- "a"
for (i in 2:5) {
  df2 <- data.frame(x=df$x,
                    y=df$y/i,
                    group=letters[i])
  if(i==2){dfout <- rbind(df,df2)}
  else{dfout <- rbind(dfout,df2)}
}
dfout$biggroup <- "Male"
dfout2 <- dfout %>% mutate(biggroup="Female")
dfout <- rbind(dfout,dfout2)
# 画图 
dfout %>% filter(biggroup=="Male") %>% 
  ggplot(aes(x=x,y=y))+
  geom_area(aes(fill=group),position = "identity")+
  scale_fill_manual(values = rev(brewer.pal(8,"YlOrRd")[1:5]))+
  scale_x_continuous(limits = c(1990,2019),
                     breaks = seq(1990,2019,4),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,21),
                     breaks = seq(0,21,3),
                     guide = "prism_offset")+
  labs(x="",y=expression(paste("Total DALYs (×10"^6,")")))+
  theme_prism()+
  theme(legend.position = "none")+
  annotate(geom = "text",label = "Male",
           x=2005, y=15,  size = 12, color = "#2b8cbe",
           family = "serif")+
  coord_cartesian(clip = "off") -> p3F_male
p3F_male

dfout %>% filter(biggroup=="Female") %>% 
  ggplot(aes(x=x,y=y))+
  geom_area(aes(fill=group),position = "identity")+
  scale_fill_manual(values = rev(brewer.pal(8,"YlOrRd")[1:5]))+
  scale_x_reverse(limits = c(2019,1990),
                  breaks = seq(2018,1990,-4),
                  expand = c(0,0))+
  scale_y_continuous(limits = c(0,21),
                     breaks = seq(0,21,3),
                     guide = "prism_offset")+
  labs(x="",y="")+
  theme_prism()+
  theme(legend.position = "none",
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.line.y = element_blank())+
  annotate(geom = "text",label = "Female",
           x=2005, y=15,  size = 12, color = "#e34a33",
           family = "serif")+
  coord_cartesian(clip = "off") -> p3F_female
p3F_female
p3F_male+p3F_female
# 这种拼接的没法保证在同一水平上，所以感觉不够好
# 分面可以确保坐标轴稳定
# 可以用pdf修图
dftitle <- data.frame(x=c(2005,2005),
                      y=c(17,17),
                      biggroup=c("Female","Male"),
                      name = c("Female","Male"))
dftitle$biggroup <- factor(dftitle$biggroup,c("Male","Female"))
dfout %>% mutate(biggroup = factor(biggroup,levels = c("Male","Female"))) %>% 
  ggplot(aes(x=x,y=y))+
  geom_area(aes(fill=group),position = "identity")+
  scale_fill_manual(values = rev(brewer.pal(8,"YlOrRd")[1:5]))+
  scale_x_continuous(limits = c(1990,2019),
                     breaks = seq(1990,2019,4),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,21),
                     breaks = seq(0,21,3),
                     guide = guide_prism_offset(check.overlap = TRUE),
                     sec.axis = dup_axis())+
  labs(x="",y=expression(paste("Total DALYs (×10"^6,")")))+
  facet_wrap(biggroup~.,nrow = 1,scales = "free_x")+
  geom_text(dftitle,mapping = aes(x=x,y=y,label=name),
            colour=c("#e34a33","#2b8cbe"),
            size = 12)+
  theme_prism()+
  facetted_pos_scales(x=list(biggroup=="Female"~scale_x_reverse(limits = c(2019,1990),
                                                              breaks = seq(2018,1990,-4),
                                                              expand = c(0,0))))+
  theme(legend.position = "none",
        strip.text = element_blank(),
        axis.line.y.left = element_blank(),
        axis.ticks.y.left  = element_blank(),
        axis.text.y.left = element_blank(),
        axis.title.y.right = element_blank(),
        panel.spacing = unit(2.8,"cm"))+
  coord_cartesian(clip = "off")->p3F_main
p3F_main
ggdraw(xlim = c(0,1),ylim = c(0.94,0.98)) +
  draw_line(
    x = c(0.00,1.00),
    y = c(0.97,0.97),
    color = "black", size = 1
  )+
  draw_label(
    label = "year",
    x=0.5,y=0.96)->p3F_line
p3F_line
# 用patchwork拼图比cowplot拼图稳定
p3F_main/p3F_line+plot_layout(heights = c(12,1))->forps
ggsave(filename = "pictureget/forps.png",plot = forps,width = 10,height = 5)
ggsave(filename = "pictureget/forps.svg",plot = forps,width = 10,height = 5)
ggsave(filename = "pictureget/forps.pdf",plot = forps,width = 10,height = 5)
# pdf修图好一点
# 感谢ggplot2 给了pdf的输出格式，救了大命
# p3F完成复刻

# P2A复刻来了，readr处理.zip---------
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(gridExtra)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
library(cowplot)
library(showtext)
# 对2A处理
df_2a <- read_csv(file = "2A.zip")
df_2a %>% mutate(
  age_group = case_when(
    age_name=="25-49 years"~"25-49y",
    age_name=="50-69 years"~"50-69y",
    age_name=="70+ years"~"70+y"),
  location_name = factor(location_name,c("High SDI","High-middle SDI","Middle SDI","Low-middle SDI","Low SDI"))
) -> df_2a
# group=location_name
# x=year y=val facet = age_group
# 画图
# df_title <- data.frame(x=0.27,
#                        y=5.5,
#                        name=c("25~49y","50~69y","70+y"),
#                        biggroup=c("a","b","c"))
df_title <- data.frame(x=rep(1994,3),
                       y=rep(9,3),
                       name=c("25-49y","50-69y","70+y"),
                       age_group=names(table(df_2a$age_group)))
ggplot(df_2a,aes(x=year,y=val/(10^6)))+
  geom_area(aes(fill=location_name),position = "stack")+
  scale_fill_manual(values = rev(brewer.pal(8,"YlOrRd")[1:5]))+
  scale_x_continuous(limits = c(1990,2019),
                     breaks = seq(1990,2019,4),
                     minor_breaks = seq(1990,2019,2),
                     guide = "prism_minor",
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,16),
                     breaks = seq(0,15,3),
                     expand = c(0,0))+
  labs(x="",y=expression(paste("Total DALYs (×10"^6,")")))+
  # geom_text(df_title,mapping=aes(x=x,y=y,label=name),size=6)+
  facet_wrap2(age_group~.,nrow = 1)+
  geom_text(df_title, mapping = aes(x=x,y=y,label=name),
            size=5, family="serif")+
  theme_prism()+
  guides(fill = guide_legend(byrow = TRUE,nrow = 2))+
  theme(legend.position = c(0.25,0.9),
        panel.spacing = unit(0.9,"cm"),
        strip.text = element_blank(),
        legend.key.width  = unit(0.5,"cm"),
        legend.key.height = unit(0.5,"cm"),
        legend.spacing.y = unit(0.8,"cm"),
        legend.text = element_text(size = 12),
        axis.text.x = element_text(size = 12,angle = 45))+
  coord_cartesian(clip = "off")->p2A_main
p2A_main
ggdraw(xlim = c(0,1),ylim = c(0.94,0.98)) +
  draw_line(
    x = c(0.00,1.00),
    y = c(0.97,0.97),
    color = "black", size = 1
  )+
  draw_label(
    label = "year",
    x=0.5,y=0.96) ->p2A_line
p2A_line
p2A_main+p2A_line+plot_layout(heights = c(12,1))->p2A
p2A
ggsave(filename = "try_global_health_homework/p2A.pdf",
       width = 10,height = 5)

# p2B复刻来了--------
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(gridExtra)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
library(cowplot)
library(showtext)
# 导入数据
df_2b <- read_csv(file = "2B.zip")
df_2b %>% mutate(
  age_group = case_when(
    age_name=="25-49 years"~"25-49y",
    age_name=="50-69 years"~"50-69y",
    age_name=="70+ years"~"70+y"),
  location_name = factor(location_name,c("Global","High SDI","High-middle SDI","Middle SDI","Low-middle SDI","Low SDI"))
) -> df_2b
# x=location_name fill=age_group
ggplot(df_2b,aes(x=location_name, y=val, fill=age_group))+
  geom_bar(stat = "identity", 
           position = position_dodge2(padding = 0.2),
           width = 0.5)+
  geom_hline(yintercept = 0)+
  scale_y_continuous(limits = c(-0.4,0.4),
                     breaks = seq(-0.4,0.4,0.2),
                     expand = c(0,0))+
  scale_fill_nejm()+
  labs(x="",y=expression(paste("Percentage changes\nof DALYs rates (×10"^2,"%)")))+
  theme_prism(base_line_size = 0.5)+
  guides(fill = guide_legend(byrow = TRUE))+# 只有这个代码才能够调整
  theme(plot.margin = margin(.5,.5,.5,.5,"cm"),
        axis.text.x = element_text(angle = 45),
        legend.position = c(0.2,0.95),
        legend.text = element_text(size = 18),
        legend.key.width = unit(1.2,"cm"),
        legend.key.height = unit(0.6,"cm"),
        legend.spacing.y = unit(0.8, "cm"))->p2B
p2B
ggsave(filename = "try_global_health_homework/p2B.pdf",
       width = 15, height = 10)
# P2B复现结束

# P2C复现开始-------------
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(gridExtra)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
library(cowplot)
library(showtext)
# 导入数据
df_2c <- read_csv(file = "2C.zip")
df_2c <- df_2c %>% mutate(
  age_x = as.numeric(factor(df_2c$age_name,names(table(df_2c$age_name)),labels = seq(1,15,1))),
  year = as.character(year),
  cause_name = factor(cause_name,
                      c("Stroke","Ischemic stroke","Intracerebral hemorrhage","Subarachnoid hemorrhage"),
                      c("Total stroke","IS","ICH","SAH"))
)
names(table(df_2c$cause_name))
df_2c_left <- df_2c %>% filter(metric_name=="Number")
df_2c_right <- df_2c %>% filter(metric_name=="Rate")
inner_join(df_2c_left,df_2c_right, by = c("age_x","age_name","cause_name","year"))->df_2c
# 标注题头
df_title <- data.frame(x=rep(8,4),
                       y=rep(5.5,4),
                       cause_name = c("Total stroke","IS","ICH","SAH"),
                       name = c("Total stroke","IS","ICH","SAH"))
df_title$cause_name <- factor(df_title$cause_name,c("Total stroke","IS","ICH","SAH"))
# 画P2C
ggplot(df_2c, aes(x=age_x))+
  geom_bar(aes(y=val.x/(10^6),fill=year),stat = "identity",position = "dodge")+
  geom_point(aes(y=val.y/(10^3),color=year))+
  geom_line(aes(y=val.y/(10^3),color=year))+
  facet_wrap2(cause_name~.,axes = "all", remove_labels = "all",nrow = 1)+
  coord_cartesian(clip = "off")+
  geom_text(df_title,mapping = aes(x=x,y=y,label=name),
            size=5,family="serif",
            color=c("black","#fa9fb5","#bcbddc","#fa9fb5"))+
  scale_x_continuous(limits = c(0,16),
                     breaks = seq(1,15,1),
                     labels = c(paste0(seq(25,90,5),"-",seq(29,94,5)),"95+"),
                     expand = c(0,0))+
  scale_y_continuous(limits = c(0,6),
                     breaks = seq(0,6,2),
                     minor_breaks = seq(0,6,0.2),
                     guide = "prism_minor",
                     expand = c(0,0),
                     sec.axis = sec_axis(~.*1,
                                         breaks = seq(0,6,2),
                                         name = expression(paste("DALYs rates (×10"^3,")(per 100,000 people)"))))+# 这就很细节了，latex表示
  annotation_ticks(sides = "r", 
                   type = "minor", 
                   outside = TRUE,
                   minor.length = unit(3.0, "pt"),# 控制右坐标轴小刻度的显示
                   size = 0.9)+
  scale_fill_manual(name = "year",values = c("#6baed6","#08519c"))+
  scale_color_manual(name = "year2",values = c("#df65b0","#980043"))+
  theme_prism(border = T,
              base_size = 12)+
  guides(fill = guide_legend(byrow = TRUE,nrow = 2))+# 只有这个代码才能够调整
  guides(color = guide_legend(byrow = TRUE,nrow = 2,size = 6))+# 只有这个代码才能够调整
  labs(x="",y=expression(paste("DALYs (×10"^6,")")))+
  # geom_text(df_title,mapping = aes(x=x,y=y,label=label),color=c("orange","red","blue"),size=5)+# 添加文字 #完成，太难了
  theme(panel.spacing = unit(0,"cm"),# 删去间距
        axis.text.x.bottom = element_text(angle = 90),
        strip.text = element_blank(),
        legend.position = "top")->p2C_main
p2C_main
ggdraw(xlim = c(0,1),ylim = c(0.94,0.98)) +
  draw_line(
    x = c(0.00,1.00),
    y = c(0.97,0.97),
    color = "black", size = 1
  )+
  draw_label(
    label = "age group",
    x=0.5,y=0.96) ->p2C_line
p2C_line
p2C_main+p2C_line+plot_layout(heights = c(12,1))->p2C
p2C
ggsave(filename = "try_global_health_homework/p2C.pdf",
       plot = p2C,
       width = 10,height = 5)
# p2C画图结束














# tidyr拆分列名--------------
# 列名可以拆分出来变成各个列
library(tidyr)
data(who)
who %>% pivot_longer(
  cols = new_sp_m014:newrel_f65,
  names_to = c("diagnosis", "gender", "age"),
  names_pattern = "new_?(.*)_(.)(.*)",
  values_to = "count"
)->who_ext 
who_ext
# ?为贪婪匹配，_可以出现1次或0次，有没有不影响第一个(.*)
# (.)单个字符
# *匹配0-n次，优先匹配n次，相当于{0,}

data(anscombe)
anscombe %>%
  pivot_longer(
    everything(),
    names_to = c(".value", "set"),
    names_pattern = "(.)(.)"
  )
# ".value" indicates that the corresponding component of the 
# column name defines the name of the output column containing 
# the cell values, overriding values_to entirely.

# 分面图绘制截断--------------
# 加载包
library(jjAnno)
library(ggplot2)
library(ggh4x)
library(patchwork)
library(ggprism)
library(grid)
library(gridExtra)
library(ggsci)
library(tidyverse)
library(RColorBrewer)
library(cowplot)
library(showtext)
# 构建数据
df0 <- data.frame(x = seq(1,10,1),
                  y = seq(1,10,1),
                  group = "A",
                  biggroup = "a")
df1 <- data.frame(x = seq(1,10,1),
                  y = seq(1,10,1)+50,
                  group = "B",
                  biggroup = "b")
df2 <- data.frame(x = seq(1,10,1),
                  y = seq(1,10,1)+60,
                  group = "C",
                  biggroup = "b")
df3 <- data.frame(x = seq(1,10,1),
                  y = seq(1,10,1)+1000,
                  group = "D",
                  biggroup = "c")
# group用来分组
# biggroup用来分面
df <- rbind(rbind(df0,df1),rbind(df2,df3))

df$biggroup <- factor(df$biggroup,c("c","b","a"))
# 画图
ggplot(data = df,mapping = aes(x=x,y=y))+
  geom_point(aes(color = group))+ # 不同group不同颜色
  geom_line(aes(color = group))+ 
  facet_wrap2(biggroup~., ncol = 1, scales = "free_y")+ #来源于ggh4x，scales设置free为了下面能调整每个分面情况
  facetted_pos_scales(y = list(biggroup=="a"~scale_y_continuous(limits = c(0,10),
                                                                breaks = seq(0,10,2.5),
                                                                expand = c(0,0)),
                               biggroup=="b"~scale_y_continuous(limits = c(50,70),
                                                                breaks = seq(50,70,5),
                                                                expand = c(0,0)),
                               biggroup=="c"~scale_y_continuous(limits = c(1000,1010),
                                                                breaks = seq(1000,1010,2.5),
                                                                expand = c(0,0))))+
  # ggh4x函数，自由调整每个分面坐标轴
  theme_prism(base_size = 10)+ # 设置边界大小
  theme(strip.text = element_blank(), # 删除分面的标签
        panel.spacing.y = unit(0.5,"cm")) # 设置分面距离

# sas data selected-----------------
df <- read.csv("sas_hapc/data_6_1974_2006.csv")
library(tidyverse)
df %>% filter(YEAR %in% seq(1974,2006,2) & 
                !is.na(AGE) &
                !is.na(RACE) &
                !is.na(WORDSUM) &
                RACE != 3 &
                !is.na(SEX) &
                !is.na(YEAR) &
                !is.na(EDUC)) -> df2
df2$C = df2$YEAR-df2$AGE
df2 %>% filter(C %in% c(1894,seq(1895,1985,5))) -> df2
df2 %>% mutate(
  SEX = SEX-1,
  RACE = RACE-1
)->df2

# install.packages("sjPlot")
library(sjPlot)

# install.packages("emmeans")
tab_itemscale(df2)
names(df2)[c(1,7)] <- c("Period","Cohort")
names(table(df2$Period))
names(table(df2$Cohort))
write.csv(df2,file = "sas_hapc/end.csv")

df2 %>% mutate(
  Period = factor(as.character(Period)),
  Cohort = factor(as.character(Cohort))
) ->df2 # 因子化 # 很重要的步骤

df2$AGE <- df2$AGE-46
df2$AGE2 <- (df2$AGE)^2 #必须有

library(lme4)
lmer(data = df2,
     formula = WORDSUM~AGE+AGE2+EDUC+SEX+RACE+
       (1|Period)+
       (1|Cohort))->lm1 # 构造分层模型
summary(lm1)->sumlm1
sumlm1
coefficients(lm1)->coeflm1
coeflm1$Period[1]-1.9092314
coeflm1$Cohort[1]-1.9092314
tab_model(lm1)
library(nlme)
random.effects(lm1)

# install.packages("lmerTest")
library(lmerTest)
ranova(lm1)
anova(lm1)


# install.packages("broom.mixed")
library(broom.mixed)
tidy(lm1,conf.int=TRUE,exponentiate=TRUE,effects="ran_vals")->random_df
random_df # 可以计算标准差，但不能计算t检验
glance(lm1)
augment(lm1)

effectsize::omega_squared(lm1)
effectsize::eta_squared(lm1)
library(mixedup)

extract_random_effects(lm1,digits = 4)# 和tidy那个结果一样
extract_random_coefs(lm1) 

tidy(lm1,conf.int=TRUE,exponentiate=TRUE,effects="ran_vals") # 和上面一样

# myd datas---------------
library(openxlsx)
df <- read.xlsx("testfrom_myd.xlsx")
names(df)[c(1,6,7)] <- c("country","year2018","year2019")
name_country <- df$country[1]
for (i in 1:length(df$country)) {
  if(is.na(df$country[i])){df$country[i] <- name_country}
  else{name_country <- df$country[i]}
}
df %>% filter((!is.na(X2) | !is.na(X3) | !is.na(X4)))->df

write.csv(df,"testfrommyd.csv")


# plots of points and lines-------------
library(ggplot2)
library(tidyverse)
library(ggprism)
library(ggtext)
data(iris)

iris %>% filter(Species %in% c("setosa","versicolor") &
                  Sepal.Length <=5.5 &
                  Sepal.Width <=3.0) -> iris_sub

min(iris_sub$Sepal.Length)
max(iris_sub$Sepal.Length)

ggplot(iris_sub, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_abline(intercept = -5, slope = 1.5, lty = 2, size = 1)+
  geom_abline(intercept = 10, slope = -1.5, lty = 2, size = 1)+
  geom_hline(yintercept = 2.5, size = 1)+
  geom_vline(xintercept = 5, lty = 2, size = 1)+
  geom_richtext(mapping = aes( x = 6.0, y = 2.5, label = "WORDS"),
                label.colour = "white")+
  geom_point(aes(color = Species), size = 4)+
  scale_x_continuous(limits = c(4.2,6.2))+
  theme_prism(border = T)+
  theme(panel.background = element_rect(fill = "#c6dbef"))


# kmeans try-----------
# stats::kmeans
x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
           matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(x) <- c("x", "y")
(cl <- kmeans(x, 2))
plot(x, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex = 2)
# cluster
library(cluster)
x <- rbind(cbind(rnorm(10,0,0.5), rnorm(10,0,0.5)),
           cbind(rnorm(15,5,0.5), rnorm(15,5,0.5)))
x <- as.data.frame(x)
pamx <- pam(x, 2)
pamx$clustering
x$cluster <- pamx$clustering
