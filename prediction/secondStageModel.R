startTime=Sys.time()

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
test=dataForAnalysis[(trainingSampleSize+1):nrow(dataForAnalysis),]
#like
trainingLike=dataForAnalysisLike[1:trainingSampleSize,]
testLike=dataForAnalysisLike[(trainingSampleSize+1):nrow(dataForAnalysisLike),]
#type
trainingType=dataForAnalysisType[1:trainingSampleSize,]
testType=dataForAnalysisType[(trainingSampleSize+1):nrow(dataForAnalysisType),]
#both
trainingBoth=dataForAnalysisBoth[1:trainingSampleSize,]
testBoth=dataForAnalysisBoth[(trainingSampleSize+1):nrow(dataForAnalysisBoth),]

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




