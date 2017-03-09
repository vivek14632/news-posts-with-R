source('dataLocation.R')
library('Rfacebook')
load('/home/bhargav/appid.RData')
fb_page <- getPage(page="FoxNews", token=fb_oauth,n=100,feed = T,reactions = T)
#filename <- "/home/bhargav/datacollection/news-posts-with-R/data/FoxNews"
filename <- paste(dataDir,'FoxNews',sep='')
filename <- paste(filename,Sys.Date(),sep='')
filename <- paste(filename,'.RData',sep='')
save.image(file=filename)


