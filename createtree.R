library(ape)
vec1 <- paste("U157",17:24,sep = "")
MisDat <- read.GenBank(vec1)
str(MisDat)
str(MisDat[[1]])
length(MisDat[[1]])

#Print, wi length of each sequence.th a single command, the
#lapply (list,funtion)
lapply(MisDat,length)

#(c) Arrange the data in a matrix.

x <- matrix(MisDat)
x[,1]
x[1,]

as.alignment(MisDat) -> miPseudoAlin
str(miPseudoAlin)
class(miPseudoAlin)
print(miPseudoAlin)
str(miPseudoAlin[[2]])

write.nexus(miPseudoAlin,file = "pseudoalin",translate = T)
write.nexus(MisDat,file = "misdat",translate = F)
library(phangorn)
write.dna(MisDat,file = "misdat",format = "fasta")

as.alignment(MisDat) -> miPseudoAlin
str(miPseudoAlin)
class(miPseudoAlin)
print(miPseudoAlin)
str(miPseudoAlin[[2]][1])
#here convert of number to letters
miPseudoCHar <- as.character(MisDat)
str(miPseudoCHar)
miPseudoCHar[[1]][3]
str(miPseudoCHar[[1]])
miPseudoCHar$U15719[3]
miPseudoCHar[[1]][1:3]

miPseudoCHar[1:8][z]


# NOW as.matrix
x2 <- as.matrix(miPseudoCHar)
x2
str(x2)
cosito <- as.data.frame(x2)
cosito
str(cosito)
cosito[,z]

cosito[z,]
##------------------------------------------------
#(d) Extract and store in three matrices the first, the second, and the
#third codon positions of all sequences. Compute their base frequencies.What do you conclude?

z <- seq(1,1045,by = 3)
seq(2,1045,by = 3)
seq(3,1045,by = 3)

cosito <- as.data.frame(x2)
cosito
class(cosito)
str(cosito)
cosito[,z]

cosito[z,]
cosito[1,9]
cosito[1,8]
#----------------------------------------------------------

cosito <- as.data.frame(miPseudoCHar)
cosito
class(cosito)
str(cosito)
cosito[,z]

cosito[z,]
cosito[1,9]
cosito[1,8]
#---------------------------------------------------------------------------------------------------------
y1 <- c(1,2,3,4,5,7,8,9)
x1 <- c(7,7,8,9,9,6,6,8)
edge <- as.integer(c(1:8,1:2))
c <- 1:8
col <- c(2*c -2)
tip.label <-c("A","B","C","D","E")
Nnode <- as.integer(5)

x4 <- matrix(NA, 8,2)
y <- c(1:8,8:1)
list()


#-------------------------------------------------------------------



x <-list()
x$Nnodes <- 8


x$edge <-data.frame(x,y)
x$tip.label <- 


