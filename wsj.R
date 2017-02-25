<<<<<<< HEAD
library('Rfacebook')
load('/home/cis1024/facebook/m_facebook.RData')
fb_page <- getPage(page="wsj", token=fb_oauth,n=4000,feed = T,reactions = T)
filename <- "wsj"
filename <- paste(filename,Sys.Date(),sep='')
filename <- paste(filename,'.RData',sep='')
=======
install.packages('Rfacebook',dependencies = T)
library('Rfacebook')
#create a favebook app and add http://localhost:1410/ to your app
fb_oauth <- fbOAuth(app_id="***",
                    app_secret="*****")

fb_page <- getPage(page="wsj", token=fb_oauth,n=4000,feed = T,reactions = T)
filename <- "wsj"
filename <- paste(filename,Sys.Date())
filename <- paste(filename,'.RData')

>>>>>>> origin/master
save.image(file=filename)
