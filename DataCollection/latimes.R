source('dataLocation.R')
library('Rfacebook')
load('/home/cis1024/facebook/m_facebook.RData')
fb_page <- getPage(page="latimes", token=fb_oauth,n=100,feed = T,reactions = T)
#filename <- "/home/bhargav/datacollection/news-posts-with-R/data/latimes"
filename <- paste(dataDir,'latimes',sep='')
filename <- paste(filename,Sys.Date(),sep='')
filename <- paste(filename,'.RData',sep='')
save.image(file=filename)
