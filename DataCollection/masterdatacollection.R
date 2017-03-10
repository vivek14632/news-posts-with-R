source('./dataLocation.R')
library('Rfacebook')



auth <- data.frame('/home/cis1024/facebook/m_facebook.RData','/home/bhargav/appid.RData','/home/cis1024/facebook/m_facebook2.RData','/home/cis1024/facebook/m_facebook1.RData',stringsAsFactors=FALSE)
newsagency<-data.frame('cnbc','forbes','nytimes','usatoday','washingtonpost','FoxNews','bbcnews',stringsAsFactors=FALSE)
for(val in 1:length(newsagency)){
  auth[(val%%4)+1]
  load(auth[(val%%4)+1])
  fb_page <- getPage(page=newsagency[val], token=fb_oauth,n=100,feed = T,reactions = T)
  filename <- paste(dataDir,newsagency[val],sep='')
  filename <- paste(filename,Sys.Date(),sep='')
  filename <- paste(filename,'.RData',sep='')
  save.image(file=filename)
}
