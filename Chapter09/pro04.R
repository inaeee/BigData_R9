library(rpart)
library(ggplot2)
library(caret)
library(carData)
idx<-sample(1:2, nrow(Highway1), replace=T, prob=c(0.7,0.3))


Highway1$rate<-as.factor(Highway1$rate)
tree_model<-rpart(rate ~ ., data=Highway1)
#print(tree_model)
#printcp(tree_model)
#plotcp(tree_model)


ptree<-prune(tree_model, cp=0.04)
#plot(ptree)
#text(ptree)


predtree<-predict(ptree,Highway1,type="class")
print(confusionMatrix(predtree, Highway1$rate))