 load("cnn.RData")
 urls=data.frame(link=fb_page$link,value=1:(length(fb_page$link)))
 write.csv(urls,file = 'urls.csv')
