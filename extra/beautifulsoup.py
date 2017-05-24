# installation
# $ apt-get install python-bs4 (for Python 2)

# $ apt-get install python3-bs4 (for Python 3)

fp=open('abc.html')
htmp_doc=fp.read()
fp.close()
from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')
mtext=soup.get_text()

fp=open('file.txt','w')
fp.write(mtext)
fp.close()
