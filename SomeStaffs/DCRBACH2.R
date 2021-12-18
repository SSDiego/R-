#----Module 2: Data Types------------------------------------------------------


#Vou começar com os dados que serão utilizados

#install.packages("dslabs")

library(dslabs)
data(murders)

#Primeira visão dos dados
str(murders)
names(murders)
View(murders)



#Vou construir uma variável para poder visualizar "population" separadamente
#Depois vou examinar a classe dessa variável e abbrevations
p <- murders$population 

class(p)

class(murders$population)

a <- murders$abb

class(a)

class(murders$abb)

#------------------------------------------------------------------------------
# This is how we do the same with the square brackets:
o <- murders[["population"]] 

# We can confirm these two are the same
identical(o, p)
#------------------------------------------------------------------------------

#Agora eu quero analisar o tomanho do Vetor Region e seus subconjuntos. Depois 
#vou contar esse subconjuntos

class(murders$region)
levels(murders$region)
length(murders$region)
length((levels(murders$region)))


#Compreendendo o conceito de Tabela. É uma forma de organizar seus dados, que po
#de ser útil para você construir partições, em forma de tabelas, de um data frame
#que esteja analizando

x <- c("a", "a", "b", "b", "b", "c")
table(x)

# Write one line of code to show the number of states per region
table(murders$region)
