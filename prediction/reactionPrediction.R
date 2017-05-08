#load data
load('/home/cis1024/socialNetworkData/forbes2017-05-08.RData')

#to see objects in the R workspace
ls()

#> ls()
# [1] "auth"       "checkFile"  "count1"     "dataDir"    "fb_oauth"
# [6] "fb_page"    "filename"   "i"          "j"          "newsagency"
#[11] "posts"      "replies"    "temp"       "tokensFile" "val"
#[16] "value"


#fb_page variable contains the details of the posts

# to see the column names, use names() function
names(fb_page)
#> names(fb_page)
# [1] "id"             "likes_count"    "from_id"        "from_name"
# [5] "message"        "created_time"   "type"           "link"
# [9] "story"          "comments_count" "shares_count"   "love_count"
#[13] "haha_count"     "wow_count"      "sad_count"      "angry_count"

#to view all the posts
fb_page$message




