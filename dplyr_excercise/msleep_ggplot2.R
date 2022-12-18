#Import the data set

library(downloader)
library(dplyr)
url = "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

mammalian <-read.csv("msleep_ggplot2.csv")


#head(mammalian)

#View(mammalian)

#FILTER
primates <- filter(mammalian, order=="Primates") %>% select(sleep_total) #keep only the ones with Primates order
nrow(primates)

primates

#SELECT
primateSleep<-filter(mammalian, order=="Primates") %>% select(sleep_total)
primateSleep


#UNLIST
y <- filter(mammalian, order=="Primates") %>% select(sleep_total) %>% unlist
mean( y )

#OR ALL IN ONE STEP

filter(mammalian, order=="Primates") %>% select(sleep_total) %>% unlist %>% mean


#?summarise
y <- filter(mammalian, order=="Primates") %>% select(sleep_total) %>% summarise(mean(sleep_total))
y
