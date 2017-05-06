source('../DataCollection/checkFileInDirectory.R')

# Function : checkFile<-function(mdirectory)

if(checkFile('cnbc2017-03-31.RData')==TRUE)
{
	print ('PASS')
} else
{
	print('FAIL')	
}

