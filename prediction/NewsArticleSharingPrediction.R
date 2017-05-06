load('/home/bhargav/datacollection/news-posts-with-R/data/bbcnews2017-03-01.RData')
#create corpus
all_posts=vector()
for( i in 1:length(fb_page$message))
{
  #browser()
  all_posts=c(all_posts,fb_page$message[i])
  
}
all_posts_unique=str_replace_all(all_posts_unique, "[^[:alnum:]]", " ")
ul <- unlist(strsplit(all_posts_unique, "\\s+|[[:punct:]]")) 
unique(ul)
ul=str_replace_all(ul,"[^[:graph:]]", " ") 
dataSetFinal <- iconv(ul, 'UTF-8', 'ASCII')
corpus = VCorpus(VectorSource(dataSetFinal))
tdm = as.matrix(TermDocumentMatrix(corpus, control = list(wordLengths = c(1, Inf))))


#Linear Model

#http://stats.idre.ucla.edu/r/dae/robust-regression/

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


