plot(fb_page$shares_count,type = 'b',ylab = "#Share",xlab = 'FB post',col='red')
plot(fb_page$likes_count[1:50],type = 'b',ylab = "#Comments",xlab = 'FB post',col='green')
plot(fb_page$comments_count[1:50],type = 'b',ylab = "#Comments",xlab = 'FB post',col='blue')

barplot(c(sum(fb_page$shares_count),sum(fb_page$likes_count),sum(fb_page$comments_count)),
        names.arg = c('#Shares','#Likes','#Comments'),
        col=c('red','green','blue'))

