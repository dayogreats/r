url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
dat <- read.csv(url)
head(dat) 

library(dplyr)
control <- filter(dat,Diet=="chow") %>% select(Bodyweight) %>% unlist
treatment <- filter(dat,Diet=="hf") %>% select(Bodyweight) %>% unlist
print( mean(treatment) )

## [1] 26.83417
mean(control) 
## [1] 23.81333
obsdiff <- mean(treatment) - mean(control)
obsdiff
## [1] 3.020833
