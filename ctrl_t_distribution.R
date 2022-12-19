library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)


# CLT and t-distribution in Practice Exercises #1
# The CLT is a result from probability theory. Much of probability theory was originally inspired by gambling. This theory is still used in practice by casinos. For example, they can estimate how many people need to play slots for there to be a 99.9999% probability of earning enough money to cover expenses. Let’s try a simple example related to gambling.
# Suppose we are interested in the proportion of times we see a 6 when rolling n=100 die. This is a random variable which we can simulate with x=sample(1:6, n, replace=TRUE) and the proportion we are interested in can be expressed as an average: mean(x==6). Because the die rolls are independent, the CLT applies.

# We want to roll n dice 10,000 times and keep these proportions. This random variable (proportion of 6s) has mean p=1/6 and variance p(1-p)/n. So according to CLT z = (mean(x==6) - p) / sqrt(p(1-p)/n) should be normal with mean 0 and SD 1. Set the seed to 1, then use replicate to perform the simulation, and report what proportion of times z was larger than 2 in absolute value (CLT says it should be about 0.05).

set.seed(1)
n <- 100
sides <- 6
p <- 1/sides
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(zs)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)

# CLT and t-distribution in Practice Exercises #2
# 
# For the last simulation you can make a qqplot to confirm the normal approximation. Now, the CLT is an asympototic result, meaning it is closer and closer to being a perfect approximation as the sample size increases. In practice, however, we need to decide if it is appropriate for actual sample sizes. Is 10 enough? 15? 30?
#   
#   In the example used in exercise 1, the original data is binary (either 6 or not). In this case, the success probability also affects the appropriateness of the CLT. With very low probabilities, we need larger sample sizes for the CLT to “kick in”.
# 
# Run the simulation from exercise 1, but for different values of p and n. For which of the following is the normal approximation best?
  
p=0.5 and n=5
p=0.5 and n=30
p=0.01 and n=30
p=0.01 and n=100

ps <- c(0.5,0.5,0.01,0.01)
ns <- c(5,30,30,100)

library(rafalib)
mypar(4,2)
for(i in 1:4){
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000,{
    x <- sample(1:sides,n,replace=TRUE)
    (mean(x==1) - p) / sqrt(p*(1-p)/n)
  }) 
  hist(zs,nclass=7)
  qqnorm(zs)
  abline(0,1)
}

# p= 0.5, n= 30



# As we have already seen, the CLT also applies to averages of quantitative data. A major difference with binary data, for which we know the variance is , is that with quantitative data we need to estimate the population standard deviation.
# In several previous exercises we have illustrated statistical concepts with the unrealistic situation of having access to the entire population. In practice, we do *not* have access to entire populations. Instead, we obtain one random sample and need to reach conclusions analyzing that data. dat is an example of a typical simple dataset representing just one sample. We have 12 measurements for each of two populations:
  
  
X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist


# We think of  as a random sample from the population of all mice in the control diet and  as a random sample from the population of all mice in the high fat diet.
# Define the parameter  as the average of the control population. We estimate this parameter with the sample average . What is the sample average?


















