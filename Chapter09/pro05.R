library(rpart)
library(ggplot2)
library(caret)
library(DAAG)
idx<-sample(1:2, nrow(cps1), replace=T, prob=c(0.7,0.3))


cps1$hisp<-as.factor(cps1$hisp)
tree_model<-rpart(hisp ~ ., data=cps1)
#print(tree_model)
#printcp(tree_model)
#plotcp(tree_model)


ptree<-prune(tree_model, cp=0.01)
plot(ptree)
text(ptree)


predtree<-predict(ptree,cps1,type="class")
print(confusionMatrix(predtree, cps1$hisp))