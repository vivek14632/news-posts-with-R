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


content=driver.find_elements_by_xpath("//div[@class='zn-body__paragraph']")

for i in content:
	i.text


