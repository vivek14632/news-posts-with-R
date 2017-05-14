load('/home/cis1024/socialNetworkData/cnbc2017-05-10.RData')

library('dplyr')

#if you do not have the above package then install it

#create a dataframe
text_df<-data_frame(line=1:100, text=fb_page$message)


library('tidytext')

#if you do not have tha above package then install it
#install.packages('tidytext')

text_df1<-unnest_tokens(text_df,word, text)

#remove stop words
data(stop_words)
text_df2 <- anti_join(text_df1,stop_words)

wordsu=unique(text_df2)
dim=length(unique(text_df2))
DIM=dim*100
docMat=matrix(rep(0,DIM),nrow=100)
for ( i in 1:nrow(text_df2))
  {
  
  
  
  }

