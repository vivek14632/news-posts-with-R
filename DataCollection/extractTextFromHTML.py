# Purpose: To extract all visible text from a HTML file

def extractTextFromHTML(mFileName)
  fp=open(mFileName)
  html_doc=fp.read()
  fp.close()
  from bs4 import BeautifulSoup
  soup = BeautifulSoup(html_doc, 'html.parser')
  [s.extract() for s in soup(['style', 'script', '[document]', 'head', 'title'])]
  visible_text = soup.getText()
  return visible_text
