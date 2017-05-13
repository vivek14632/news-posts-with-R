library('dplyr')

#if you do not have the above package then install it

#create a dataframe
text_df<-data_frame(line=1:100, text=fb_page$message)


library('tidytext')

#if you do not have tha above package then install it
#install.packages('tidytext')

text_df1<-unnest_tokens(text_df,word, text)
