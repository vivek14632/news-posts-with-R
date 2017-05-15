startTime=Sys.time()

#get names of all cnbc files
if(as.character(Sys.info()['user'])=='vivek4'){
        cnbcFiles=list.files('/work/v/vivek4/socialNetworkData/',pattern='cnbc*',full.names=T)
}else{
        cnbcFiles=list.files('/home/cis1024/socialNetworkData',full.names=T)
}

print(paste('number of RData files=',length(cnbcFiles)))

load(cnbcFiles[1])
totalData=fb_page
for (i in 2:length(cnbcFiles))
{
        #browser()
        load(cnbcFiles[i])
        totalData<-rbind(totalData,fb_page)
}

requiredVariables<-c("haha_count", "wow_count", "sad_count","angry_count", "love_count","shares_count")

dataForAnalysis <- totalData[requiredVariables]

dataForAnalysis<-na.omit(dataForAnalysis)

write.csv(dataForAnalysis,file="secondStageData.csv",row.names=F)


testSampleSize=floor(.2*nrow(dataForAnalysis))
trainingSampleSize=nrow(dataForAnalysis)-testSampleSize

training=dataForAnalysis[1:trainingSampleSize,]
test=dataForAnalysis[(trainingSampleSize+1):nrow(dataForAnalysis),]

lm_model<-lm(shares_count~.,data=training)
predictedValues=predict(lm_model,test)

results<-data.frame(predictedValues,test$shares_count)
results=na.omit(results)


mape<-function(x,y)
{
  (sum(abs(x-y)/(x+1))/length(x))
}

print(paste('Linear model mape=',mape(results$predictedValues,results$test.shares_count)))

library('e1071')
svm_model<-svm(shares_count~.,data=training)

browser()
predictedValues=predict(svm_model,test)

results<-data.frame(predictedValues,test$shares_count)
results=na.omit(results)

print(paste('SVM model mape=',mape(results$predictedValues,results$test.shares_count)))




