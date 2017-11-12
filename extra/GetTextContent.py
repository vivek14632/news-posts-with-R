from bs4 import BeautifulSoup
import pandas as pd
import os
import re

# store all HTML files in this location
path = '/home/nargis/Desktop/test1/'

# Need to check
# destPath =  '/home/nargis/Desktop/test1/newsDetails.csv'

# List all HTML files in that location
all_pages = os.listdir(path)

# Total number of HTML files in that location 
n = len(all_pages)

# Headline array
headline= [None] * n

# category array
categories = [None] * n

HTML text array
htmltext = [None] * n

# j is counter
j =0
for i in range(0,len(all_pages)):
	try:
		# read one HTML page
		fp=open(path+str(all_pages[i]))
		
		# read content of that HTML file
		html_doc=fp.read()
		
		# close the file header
		fp.close()
		
		# Parse the HTML
		soup = BeautifulSoup(html_doc, 'html.parser')
		
		# get the headline
		headline[i] = soup.find(itemprop="headline").getText()
		
		# get the category
		categories[i] =soup.find("div", { "class" : "headline-kicker" }).getText()
		
		# get the html text
		htmltext[i] =soup.find(id="main-content").getText()
		
		# print file number or number of files completed
		print(i)
	except:
		# increment the file no matter if it is processed or not
		j=j+1
		
		# print the page with error
		print('Error in page:'+ all_pages[i])
print(j)

# create a panda dataframe
df = pd.DataFrame({})

# remove the name extension
all_pages = [page.replace('.html', '') for page in all_pages]

# extract the relevant information
df['Id'] = all_pages 
df['htmltext'] = htmltext
df['headline'] = headline
df['categories'] = categories

#to clean the html text and get html text
l = df['htmltext']
for i in range(0,len(l)) :
	try:
		l[i] =re.sub("\s\s+", " ", l[i])
		if 'Sign up You’re all set!' in l[i] : 
		  head, sep, tail = l[i].partition('Sign up You’re all set!')
		  print('in if'+str(i)+"\t"+head[-100:])
		elif '<div class=' in l[i] : 
		   head, sep, tail = l[i].partition('<div class=')
		   print('in else '+str(i)+"\t"+head[-200:])  
	except: 
		#print(l[i])
		pass

df.to_csv(destPath, sep='\t', encoding='utf-8')
