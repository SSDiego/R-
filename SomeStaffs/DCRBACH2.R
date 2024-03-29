#----Module 2: Data Types------------------------------------------------------


#Vou come�ar com os dados que ser�o utilizados

#install.packages("dslabs")

library(dslabs)
data(murders)

#Primeira vis�o dos dados
str(murders)
names(murders)
View(murders)



#Vou construir uma vari�vel para poder visualizar "population" separadamente
#Depois vou examinar a classe dessa vari�vel e abbrevations
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


#Compreendendo o conceito de Tabela. � uma forma de organizar seus dados, que po
#de ser �til para voc� construir parti��es, em forma de tabelas, de um data frame
#que esteja analizando

x <- c("a", "a", "b", "b", "b", "c")
table(x)

# Write one line of code to show the number of states per region
table(murders$region)
