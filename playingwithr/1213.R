install.packages("devtools")
install.packages("bit")
devtools::install_github("geoffjentry/twitteR")
library(twitteR)
tw_token = "446728348-5HZVSTuJohw7SmMdyUsHFAlEEt29ex1y3Ysez587"
tw_token_secret = "DWLkZfAdj4dTrZQzEwV3BMl8ePjEPalJa8dQWjwZnbdJ1"
tw_consumer_key = "WMfGLAtO1AGA13c4NFRNp0pHZ"
tw_consumer_secret ="PMZnkAp9qVe30ZWNw0jzXJXQqiLC2QJLAxz9wpQ0cv7FzIrzac"
setup_twitter_oauth(tw_consumer_key, tw_consumer_secret, tw_token, tw_token_secret)
tweets = searchTwitteR("#NaMo", resultType = "recent")
#NaMo is the name used to mention Indian Prime Minister, NArendra MOdi !!
tweets[[1]]
tweets[[1]]$text
as.data.frame(tweets[[1]])
tweets = plyr::ldply(tweets, as.data.frame)
  install.packages("plyr")
library(plyr)
nrow(tweets)
names(tweets)
View(tweets)
devtools::install_github("pablobarbera/Rfacebook", subdir = "Rfacebook")
library(Rfacebook)
fb_app_id = '1709270685994616'
fb_app_secret = 'aa6fc5bf135741ba95821d9f8a547058'
fb_token = fbOAuth(fb_app_id, fb_app_secret)
saveRDS(fb_token,"fbtoken.rds")
p = getPage(page="narendramodi",token=fb_token)
head(p)
View(p)
post = getPost(p$id[1],token=fb_token)
names(post$comments)
View(post$comments)
install.packages("rtimes")
library('rtimes')




#AmCAT

install.packages("stringi")
install.packages("modeltools")
install.packages("munsell")
devtools::install_github("amcat/amcat-r")
devtools::install_github("kasperwelbers/corpus-tools")
devtools::install_github("vanatteveldt/rsyntax")
library(amcatr)
amcat.save.password("https://amcat.nl","radarsh14","U2JPGna")
conn = amcat.connect("https://amcat.nl")
View(conn)
meta = amcat.getarticlemeta(conn,599,15455,dateparts = T)
head(meta)
View(meta)


meta = amcat.getarticlemeta(conn,1,30078,dateparts = T)
h=amcat.hits(conn,"*kashmir*",sets=30078)
head(h)


meta = meta[meta$medium %in% c("Overig", "Democrats"),]
h=merge(meta,h)
perweek =aggregate(h["count"], h[c("week","medium")],sum)
plot(x=perweek$week, y=perweek$count, type = "l")


meta = amcat.getarticlemeta(conn,1,30078,dateparts = T)
h=amcat.hits(conn,"*kashmir*",sets=30078)
head(h)

tokens= amcat.gettokens(conn, 1, 30078, page_size = 100)
head(tokens)
library(corpustools)
head(tokens)
dtm = dtm.create(tokens$aid,tokens$term)
dtm.wordcloud(dtm, freq.fun = sqrt)


meta = meta[meta$medium %in% c("modi"),]
h=merge(meta,h)

perweek =aggregate(h["count"], h[c("week","medium")],sum)
View(perweek)
plot(x=perweek$week, y=perweek$count, type = "l")

t = searchTwitteR("#Modi", resultType = "recent")
t = ldply(t, as.data.frame)
View(t)
amcat.upload.articles(conn, 1, "Narendra Modi", text = t$text, headline = t$screenName, date = t$created, medium = "twitter")
meta = amcatr::amcat.getarticlemeta(conn, 1, 30078)
h = amcat.hits(conn, sets = 30078, queries = "*Kashmir*")
h = merge(h, meta)
head(h)
a = aggregate(h["count"], h["date"], FUN = sum)
plot(x=a$date, y=a$count, type="l")
