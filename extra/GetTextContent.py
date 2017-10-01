from bs4 import BeautifulSoup
import pandas as pd
import os
import re

path = '/home/nargis/Desktop/test1/'
destPath =  '/home/nargis/Desktop/test1/newsDetails.csv'
all_pages = os.listdir(path)

n = len(all_pages)
headline= [None] * n
categories = [None] * n
htmltext = [None] * n
 
j =0
for i in range(0,len(all_pages)):
    try:
        fp=open(path+str(all_pages[i]))
        html_doc=fp.read()
        fp.close()

        soup = BeautifulSoup(html_doc, 'html.parser')

        headline[i] = soup.find(itemprop="headline").getText()
        categories[i] =soup.find("div", { "class" : "headline-kicker" }).getText()
        htmltext[i] =soup.find(id="main-content").getText()
        print(i)
    except:
        j=j+1
        print(all_pages[i])
print(j)

df = pd.DataFrame({})
all_pages = [page.replace('.html', '') for page in all_pages]
df['Id'] = all_pages 
df['htmltext'] = htmltext
df['headline'] = headline
df['categories'] = categories

#to clean the html text
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
