#this code is to get data from URL

# install selenium
# pip install selenium

# download geko driver for windows or linux and put in your path

import sys
import urllib
from random import randint
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary

# the following code was used before, but not not rquired, but, still we should keep it
#binary = FirefoxBinary('C:\Program Files (x86)\Mozilla Firefox\firefox.exe')

#open the CSV with the CNN urls
fp=open('urls.csv')

# lets read all URLs from file and also skip the header [0]
urls=fp.readlines()[1:]

#close the file
fp.close()

#The following line is commented because of this exception: selenium.common.exceptions.WebDriverException: Message: Unable to find a matching set of capabilities
#driver = webdriver.Firefox(firefox_binary=binary)

driver = webdriver.Firefox()

#iterate for all URLs
for mline in urls:
	
	#remove the new line character from the line
	mline=mline.split()
	
	#split the columns since it is a CSV
	mline=mline[0].split(',')
	
	#remove the quites from the URLs
	mline[0]=mline[0].replace('"', '')
	
	#fetch the URLs
	driver.get(mline[0])
	
	#get the content
	content=driver.find_elements_by_xpath("//div[@class='zn-body__paragraph']")
	
	#write content to file
	fp=open(mline[1]+'.txt','w')
	for i in content:
		fp.write(i.text)
	fp.close()
	
	#sleep for one minute
	time.sleep(60)
	



