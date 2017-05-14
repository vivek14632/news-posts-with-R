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

#get the unique words, it represents the corpus
uniqueWords=unique(text_df2$word)

#length of vector
lengthOfUniqueWords=length(uniqueWords)

#number of posts under analysis, we can change this value to include more posts
numberOfPosts=100

# total number of elements in document matrix
dimDocumentMatrix= numberOfPosts*lengthOfUniqueWords

#create the document-term matrix
documentTermMatrix=data.frame(matrix(rep(0,dimDocumentMatrix), nrow=numberOfPosts))


names(documentTermMatrix)<-uniqueWords

for ( i in 1:lengthOfUniqueWords)
  {
    for(j in 1:nrow(documentTermMatrix))
        {
          for (k in 1:nrow(text_df2))
               {
                  if(text_df2$line == j && text_df2$word==uniqueWords[i])
                    {
                      documentTermMatrix[j,i]=1  
                    }
                 
               }
            
          
        }
  
  
  }
save.image(file='tidy.RData')
