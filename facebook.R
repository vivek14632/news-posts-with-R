
install.packages('Rfacebook',dependencies = T)
library('Rfacebook')
#create a favebook app and add http://localhost:1410/ to your app
fb_oauth <- fbOAuth(app_id="***",
                    app_secret="*****")

fb_page <- getPage(page="cnn", token=fb_oauth,n=4000,feed = T,reactions = T)
save.image(file="cnn.RData")

#create corpus
corpus1=vector()
for( i in 1:length(fb_page$message))
{
  #browser()
  msg1=fb_page$message[i]
  msg1=gsub("[.]","",msg1)
  msg1=gsub("[,]","",msg1)
  msg1=gsub("[\n]","",msg1)
  
  msg1=strsplit(msg1," ")
  corpus1=c(corpus1,unique(msg1[[1]]))
}

