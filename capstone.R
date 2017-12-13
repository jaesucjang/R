###### DATA 처리 

gc()
rm(list=ls())
rm()

#rm(list = 'tbsm_blck_selng')
.rs.restartR()
gc(reset=T)

setwd("D:/capstone")
setwd("D:/capstone/data/3 (1)/17.상권-추정매출")
getwd()

#tbsm_blck_selng <- read.csv('tbsm_blck_selng.txt',header = F, stringsAsFactors = F, na.strings = c('NULL',''),sep = "|")
tbsm_trdar_selng_1 <- read.csv('tbsm_trdar_selng.txt',header = F, stringsAsFactors = F, na.strings = c('NULL',''),sep = "|")

## comname_info from table 및 필드 정의서 
col1=read.csv('colname.csv',header = F, stringsAsFactors = F, na.strings = c('NULL',''))


col1=col1[1:83,]
colnames(tbsm_trdar_selng_1)=col1

tbsm_trdar_selng=tbsm_trdar_selng_1[c(-1,-2),]
  
head(tbsm_trdar_selng)

#### 데이타 탐색 
library("dplyr") 

colnames(tbsm_trdar_selng)
temp2=tbsm_trdar_selng %>%
    group_by(상권_코드_명) %>%
    summarize(당월매출금액 = sum(당월_매출_금액)/sum(점포수))

head(상권_코드_명)

tbsm_trdar_selng_2=tbsm_trdar_selng[,c(-3,-4,-5)]

pairs(tbsm_trdar_selng_2)
colnames(tbsm_trdar_selng)
temp4=tbsm_trdar_selng %>%
  group_by(서비스_업종_코드_명, 상권_코드_명) %>%
  summarize(당월매출금액 = sum(당월_매출_금액)/sum(점포수))




sort(temp1$당월매출금액)

temp1_order <- temp1[order(-temp1$당월매출금액), ]
temp2_order <- temp2[order(-temp2$당월매출금액), ]
temp3_order <- temp3[order(-temp3$당월매출금액), ]
temp4_order <- temp4[order(-temp4$당월매출금액), ]
### n “bayesQR” 

#install.packages("bayesQR")

plot(temp1_order)

## Plot 그리기 

library(ggplot2)

g<- ggplot(data=temp2_order, aes(y = temp2_order$당월매출금액, x = temp2_order$상권_코드_명)) 
g
g+geom_point()

summary(temp2_order)
hist(temp2_order$당월매출금액)
logx=log(temp2_order$당월매출금액)
hist(logx)
hist(temp1_order$당월매출금액)

