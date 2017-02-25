library('Rfacebook')
load('/home/cis1024/facebook/m_facebook.RData')
fb_page <- getPage(page="forbes", token=fb_oauth,n=4000,feed = T,reactions = T)
filename <- "forbes"
filename <- paste(filename,Sys.Date(),sep='')
filename <- paste(filename,'.RData',sep='')
save.image(file=filename)


