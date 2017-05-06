source('./dataLocation.R')
library('Rfacebook')


#getCommentReplies(comment_id=post$comments$id[1], token=fb_oauth)
#auth <- data.frame('/home/cis1024/facebook/m_facebook.RData','/home/bhargav/appid.RData','/home/cis1024/facebook/m_facebook2.RData','/home/cis1024/facebook/m_facebook1.RData',stringsAsFactors=FALSE)
#file_names=as.list(dir('/home/bhargav/facebook/rdata'))

#read tokens file
tokensFile<-read.csv('/home/cis1024/projects/socialMediaProject/fbTokens.txt',header=T)
auth=tokensFile$tokens


#file_names=list.files(path = "/home/bhargav/facebook/rdata", full.names = TRUE, recursive = TRUE)
#auth=file_names
#auth <-lapply(file_names,load,.GlobalEnv)
newsagency<-read.csv(file="https://raw.githubusercontent.com/bmthanki/news-posts-with-R/master/DataCollection/newsHandle.csv", sep=",",header = TRUE)
for(val in 1:nrow(newsagency)){
  fb_oauth=auth[(val%%3)+1]
  #load(auth[(val%%4)+1])
  #print(load(auth[(val%%4)+1]))
	print(fb_oauth)
  fb_page <- getPage(page=newsagency$Handler[val], token=toString(fb_oauth),n=100,feed = T,reactions = T)
  posts=list()
  replies=list()
  count1=1
  browser()
  for(value in 1:length(fb_page$id))
  {
    print(fb_page$id[value])
    #browser()
    posts[[value]] <- getPost(fb_page$id[value], toString(fb_oauth), comments = TRUE, likes = TRUE,
                       n.likes = fb_page$likes_count[value], n.comments = fb_page$comments_count[value])
    for(i in 1:length(posts))
    {
      temp=rep(0,nrow(posts[[i]]$comments))
      posts[[i]]$comments=cbind(posts[[i]]$comments,reply=temp)
      if(posts[[i]]$post$comments_count>0)
      {
        print(posts[[i]]$post$comments_count)
      for(j in 1:length(posts[[i]]$post$comments_count))
      {
          if(!is.na(posts[[i]]$comments$id[j]))
          {
            tryCatch({
              replies[[count1]]=getCommentReplies(posts[[i]]$comments$id[j], token=toString(fb_oauth))
            posts[[i]]$comments$reply[j]=count1
            }, warning=function(w){
              #print(war)
            },error = function(e) {
              #print(err)
            }, finally = {
              #print()
            })
          }
        count1=count1+1
        
      }
      }
      
    }
    
  }
  
  filename <- paste(dataDir,newsagency$Handler[val],sep='')
  filename <- paste(filename,Sys.Date(),sep='')
  filename <- paste(filename,'.RData',sep='')
  save.image(file=filename)
}
