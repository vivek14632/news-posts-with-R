
install.packages('Rfacebook',dependencies = T)
library('Rfacebook')
#create a favebook app and add http://localhost:1410/ to your app
fb_oauth <- fbOAuth(app_id="***",
                    app_secret="*****")

fb_page <- getPage(page="cnn", token=fb_oauth,n=4000,feed = T,reactions = T)
save.image(file="cnn.RData")



