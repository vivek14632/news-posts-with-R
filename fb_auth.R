library('Rfacebook')
#create a favebook app and add http://localhost:1410/ to your app
fb_oauth <- fbOAuth(app_id="1767997493519041",
                    app_secret="f6471e289908ac05abe1c20275eac3d2")
filename <- "m_facebook.RData"
save.image(file=filename)
getwd()
