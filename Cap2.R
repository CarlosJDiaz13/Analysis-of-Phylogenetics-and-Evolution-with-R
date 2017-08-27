##BIologia comparada
#Carlos Javier Diaz: cjda1396@gmail.com
setwd("Descargas/Biologia Comparada/")
getwd()
library(ape)

###Punto dos 
x1 <- rpois(1000, lambda = 1)
x2 <- rpois(1000, lambda = 5)
x3 <- rpois(1000, lambda = 10)
x4 <- c(x1,x2,x3)
x5 <- matrix(x4, nrow = 1000, ncol = 3, byrow = F)
colnames(x5) <- c("v1", "v2", "v3")
class(x5)
summary(x5)
##X la matriz o data frame
#MARGIN para indicar la aplicación de la función. 1 indica por filas y 2 indica por columnas
##FUN la función que deseamos aplicar

#con esta calculamos la media de cada columna 
apply(x5, 2, mean)
# en esta tambien calculamos la media pero por separado.
mean(x5[,"v1"])
mean(x5[,"v2"])
mean(x5[,"v3"])

# ---------------------------------------------------------------------------------
## ṕUNTO 3
#a) Create and concatenate successively the 10 random values with c.
x6 <- c(20,8,19,21,6,23,9,27,30,5)
x61 <- rep(NA,10)

length(x6)
###(b) Create a numeric vector of length 10 and change its values successively.
x7 <- seq(1,20,by = 2)
#c) use Use the most direct method.
x8 <- 1:10
###

#####Punto 4
x9 <-c("Mus_musculus","Homo_sapiens","Balaenoptera_musculus") 
x10 <- c(10,7000,120000000)
x12 <- cbind(x9,x10)
write.table(x12,file = "punto4",row.names = F,col.names = F)
##a)
x13 <- read.table("punto4")

x13 <- read.table("punto4",header = T)


x <-x13$V2
names(x) <- x13$V1
x

##b)
x["Mus_musculus"]

####
?read.table

read.table("punto4")

####
#punto5

Archaea <- c("Crenarchaea", "Euryarchaea")
Bacteria <- c("Cyanobacteria", "Spirochaetes","Acidobacteria")

##a) (a) Create a list named TreeOfLife so that we can do TreeOfLife$Archaea
#to print the corresponddfinG group
TreeOfLife <- list(Archaea,Bacteria)
TreeOfLife[1]
TreeOfLife <- list(Archaea=Archaea,Bacteria=Bacteria)
str(TreeOfLife)
TreeOfLife$Archaea

Eukaryotes <- c("Alveolates", "Cercozoa", "Plants", "Opisthokonts")
###
#It should appear at the same level as archea and bactera
TreeOfLife <- c(TreeOfLife, list(Eukaryotes = Eukaryotes))

#(c) Updateee Arcchaea by adddding "Actinobacteria".
TreeOfLife$Archaea <- c(TreeOfLife$Archaea, "Actinobacteria")

#(d) Printt all the lowest-level taxa.
list(TreeOfLife)
list(TreeOfLife[1:3])
