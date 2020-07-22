library(rpart)
library(ggplot2)
library(caret)
idx<-sample(1:2, nrow(mtcars), replace=T, prob=c(0.7,0.3))
#print(idx)

mtcars$am<-as.factor(mtcars$am)
tree_model<-rpart(am ~ ., data=mtcars)
#print(tree_model)
#printcp(tree_model)
#plotcp(tree_model)

ptree<-prune(tree_model, cp=0.2)
plot(ptree)
text(ptree)


predtree<-predict(ptree,mtcars,type="class")
print(confusionMatrix(predtree, mtcars$am))