require(foreign)
require(MASS)

cnbc_data=as.data.frame(cbind(likes=fb_page$likes_count,
                             message=fb_page$message,
                             create_time=fb_page$created_time,
                             today='2017-02-01',
                             type=as.factor(fb_page$type),
                             link=as.factor(fb_page$link),
                             comments=fb_page$comments_count,
                             shares=fb_page$shares_count,
                             love=fb_page$love_count,
                             haha=fb_page$haha_count,
                             wow=fb_page$wow_count,
                             sad=fb_page$sad_count,
                             angry=fb_page$angry_count
))

cnbc_data$shares <- as.numeric(cnbc_data$shares)
cnbc_data$love <- as.numeric(cnbc_data$love)
cnbc_data$haha <- as.numeric(cnbc_data$haha)
cnbc_data$wow <- as.numeric(cnbc_data$wow)
cnbc_data$sad <- as.numeric(cnbc_data$sad)
cnbc_data$angry <- as.numeric(cnbc_data$angry)

model1 = lm(shares~ love +haha + wow + sad + angry+comments+likes,data = cnbc_data)
summary(model1)

model2=rlm(shares~ love +haha + wow + sad + angry+comments+likes,data = cnbc_data)
summary(model2)


