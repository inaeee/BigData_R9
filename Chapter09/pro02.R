library(rpart)
library(ggplot2)
library(caret)
library(boot)
idx<-sample(1:2, nrow(amis), replace=T, prob=c(0.7,0.3))


amis$warning<-as.factor(amis$warning)
tree_model<-rpart(warning ~ ., data=amis)
#print(tree_model)
#printcp(tree_model)
#plotcp(tree_model)


ptree<-prune(tree_model, cp=0.2)
#plot(ptree)
#text(ptree)


predtree<-predict(ptree,amis,type="class")
print(confusionMatrix(predtree, amis$warning))