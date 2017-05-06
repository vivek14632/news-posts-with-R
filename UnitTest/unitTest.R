source('../DataCollection/checkFileInDirectory.R')

# Function : checkFile<-function(mdirectory)
mTest<-function(mfun,expectedValue ,...)
{
	if(toString(mfun(...))==expectedValue)
	{
		print('PASS')
	}else{
		print('FAIL')

	}	

}

# To use the mTest function
# argument 1: name of function to test
# argument 2: expected value
# argument 3,4, .., n: arguments to the function to be tested

mTest(checkFile,'TRUE','cnbc2017-03-31.RData')
mTest(checkFile,'FALSE','xxx2017-03-31.RData')

