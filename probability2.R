#dpois(x,lambda)
#ppois(x,lambda)
#rpois(n,lambda)



probs <- dpois(0:4,0.61)
probs <- c(probs,1-ppois(4,0.061))
expected <- 200*probs
expected

dpois(80, 82.5)
dbinom(80,3.3*10^9,2.5*10^(-8))


# pq aproximamos com uma poisson?

n <- 3.3*10^9
p <- 2.5* 10^(-8)
dbinom(n-80,n,1-p)

dpois(n-80,n*(1-p))