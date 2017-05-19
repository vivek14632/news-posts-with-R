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
binary = FirefoxBinary('C:\Program Files (x86)\Mozilla Firefox\firefox.exe')
fp=open('cnn.csv')
urls=fp.readlines()
fp.close()

for mline in urls:
	mline=mline.split()
	driver.get(mlinep[0])
	content=driver.find_elements_by_xpath("//div[@class='zn-body__paragraph']")
	fp=open(mline[1]+'.txt','w')
	for i in content:
		fp.write(i.text)
	fp.close()
	



