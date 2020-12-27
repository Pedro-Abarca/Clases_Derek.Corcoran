# Clase 1: El tidyverse

# Cargar una base de dados con la función data.
data("uspop")
uspop # población de EE.UU. en millones de habitantes.

# crear un vector x
x <- c(2,3,4,5,3,4,6,3,7,6,4)
x
# a este vector x se le puede aplicar varias funciones
mean(x) # media
sd(x) # desviación estandar
x * 4 # multiplica cada valor de x por 4

# subseteo de vectores
uspop[5] # obtiene el 5to elemento
uspop[c(5,8)] # obtiene el 5to y 8vo elemento
uspop[5:8] # obtiene los valores del 5to al 8vo elemento
