library(ggplot2)
library(boot)

set.seed(56342) #중심위치설정을 위한 난수생성

#학습데이터와 실험데이터 분리
idx<-sample(1:2, nrow(motor), replace=T, prob=c(0.6, 0.4))
train<-motor[idx==1,]
test<-motor[idx==2,]

#학습데이터 표준화
motor$accel<-as.numeric(motor$accel)
motor$times<-as.numeric(motor$times)
motor$strata<-as.numeric(motor$strata)
train.data<-scale(train[1:4])

#k-means함수구동
data_kmeans<-kmeans(train.data[1:4], centers=3, iter.max=100000)

#명목화와 결과보기
#amis$warning<-as.factor(data_kmeans$warning)
print(table(motor$strata))

#그래프그리기
a<-qplot(accel,times,colour=strata,data=motor)
print(a)