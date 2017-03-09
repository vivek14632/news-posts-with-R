source('./dataLocation.R')
filename <- paste(dataDir,'washingtonpost',sep='')

library('Rfacebook')
load('/home/bhargav/appid.RData')
fb_page <- getPage(page="washingtonpost", token=fb_oauth,n=100,feed = T,reactions = T)
#filename <- "/home/bhargav/datacollection/news-posts-with-R/data/washingtonpost"
filename <- paste(filename,Sys.Date(),sep='')
filename <- paste(filename,'.RData',sep='')
save.image(file=filename)

