library(ggplot2)


set.seed(56342) #중심위치설정을 위한 난수생성

#학습데이터와 실험데이터 분리
idx<-sample(1:2, nrow(Highway1), replace=T, prob=c(0.6, 0.4))
train<-Highway1[idx==1,]
test<-Highway1[idx==2,]

#학습데이터 표준화
Highway1$itg<-as.numeric(Highway1$itg)
Highway1$len<-as.numeric(Highway1$len)
Highway1$rate<-as.numeric(Highway1$rate)
train.data<-scale(train[1:4])

#k-means함수구동
data_kmeans<-kmeans(train.data[1:4], centers=3, iter.max=100000)

#명목화와 결과보기
print(table(Highway1$rate))

#그래프그리기
a<-qplot(itg,len,colour=rate,data=Highway1)
print(a)