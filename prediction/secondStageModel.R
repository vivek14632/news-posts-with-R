startTime=Sys.time()
library(lars)
library(glmnet)
#get names of all cnbc files
if(as.character(Sys.info()['user'])=='vivek4'){
  cnbcFiles=list.files('/work/v/vivek4/socialNetworkData/',pattern='cnbc*',full.names=T)
}else{
  cnbcFiles=list.files('/home/cis1024/socialNetworkData',full.names=T)
}
cnbcFiles=list.files('/home/cis1024/socialNetworkData',full.names=T)
print(paste('number of RData files=',length(cnbcFiles)))


for (i in 2:length(cnbcFiles))
{
  #browser()
  load(cnbcFiles[i])
  totalData<-rbind(totalData,fb_page)
}

totalData<-fb_page

requiredVariables<-c("haha_count", "wow_count", "sad_count","angry_count", "love_count","shares_count")

requiredVariablesPlusLike<-c("haha_count","likes_count", "wow_count", "sad_count","angry_count", "love_count","shares_count")

requiredVariablesPlusType<-c("haha_count","type", "wow_count", "sad_count","angry_count", "love_count","shares_count")

requiredVariablesPlusBoth<-c("haha_count","type","likes_count", "wow_count", "sad_count","angry_count", "love_count","shares_count")

requiredVariablesAll<-c("haha_count", "wow_count", "sad_count","angry_count", "love_count","shares_count","likes_count", "wow_count","comments_count")

dataForAnalysis <- totalData[requiredVariables]

dataForAnalysisLike <- totalData[requiredVariablesPlusLike]

dataForAnalysisType <- totalData[requiredVariablesPlusType]

dataForAnalysisBoth <- totalData[requiredVariablesPlusBoth]

dataForAnalysisType$type<-as.factor(dataForAnalysisType$type)
dataForAnalysisBoth$type<-as.factor(dataForAnalysisBoth$type)
dataForAnalysis<-na.omit(dataForAnalysis)
dataForAnalysisLike<-na.omit(dataForAnalysisLike)
dataForAnalysisType<-na.omit(dataForAnalysisType)
dataForAnalysisBoth<-na.omit(dataForAnalysisBoth)
#write.csv(dataForAnalysis,file="secondStageData.csv",row.names=F)


testSampleSize=floor(.2*nrow(dataForAnalysis))
trainingSampleSize=nrow(dataForAnalysis)-testSampleSize
#normal
training=dataForAnalysis[1:trainingSampleSize,]
xTrain <- as.matrix(dataForAnalysis[,1:5])
yTrain <- as.matrix(dataForAnalysis[,6])
test=dataForAnalysis[(trainingSampleSize+1):nrow(dataForAnalysis),]
xTest <- as.matrix(test[,1:5])
yTest <- as.matrix(test[,6])
#like
trainingLike=dataForAnalysisLike[1:trainingSampleSize,]
xLikeTrain <- as.matrix(trainingLike[,1:6])
yLikeTrain <- as.matrix(trainingLike[,7])
testLike=dataForAnalysisLike[(trainingSampleSize+1):nrow(dataForAnalysisLike),]
xLikeTest <- as.matrix(testLike[,1:6])
yLikeTest <- as.matrix(testLike[,7])
#type
trainingType=dataForAnalysisType[1:trainingSampleSize,]
xTypeTrain <- as.matrix(trainingType[,1:6])
yTypeTrain <- as.matrix(trainingType[,7])
testType=dataForAnalysisType[(trainingSampleSize+1):nrow(dataForAnalysisType),]
xTypeTest <- as.matrix(testType[,1:6])
yTypeTest <- as.matrix(testType[,7])
#both
trainingBoth=dataForAnalysisBoth[1:trainingSampleSize,]
xBothTrain <- as.matrix(trainingBoth[,1:7])
yBothTrain <- as.matrix(trainingBoth[,8])
testBoth=dataForAnalysisBoth[(trainingSampleSize+1):nrow(dataForAnalysisBoth),]
xBothTest <- as.matrix(testBoth[,1:7])
yBothTest <- as.matrix(testBoth[,8])

