url <- "https://raw.github.com/genomicsclass/dagdata/blob/master/inst/extdata/mice_pheno.csv"
dat <- read.csv(url)
View(dat)



library(dplyr)
x<- filter(dat,Sex == "M" & Diet == "chow") %>% 
  select(Bodyweight) %>% unlist
length(x)

set.seed(1)
X<- sample(x,25)
mean(X)