startTime=Sys.time()

#get names of all cnbc files
cnbcFiles=list.files('/home/cis1024/socialNetworkData',pattern='cnbc*',full.names=T)
load(cnbcFiles[1])
totalData=fb_page
for (i in 2:length(cnbcFiles))
{
	#browser()
	load(cnbcFiles[i])
	totalData<-rbind(totalData,fb_page)
}



library('dplyr')

#if you do not have the above package then install it

#create a dataframe
text_df<-data_frame(line=1:nrow(totalData), text=totalData$message)


library('tidytext')

#if you do not have tha above package then install it
#install.packages('tidytext')

text_df1<-unnest_tokens(text_df,word, text)

#remove stop words
data(stop_words)
text_df2 <- anti_join(text_df1,stop_words)

#get the unique words, it represents the corpus
uniqueWords=unique(text_df2$word)

#remove all na from the unique words
uniqueWords=uniqueWords[!is.na(uniqueWords)]

#length of vector
lengthOfUniqueWords=length(uniqueWords)

#number of posts under analysis, we can change this value to include more posts
numberOfPosts=nrow(totalData)

# total number of elements in document matrix
dimDocumentMatrix= numberOfPosts*lengthOfUniqueWords

#create the document-term matrix
documentTermMatrix=data.frame(matrix(rep(0,dimDocumentMatrix), nrow=numberOfPosts))

#browser()

names(documentTermMatrix)<-uniqueWords

for ( i in 1:lengthOfUniqueWords)
  {
    for(j in 1:nrow(documentTermMatrix))
        {
          for (k in 1:nrow(text_df2))
               {
                  #the print is for debuggging puspose only
                  print(paste(i,j,k))

		# check there are null values
		if(any(is.na(text_df2[k,])))
		{
			print('null value')
			next
		}
            
                  if((text_df2$line[k] == j) && (text_df2$word[k]==uniqueWords[i]))
                    {
                      documentTermMatrix[j,i]=1  
                    }
                 
               }
            
          
        }
  
  
  }

endTime=Sys.time()
print(endTime-startTime)

save.image(file='tidy.RData')
