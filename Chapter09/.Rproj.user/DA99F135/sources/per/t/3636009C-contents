library(ggplot2)
library(boot)

set.seed(56342) #중심위치설정을 위한 난수생성

#학습데이터와 실험데이터 분리
idx<-sample(1:2, nrow(amis), replace=T, prob=c(0.6, 0.4))
train<-amis[idx==1,]
test<-amis[idx==2,]

#학습데이터 표준화
amis$speed<-as.numeric(amis$speed)
amis$warning<-as.numeric(amis$warning)
amis$period<-as.numeric(amis$period)
train.data<-scale(train[1:4])

#k-means함수구동
data_kmeans<-kmeans(train.data[1:4], centers=3, iter.max=100000)

#명목화와 결과보기
#amis$warning<-as.factor(data_kmeans$warning)
print(table(amis$warning))

#그래프그리기
a<-qplot(period,speed,colour=warning,data=amis)
print(a)