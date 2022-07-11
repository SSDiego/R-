n <- 100
p <- 0.1
barplot(dbinom(0:n, n, p), names.arg = 0:n)

#Q1
1-pbinom(5,100,0.10)

#To simulate the probability P(X > 5) based on 10,000 repetitions, type
n <- 10000
simlist <- rbinom(n,100,0.10)
sum(simlist>5)/n

#Q2
1-pbinom(100,110,0.88)

#Q2-1
1-pbinom(100,108,0.88)

1-pbinom(100,109,0.88)

barplot(dbinom(0:108, 108, 0.88), names.arg = 0:108)

#SIMULATING
#To simulate the probability of overbooking when 108 tickets are sold, generate
#108 Bernoulli random variables with p = 0.88. A Bernoulli variable is a binomial
#variable with n = 1. Type
rbinom(109,1,0.88)
#To check if more than 100 tickets are sold and the airline overbooks, type
if (sum(rbinom(120,1,0.88))>100) 1 else 0
#which returns a 1 if too many tickets are sold, and 0 otherwise

simlist <- replicate(10000, if (sum(rbinom(108,1,0.88))>100) 1 else 0)
mean(simlist)


#Criação de problema
A <- 0.292
B <- 0.207
C <- 0.207
D <- 0.292

df <- data.frame(A, B, C, D)

#df representa a frequência observada de chamados de problemas
#(reclamações).
#Digamos que dois produtos sejam criados e queremos avaliar 10
#casos de cada um. Se casa um apresenta a mesma chance de receber
#relatos de reclamações, qual a probabilidade de essas duas linhas
#apresentem 7 problemas iguais?