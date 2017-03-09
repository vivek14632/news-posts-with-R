source('dataLocation.R')
library('Rfacebook')
load('/home/cis1024/facebook/m_facebook1.RData')
fb_page <- getPage(page="cnbc", token=fb_oauth,n=100,feed = T,reactions = T)
#filename <- "/home/bhargav/datacollection/news-posts-with-R/data/cnbc"
filename <- paste(dataDir,'cnbc',sep='')
filename <- paste(filename,Sys.Date(),sep='')
filename <- paste(filename,'.RData',sep='')
save.image(file=filename)
