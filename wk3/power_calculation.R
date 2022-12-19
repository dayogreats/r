
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)


# Power Calculations Exercises #2

# Set the seed at 1, then use the replicate function to repeat the code used in the exercise above 10,000 times. What proportion of the time do we reject at the 0.05 level?
  
N=5
set.seed(1)
rejects <- replicate(10000,{
  dat.ns <- sample(bwt.nonsmoke , N)
  dat.s <- sample(bwt.smoke , N)
  t.test(dat.s, dat.ns)$p.value < 0.05
})
mean(rejects) ## [1] 0.0984

#or 

set.seed(1)
N <- 5
alpha <- 0.05
reject <- function(N, alpha=0.05){
  dat.ns <- sample(bwt.nonsmoke , N) 
  dat.s <- sample(bwt.smoke , N) 
  pval <- t.test(dat.s,dat.ns )$p.value
  pval < alpha
}

reject(N) ## [1] FALSE
B <- 10000
rejections <- replicate(B,reject(N))
mean(rejections)  ## [1] 0.0984


# Power Calculations Exercises #3
# Note that, not surprisingly, the power is lower than 10%. Repeat the exercise above for samples sizes of 30, 60, 90 and 120. Which of those four gives you power of about 80%?
  
Ns=c(10,60,90,120)
res <- sapply(Ns, function(N){
  set.seed(1)
  rejects <- replicate(10000,{
    dat.ns <- sample(bwt.nonsmoke , N)
    dat.s <- sample(bwt.smoke , N)
    t.test(dat.s, dat.ns)$p.value < 0.05
  })
  mean(rejects)
})

Ns[ which.min( abs( res - .8) ) ] 
## [1] 60

#or

Ns <- c(30, 60, 90,120)
power <- sapply(Ns,function(N){
  rejections <- replicate(B, reject(N))
  mean(rejections)
})
power  ## [1] 0.4881 0.7951 0.9357 0.9837


# Power Calculations Exercises #4
# Repeat the problem above, but now require an α level of 0.01. Which of those four gives you power of about 80%?
  
Ns=c(10,60,90,120)
res <- sapply(Ns, function(N){
  set.seed(1)
  rejects <- replicate(10000,{
    dat.ns <- sample(bwt.nonsmoke , N)
    dat.s <- sample(bwt.smoke , N)
    t.test(dat.s, dat.ns)$p.value < 0.01
  })
  mean(rejects)
})

Ns[ which.min( abs( res - .8) ) ] ## [1] 90

