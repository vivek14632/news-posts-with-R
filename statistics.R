#Linear Model
summary(lm(fb_page$shares_count~
             fb_page$likes_count+
            fb_page$comments_count
            ))

 
analysis=as.data.frame(cbind(likes=fb_page$likes_count,
                             message=fb_page$message,
                             create_time=fb_page$created_time,
                             today='2017-02-01',
                             type=fb_page$type,
                             link=fb_page$link,
                             comments=fb_page$comments_count,
                             shares=fb_page$shares_count,
                             love=fb_page$love_count,
                             haha=fb_page$haha_count,
                             wow=fb_page$wow_count,
                             sad=fb_page$sad_count,
                             angry=fb_page$angry_count
                                                 ))
