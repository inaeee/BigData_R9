library(ggplot2)


set.seed(56342) #중심위치설정을 위한 난수생성

#학습데이터와 실험데이터 분리
idx<-sample(1:2, nrow(cps1), replace=T, prob=c(0.6, 0.4))
train<-cps1[idx==1,]
test<-cps1[idx==2,]

#학습데이터 표준화
cps1$age<-as.numeric(cps1$age)
cps1$educ<-as.numeric(cps1$educ)
cps1$hisp<-as.numeric(cps1$hisp)
train.data<-scale(train[1:4])

#k-means함수구동
data_kmeans<-kmeans(train.data[1:4], centers=3, iter.max=100000)

#명목화와 결과보기
print(table(cps1$hisp))

#그래프그리기
a<-qplot(age,educ,colour=hisp,data=cps1)
print(a)