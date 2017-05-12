# This function converts a post or string to set of words and  return 

convertPostToWords<-function(post)
{
	browser()
	delimiters<-c("\\.",",",":",";")
	#TODO

	for (i in (1:length(delimiters)))
	{

		post=gsub(delimiters[i]," ",post)
		
	}
	#dummy result vector
	post=strsplit(post," ")
	return (post[[1]])
}


#Unit test code
#fbpost="hello,how,are you"
#print(convertPostToWords(fbpost))
