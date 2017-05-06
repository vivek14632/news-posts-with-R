# This function is used to check
# whether the news aganecy we are
# crawlig have been previously completed
# or not

checkFile<-function(newsData)
{
	mfiles=list.files('/home/cis1024/socialNetworkData')
	if(any(mfiles==newsData))
	{
		return (TRUE)
	}else{

		return (FALSE)
	}

} 


