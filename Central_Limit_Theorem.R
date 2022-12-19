installed.packages("rafalib")
library(dplyr)
library(rafalib)
library(downloader) 

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)

summary(dat)

#dat <- na.omit(dat) #remove column with NA from the dataset

# Central Limit Theorem Exercises #1
# Q:If a list of numbers has a distribution that is well approximated by the normal distribution, what proportion of these numbers are within one standard deviation away from the list’s average?
  
  pnorm(1)-pnorm(-1)
## [1] 0.6826895 #or
1-(pnorm(-1) + (1 - pnorm(1))) ## [1] 0.6826895


# Central Limit Theorem Exercises #2
# Q:What proportion of these numbers are within two standard deviations away from the list’s average?
  
  pnorm(2)-pnorm(-2) ## [1] 0.9544997

# Central Limit Theorem Exercises #3
# Q:What proportion of these numbers are within three standard deviations away from the list’s average?
  
pnorm(3)-pnorm(-3) ## [1] 0.9973002


# Central Limit Theorem Exercises #4
# Q:Define y to be the weights of males on the control diet. What proportion of the mice are within one standard deviation away from the average weight (remember to use popsd for the population sd)?
  
library(dplyr)
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)

mean(abs(z) <=1) ## [1] 0.6950673


# Central Limit Theorem Exercises #5
# Q:What proportion of these numbers are within two standard deviations away from the list’s average?
  
z <- ( y - mean(y) ) / popsd(y)
mean( abs(z) <=2 ) ## [1] 0.9461883 

# Central Limit Theorem Exercises #6
# Q:What proportion of these numbers are within three standard deviations away from the list’s average?
  
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

mean(avgs)


