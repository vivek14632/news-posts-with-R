from bs4 import BeautifulSoup
path = '/home/nargis/Desktop/test2/'
all_pages = os.listdir(path)

n = len(all_pages)
headline= [None] * n
categories = [None] * n
htmltext = [None] * n
 
for i in range(0,len(all_pages)):
    try:
        fp=open(path+str(all_pages[i]))
        html_doc=fp.read()
        fp.close()

        soup = BeautifulSoup(html_doc, 'html.parser')

        headline[i] = soup.find(itemprop="headline").getText()
       # categories[i] = soup.find("span", { "class" : "asset-metabar-usat-network-blue" }).getText()
        htmltext[i] =soup.find(itemprop="articleBody").findAll('p')
        print(i)
    except:
        print(all_pages[i])
