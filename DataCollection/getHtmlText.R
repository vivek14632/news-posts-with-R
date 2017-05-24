# Using the code developed by Nargis

library(rvest)
library(stringr)

# to download all the links

urls <- fb_page$link
destPath <-"/home/nargis/Desktop/test1/"

i <-1
#j<-1
for (url in urls) {
  name <-fb_page$id[i]
  #print(name)
  if(fb_page$type[i]=="link"){
    newName <- paste (destPath,name,".html" ,sep ="")
    print(newName)
    download.file(url, destfile = newName,quiet=TRUE)
    #j<-j+1
  }
  i<-i+1
}


all_links <-list.files(destPath)
no_links <-length(all_links)

df1 <- data.frame(
  newsId = character(),
  headline = character(),
  htmltext=character(),
  category=character(),
  stringsAsFactors=FALSE)

for(j in 1:length(all_links)){
  
  tryCatch({
   # all_links[j] <-"97212224368_10155491436834369.html"
    #browser()
    page <- read_html(paste(destPath,all_links[j],sep =""))
    p <-page %>% html_nodes("div.cnbc-body ") 
    print(paste(destPath,all_links[j],sep =""))
    df <- data.frame(
      newsId = character(1),
      headline = character(1),
      htmltext=character(1),
      category=character(1),
      stringsAsFactors=FALSE)
    
    df$newsId <- sub(".html","",all_links[j])
    df$category <-  html_nodes(page,"a.header_title")%>%html_text() #category
    df$headline <-html_children(html_nodes(page,"div.story-header-left "))[1]%>%html_text()
    df$htmltext <-gsub("(\\n*)(\\t*)","",html_children(html_nodes(page,"div.story"))[1]%>%html_text())
    
    df1 <- rbind(df1,df)
  }, error = function(err) {
    print(all_links[j])
  }
  )
}