rmse<-function(x,y)
{
  sqrt(sum((abs(x-y))^2)/length(y))
}
mape<-function(x,y)
{
  (sum(abs(y-x)/(y+1))/length(y))
}

lm_model<-lm(shares_count~.,data=training)
predictedValues=predict(lm_model,test)

print(paste('Linear model rmse=',rmse(as.numeric(predictedValues),test$shares_count)))

print(paste('Linear model mape=',mape(as.numeric(predictedValues),test$shares_count)))


#like
lm_model_like<-lm(shares_count~.,data=trainingLike)
predictedValues=predict(lm_model_like,testLike)

print(paste('Linear model rmse=',rmse(as.numeric(predictedValues),testLike$shares_count)))

print(paste('Linear model mape=',mape(as.numeric(predictedValues),testLike$shares_count)))
#type
lm_model_type<-lm(shares_count~.,data=trainingType)
predictedValues=predict(lm_model_type,testType)

print(paste('Linear model rmse=',rmse(as.numeric(predictedValues),testType$shares_count)))

print(paste('Linear model mape=',mape(as.numeric(predictedValues),testType$shares_count)))

#both
lm_model<-lm(shares_count~.,data=trainingBoth)
predictedValues=predict(lm_model,testBoth)

print(paste('Linear model rmse=',rmse(as.numeric(predictedValues),testBoth$shares_count)))

print(paste('Linear model mape=',mape(as.numeric(predictedValues),testBoth$shares_count)))


library('e1071')

svm_model<-svm(shares_count~.,data=training)

predictedValues=predict(svm_model,test)


print(paste('SVM model rmse=',rmse(as.numeric(predictedValues),test$shares_count)))
print(paste('SVM model mape=',mape(as.numeric(predictedValues),test$shares_count)))

#like
svm_model_like<-svm(shares_count~.,data=trainingLike)

predictedValues=predict(svm_model_like,testLike)


print(paste('SVM model rmse=',rmse(as.numeric(predictedValues),testLike$shares_count)))
print(paste('SVM model mape=',mape(as.numeric(predictedValues),testLike$shares_count)))

#type
svm_model_type<-svm(shares_count~.,data=trainingType)

predictedValues=predict(svm_model_type,testType)


print(paste('SVM model rmse=',rmse(as.numeric(predictedValues),testType$shares_count)))
print(paste('SVM model mape=',mape(as.numeric(predictedValues),testType$shares_count)))

#both
svm_model_both<-svm(shares_count~.,data=trainingBoth)

predictedValues=predict(svm_model_both,testBoth)


print(paste('SVM model rmse=',rmse(as.numeric(predictedValues),testBoth$shares_count)))
print(paste('SVM model mape=',mape(as.numeric(predictedValues),testBoth$shares_count)))

#ridge

fit <- glmnet(xTrain, yTrain, family="gaussian", alpha=0, lambda=0.001)

# make predictions
predictions <- predict(fit, xTest, type="link")

print(paste('Ridge model rmse=',rmse(as.numeric(predictions),yTest)))
print(paste('Ridge model mape=',mape(as.numeric(predictions),yTest)))

#like

fit <- glmnet(xLikeTrain, yLikeTrain, family="gaussian", alpha=0, lambda=0.001)

# make predictions
predictions <- predict(fit, xLikeTest, type="link")

print(paste('Ridge model rmse=',rmse(as.numeric(predictions),yLikeTest)))
print(paste('Ridge model mape=',mape(as.numeric(predictions),yLikeTest)))

#type

fit <- glmnet(xTypeTrain, yTypeTrain, family="gaussian", alpha=0, lambda=0.001)

# make predictions
predictions <- predict(fit, xTypeTest, type="link")

print(paste('Ridge model rmse=',rmse(as.numeric(predictions),yTypeTest)))
print(paste('Ridge model mape=',mape(as.numeric(predictions),yTypeTest)))

#both

fit <- glmnet(xBothTrain, yBothTrain, family="gaussian", alpha=0, lambda=0.001)

# make predictions
predictions <- predict(fit, xBothTest, type="link")

print(paste('Ridge model rmse=',rmse(as.numeric(predictions),yBothTest)))
print(paste('Ridge model mape=',mape(as.numeric(predictions),yBothTest)))

