installed.packages("rafalib")
library(dplyr)
library(rafalib)
library(downloader) 

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)


#url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
#dat <- read.csv(url)
#View(dat)
summary(dat)
dat <- na.omit(dat) #remove column with NA from the dataset

summary(dat)



#Population, Samples, and Estimates Exercises #1
#Q:Use dplyr to create a vector x with the body weight of all males on the control (chow) diet. What is this population’s average?
  

x<- filter(dat,Sex == "M" & Diet == "chow") %>% select(Bodyweight) %>% unlist

length(x) ## [1] 223

mean(x)


popsd(x)


#Population, Samples, and Estimates Exercises #3
#Q:Set the seed at 1. Take a random sample X of size 25 from x. What is the sample average?
  
set.seed(1)
X<- sample(x,25)
mean(X)
## [1] 32.0956

#Population, Samples, and Estimates Exercises #4
#Q:Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet. What is this population’s average?
  
y<- filter(dat,Sex == "M" & Diet == "hf") %>% select(Bodyweight) %>% unlist
length(y) ## [1] 193
mean(y) ## [1] 34.84793


#Population, Samples, and Estimates Exercises #5
#Q:Now use the rafalib package and use the popsd function to compute the population standard deviation.

#library(rafalib)
popsd(y) ## [1] 5.574609

# Population, Samples, and Estimates Exercises #6
# Q:Set the seed at 1. Take a random sample Y of size 25 from y. What is the sample average?
  
set.seed(1)
Y<- sample(y,25)
mean(Y) ## [1] 34.768
 

# Population, Samples, and Estimates Exercises #7
# Q:What is the difference in absolute value between y¯−x¯ X¯−Y¯

a<-mean(y)-mean(x)
b<-abs(mean(X)-mean(Y))
a-b ## [1] 1.211716 #or
abs( ( mean(y) - mean(x) ) - ( mean(Y) - mean(X) ) ) ## [1] 1.211716


#Population, Samples, and Estimates Exercises #8
#Q:Repeat the above for females. Make sure to set the seed to 1 before each sample call. 
# What is the difference in absolute value between y¯−x¯ X¯−Y¯

library(dplyr)
x<- filter(dat,Sex == "F" & Diet == "chow") %>% select(Bodyweight) %>% unlist
mean(x) ## [1] 23.89338



set.seed(1)
X<- sample(x,25)
mean(X) ## [1] 23.1692
y<- filter(dat,Sex == "F" & Diet == "hf") %>% select(Bodyweight) %>% unlist
mean(y) ## [1] 26.2689


set.seed(1)
Y<- sample(y,25)
mean(Y) ## [1] 26.2812
abs( ( mean(y) - mean(x) ) - ( mean(Y) - mean(X) ) ) ## [1] 0.7364828



