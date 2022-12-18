library(downloader) ##use install.packages to install
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
if (!file.exists(filename)) download(url, destfile=filename)

rd <- read.csv(filename)
x <- unlist(rd)

#rd
mean(x)


#Random Variables Exercises #2
set.seed(1)
X <- sample(x,5)
abs(mean(X) )
abs( mean(X) - mean(x) )



#Set seed
set.seed(1)

rnorm(5) # -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

rnorm(5) # -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884

set.seed(1)
x <- .Random.seed
x
rnorm(5)

y <- .Random.seed
y
rnorm(5)

# .Random.seed is not equal in both cases
identical(x, y) # FALSE



set.seed(1)
rnorm(5)   # -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

set.seed(1)
rnorm(5) 

set.seed(1)
rnorm(5) 

set.seed(1)
rnorm(5) 


set.seed(1)
rnorm(5) 

set.seed(1)
rnorm(5) 

