library(ggplot2)

set.seed(56342) #중심위치설정을 위한 난수생성

#학습데이터와 실험데이터 분리
idx<-sample(1:2, nrow(mtcars), replace=T, prob=c(0.6, 0.4))
train<-mtcars[idx==1,]
test<-mtcars[idx==2,]

#학습데이터 표준화
#mtcars$am<-as.numeric(mtcars$am)
#mtcars$vs<-as.numeric(mtcars$vs)
train.data<-scale(train[1:11])

#k-means함수구동
data_kmeans<-kmeans(train.data[1:11], centers=3, iter.max=100000)

#명목화와 결과보기
#train$am<-as.factor(data_kmeans$am)
print(table(train$am))

#그래프그리기
a<-qplot(gear,mpg,colour=am,data=mtcars)
print(a)