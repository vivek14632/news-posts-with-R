source('/home/cis1024/projects/socialMediaProject/news-posts-with-R/DataCollection/dataLocation.R')
source('/home/cis1024/projects/socialMediaProject/news-posts-with-R/DataCollection/checkFileInDirectory.R')
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
	tryCatch({
	filename <- paste(dataDir,newsagency$Handler[val],sep='')
	filename <- paste(filename,Sys.Date(),sep='')
	filename <- paste(filename,'.RData',sep='')
	if(checkFile(filename))
	{
		next
	}
  	fb_oauth=auth[(val%%3)+1]
	print(fb_oauth)
  	fb_page <- getPage(page=newsagency$Handler[val], token=toString(fb_oauth),n=100,feed = T,reactions = T)
  	posts=list()
  	replies=list()
  	count1=1
  	#browser()

	print(paste('Number of posts fetched=',length(fb_page$id)))

	if(length(fb_page$id)<1)
	{
		#there are no posts so we will stop here
		next
	}
  	for(value in 1:length(fb_page$id))
  	{
    		print(paste('Fetching data for post number =',fb_page$id[value]))
    		#browser()
		tryCatch({
    			posts[[value]] <- getPost(fb_page$id[value], toString(fb_oauth), comments = TRUE, likes = TRUE,
                       n.likes = fb_page$likes_count[value], n.comments = fb_page$comments_count[value])
		},warning=function(w){
			print(w)
		},error=function(e){
			print(e)
		},finally={
			next
		})
	}
    
	#browser()
	for(i in 1:length(posts))
    	{
		#create a temp vector to hold comments
		#for a post
		#browser()
      		#temp=rep(0,nrow(posts[[i]]$comments))
      		#posts[[i]]$comments=cbind(posts[[i]]$comments,reply=temp)
      		tryCatch({
		if(posts[[i]]$post$comments_count>0)
      		{
			temp=rep(0,nrow(posts[[i]]$comments))
                	posts[[i]]$comments=cbind(posts[[i]]$comments,reply=temp)

        		print(paste('comment count=',posts[[i]]$post$comments_count))
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
		},warning=function(w){
			print(w)
		},error=function(e){
			print(e)
		},finally={
		})
      
    	}
    
save.image(file=filename)
 },warning=function(w){
                        print(w)
                },error=function(e){
                        print(e)
                },finally={
                        next
                })



}
  
  #filename <- paste(dataDir,newsagency$Handler[val],sep='')
  #filename <- paste(filename,Sys.Date(),sep='')
  #filename <- paste(filename,'.RData',sep='')
	#save.image(file=filename)

