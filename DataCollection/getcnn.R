source('./dataLocation.R')
source('./checkFileInDirectory.R')
library('Rfacebook')


#getCommentReplies(comment_id=post$comments$id[1], token=fb_oauth)
#auth <- data.frame('/home/cis1024/facebook/m_facebook.RData','/home/bhargav/appid.RData','/home/cis1024/facebook/m_facebook2.RData','/home/cis1024/facebook/m_facebook1.RData',stringsAsFactors=FALSE)
#file_names=as.list(dir('/home/bhargav/facebook/rdata'))

#read tokens file
tokensFile<-read.csv('/home/cis1024/projects/socialMediaProject/fbTokens.txt',header=T)
auth=tokensFile$tokens
fb_page <- getPage(page='cnn', token=toString(auth[1]),n=4000,feed = T,reactions = T)
save.image(file='cnn.RData')
