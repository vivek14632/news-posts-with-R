# This function is used to check
# whether the news aganecy we are
# crawlig have been previously completed
# or not

checkFile<-function(mdirectory)
{
	mfiles=list.files('/home/cis1024/socialNetworkData')
	if(any(mfiles=='usatoday2017-05-06.RData'))
	{
		return (TRUE)
	}
	else
	{

		return (FALSE)
	}

} 


