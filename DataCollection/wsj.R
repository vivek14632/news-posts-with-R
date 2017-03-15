source('./dataLocation.R')
filename <- paste(dataDir,'wsj',sep='')

library('Rfacebook')
load('/home/cis1024/facebook/m_facebook1.RData')
fb_page <- getPage(page="wsj", token=fb_oauth,n=100,feed = T,reactions = T)
#filename <- "/home/bhargav/datacollection/news-posts-with-R/data/wsj"
filename <- paste(filename,Sys.Date(),sep='')
filename <- paste(filename,'.RData',sep='')
save.image(file=filename)
