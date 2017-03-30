source('./dataLocation.R')
library('Rfacebook')



#auth <- data.frame('/home/cis1024/facebook/m_facebook.RData','/home/bhargav/appid.RData','/home/cis1024/facebook/m_facebook2.RData','/home/cis1024/facebook/m_facebook1.RData',stringsAsFactors=FALSE)
#file_names=as.list(dir('/home/bhargav/facebook/rdata'))
file_names=list.dirs(path = "/home/bhargav/facebook/rdata", full.names = TRUE, recursive = TRUE)
auth=file_names
#auth <-lapply(file_names,load,.GlobalEnv)
newsagency<-read.csv(file="https://github.com/bmthanki/news-posts-with-R/blob/master/DataCollection/newsHandle.csv", sep=",",header = TRUE)
for(val in 1:nrow(newsagency)){
  auth[(val%%4)+1]
  load(auth[(val%%4)+1])
  fb_page <- getPage(page=newsagency$Handler[val], token=fb_oauth,n=100,feed = T,reactions = T)
  posts=list()
  for(value in 1:length(fb_page$id))
  {
    posts[[value]] <- getPost(fb_page$id[value], fb_oauth, comments = TRUE, likes = TRUE,
                       n.likes = fb_page$likes_count[value], n.comments = fb_page$comments_count[value])
  }
  
  filename <- paste(dataDir,newsagency[val],sep='')
  filename <- paste(filename,Sys.Date(),sep='')
  filename <- paste(filename,'.RData',sep='')
  save.image(file=filename)
}
