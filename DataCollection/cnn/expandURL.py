import requests

def expandURL(url):
  url = "http://foo.com"
  site = requests.get(url)
  return(site.url)
