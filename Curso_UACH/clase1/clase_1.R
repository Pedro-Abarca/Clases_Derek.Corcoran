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

# creación de un vector y a partir del vector x
y <- x[5,8] # crea el vector y con 2 elementos de vector x.


# data.frame, ejemplo:
data("iris")
View(iris) # abre iris en una ventana

# se pueden seleccionar columnas especificas de un data.frame
iris$Sepal.Length # selecciona la columna Sepel.Length y la muestra como vector.

# sub-seteo de data.frame mediante []
iris[1,] # a la derecha de la como indica las filas
iris[c(1,4,6),] # selecciona las filas 1, 4 y 6
iris[seq(5,150, by = 5),] # selecciona filas en secuencia de la 5 a la 150 de 5 en 5.

# Haré un vector con el largo de petalo
largo_petalo <- iris$Petal.Length
largo_petalo

# con ese vector podemos separarlo según especies
largo_setosa <- largo_petalo[1:50]
largo_versicolor <- largo_petalo[51:100]
largo_virginica <- largo_petalo[101:150]

# aplicando funciones a los vectores (media y desviación estandar)
mean(largo_setosa); sd(largo_setosa)
mean(largo_versicolor); sd(largo_versicolor)
mean(largo_virginica); sd(largo_virginica)


## Principios de Tidydata

# se debe comenzar cargando los paquetes a utilizar
library(tidyverse)

# haremos un resumen de largo de petalo
resumen_largo_petalo <- summarise(iris, largo_petalo = mean(Petal.Length), desviación = sd(Petal.Length))
View(resumen_largo_petalo)

# group_by y summarise para resumir por grupo
resumen_largo_petalo <- group_by(iris, Species)
resumen_largo_petalo <- summarise(resumen_largo_petalo, largo_petalo = mean(Petal.Length), desviación = sd(Petal.Length))
View(resumen_largo_petalo)
# lo anterior se puede exportar como .csv
write_csv(resumen_largo_petalo, "resumen.csv") # va nombre objeto y luego nombre del archivo

# agrupar por mas de una variable
data("mtcars")
colnames(mtcars)
eficiencia <- group_by(mtcars, cyl, am)
eficiencia <- summarise(eficiencia, eficiencia = mean(mpg))
View(eficiencia)

## mutate, es para crear variables nuevas
DF <- mutate(iris, razon_sepalo_petalo = Sepal.Length/Petal.Length)
DF <- group_by(DF, Species)
DF <- summarise(DF, razon_sepalo_petalo = mean(razon_sepalo_petalo), N = n())
view(DF)
