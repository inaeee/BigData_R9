library(rpart)
library(ggplot2)
library(caret)
library(boot)
idx<-sample(1:2, nrow(motor), replace=T, prob=c(0.7,0.3))


motor$strata<-as.factor(motor$strata)
tree_model<-rpart(strata ~ ., data=motor)
#print(tree_model)
#printcp(tree_model)
#plotcp(tree_model)


ptree<-prune(tree_model, cp=0.2)
plot(ptree)
text(ptree)


predtree<-predict(ptree,motor,type="class")
print(confusionMatrix(predtree, motor$strata))