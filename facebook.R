

fb_page <- getPage(page="cnn", token=fb_oauth,n=4000,feed = T,reactions = T)
save.image(file="cnn.RData")

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


