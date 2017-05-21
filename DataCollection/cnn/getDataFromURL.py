#this code is to get data from URL

# install selenium
# pip install selenium

# download geko driver for windows or linux and put in your path
from random import *
import sys
import urllib
from random import randint
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary
binary = FirefoxBinary('C:\Program Files (x86)\Mozilla Firefox\firefox.exe')
fp=open('urls.csv')
urls=fp.readlines()[1:]
fp.close()

#The following line is commented because of this exception: selenium.common.exceptions.WebDriverException: Message: Unable to find a matching set of capabilities
#driver = webdriver.Firefox(firefox_binary=binary)

driver = webdriver.Firefox()


for mline in urls:
	try:
		mline=mline.split()
		mline=mline[0].split(',')
		mline[0]=mline[0].replace('"', '')
		driver.get(mline[0])
		content=driver.find_elements_by_xpath("//div[@class='zn-body__paragraph']")
		fp=open(mline[1]+'.txt','w')
		for i in content:
			fp.write(i.text)
		fp.close()
		time.sleep(random()*20)
	except:
		pass
	



