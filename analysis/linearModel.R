cnbc_data=as.data.frame(cbind(likes=as.numeric(fb_page$likes_count),
                              message=fb_page$message,
                              create_time=fb_page$created_time,
                              today='2017-02-28',
                              type=as.factor(fb_page$type),
                              link=as.factor(fb_page$link),
                              comments=as.numeric(fb_page$comments_count),
                              shares=as.numeric(fb_page$shares_count),
                              love=as.numeric(fb_page$love_count),
                              haha=as.numeric(fb_page$haha_count),
                              wow=as.numeric(fb_page$wow_count),
                              sad=as.numeric(fb_page$sad_count),
                              angry=as.numeric(fb_page$angry_count)
))

cnbc_data$shares <- as.numeric(cnbc_data$shares)
cnbc_data$love <- as.numeric(cnbc_data$love)
cnbc_data$haha <- as.numeric(cnbc_data$haha)
cnbc_data$wow <- as.numeric(cnbc_data$wow)
cnbc_data$sad <- as.numeric(cnbc_data$sad)
cnbc_data$angry <- as.numeric(cnbc_data$angry)
cnbc_data$likes <- as.numeric(cnbc_data$likes)
cnbc_data$comments <- as.numeric(cnbc_data$comments)


cnbc_data$create_time <- strptime(cnbc_data$create_time,format = "%Y-%m-%d")
cnbc_data$today <- strptime(cnbc_data$today,format = "%Y-%m-%d")
cnbc_data$duration_in_days <- difftime(cnbc_data$today,cnbc_data$create_time,units = "days")


model1 = lm(shares~ love +haha + wow + sad + angry+comments+likes+
            duration_in_days,data = cnbc_data)
summary(model1)

opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(model1, las = 1)
par(opar)

model2=rlm(shares~ love +haha + wow + sad + angry+comments+likes,data = cnbc_data)
summary(model2)
opar <- par(mfrow = c(2,2), oma = c(0, 0, 1.1, 0))
plot(model2, las = 1)
par(opar)