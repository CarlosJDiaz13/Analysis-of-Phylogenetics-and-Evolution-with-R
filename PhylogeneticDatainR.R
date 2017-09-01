#Exercices cap3 Analysis of phylogenetics and evolution with R
#BIOLOGIA COMPARADA I

#Carlos Javier Diaz : cjda1396@gmail.com
getwd()
setwd("~/Descargas/Biologia Comparada/")
library(ape)

#1. Create a random tree with 10 tips.
tr1 <- rtree(10)
tr1
plot(tr1)
plot.phylo()

# others tree
y1 <- rtree(3)
y2 <- y1$edge

y3 <- rtree(100)
y4 <- y3$edge
#(a) Extract the branch lengths, and store them in a vector.
str(tr1)
x <- tr1$edge.length
x12 <- tr1$edge
#(b) Delete the branch lengths, and plot the tree.
tr1$edge.length <- NULL
tr1$edge.length <- NA # NA 
plot(tr1) # With NA show : Warning message:
# ## In plot.phylo(tr1) : 1 branch length(s) NA(s): branch lengths ignored in the plot


#(c) Give new, random branch lengths from a uniform distribution U [0, 10]. #Do this in a way that works for any number of tips.

tr1$edge.length <- abs(runif(length(tr2[,1]), 0, 1)) # with the funtion run

tr2 <- tr1$edge # assign  tr1$edge  to the tr2 
#Give new, random branch lengths from a normal distribution U [0, 10]
tr1$edge.length <- abs(rnorm(length(tr2[,1]), 0, 1))
# now
plot(tr1)
#(d) Restore the original branch lengths of the tree.
tr1$edge.length <- x #now assign the original branch lengths of the tree, x was  the branch lengths up assign of the tree tr1 

#2.Create a random tree with 5 tips, print it, and plot it. Find the way to delete the class of this object, and print it again. Try to plot it again:  comment on what happens. Find a way to force the plot of the tree as before.
# Create a random tree with 5 tips
arb1 <- rtree(5)
arb1
plot(arb1)
# 
class(arb1)
# now delete the class of arb1
class(arb1) <- NULL
class(arb1)
print(arb1)
plot(arb1)

# AQui volvemos a asignar la clase phylo
# Reassign class "phylo" to tree (arb1)
class(arb1) <- "phylo"
plot(arb1)
# now asign class Multiphylo
class(arb1) <- "Multiphylo"
plot(arb1)
# but class "Multiphylo", the object must have more than one tree 
tr3 <- rmtree(n)#n arbolitos
# for example
MyTM<- list() # creamos una lista vacia
MyTM[[1]] <- arb1
MyTM[[2]] <- arb1
str(MyTM)
# here assign the class "Multiphylo"
class(MyTM) <- "multiphylo"
plot(MyTM)
plot.multiPhylo(MyTM) 

# 3.Generate three random trees with 10 tips. Write them in a file. Read this file in R. Print a summary of each tree. Write a small program that will
#do these operations for any number of trees (say N) and any number of tips (n).
x1 <- rtree(10)
x2 <- rtree(10)
x3 <- rtree(10) 
# write a file for each tree
write.tree(x1, "tre1.tre")
write.tree(x2, "tre2.tre")
write.tree(x3, "tre3.tre")
# read a file of the tree tre1
tre4 <- read.tree("tre1.tre")

?rmtre()
#create a function  for MultiTree with number of tree and terminals
#mitree <- rmtree(NumeroDeArboles,numeroDeTerminales) # for create the funtion
CreateMuliTree <- function(NumeroDeArboles=1,numeroDeTerminales=10){
  mitree <- rmtree(NumeroDeArboles, numeroDeTerminales)
  return(mitree)
  }
# Example
CreateAndSaveMuliTree(10,10)

#4. 
#(a) Write a function that will read trees from the Pfam database, so that#so we can use it with:
# this is the funtion:
# 
read.pfamtree(accnum, type = "full")
# for the moment the page presents difficulties, but  but it should work the following
a <- "http://pfam.sanger.ac.uk/family/tree/"
b <- "download?alnType=meta&acc=PF01607"
ref <- paste(a, b, sep = "")
tr <- read.tree(ref)
tr


# 5) Extract the sequences of the cytochrome b gene with the accession numbers U15717–U15724 (source: [116]).

#(a) Print the species names of each sequence.
### for this create the funtion 
##the following is an example for a single access number
# read of genbank the access number and assign a vector x1 
x1 <- read.GenBank("U15717",species.names = T) 
#Obtain object attributes, in this case "species"
attr(x1,"species")
paste("U",15717:15725,sep = "")
#
library(ape)
### here created a function to obtain the attributes of several access numbers
PrintName <- function(Codigos){
  x1<- read.GenBank(paste("U157",17:25,sep = ""),species.names = T)
  return
  #(print
  (attr(x1,"species"))#)
}
# example with the funtion PrintName
PrintName()








































































































#where accnum is the accession number of the family, and type is the
#type of the alignment (see p. 44).
#(b) Extract the tree #1000 in Pfam. Make three copies of this tree, and
#give them branch lengths (i) all equal to one, (ii) so that the node
#heights are proportional to the number of species, and (iii) randomly
#extracted from a uniform distribution U [0, 0.1].

T1000 <- dbtrees("treebase", 1000)
T1000.copy1 <- T1000.copy2 <- T1000.copy3 <- T1000
T1000.copy1 <- compute.brlen(T1000.copy1, 1)
T1000.copy2 <- compute.brlen(T1000.copy2, "Grafen")
T1000.copy3 <- compute.brlen(T1000.copy3, runif, 0, 0.1)

#5. Extract the sequences of the cytochrome b gene with the accession num-
#bers U15717–U15724 (source: [116]).
x <- read.GenBank(paste("U157", 17:24, sep = ""))
#(a) Print the species names of each sequence.
attr(x, "species")
#(b) Print, with a single command, the length of each sequence.
sapply(x, length) #(lapply returns the same result as a list instead of a vector)
#(c) Arrange the data in a matrix.
Xmat <- matrix(unlist(x), length(x), byrow = TRUE)
#(d) Extract and store in three matrices the first, the second, and the
#third codon positions of all sequences. Compute their base frequencies.
#What do you conclude?
x1 <- Xmat[, seq(1, 1045, 3)]
x2 <- Xmat[, seq(2, 1045, 3)]
x3 <- Xmat[, seq(3, 1045, 3)]
base.freq(x1)

#Note that it is very easy to include these commands in a loop:
X.position <- list()
length(X.position) <- 3
for (i in 1:3) X.position[[i]] <- Xmat[, seq(i, 1045, 3)]
lapply(X.position, base.freq)

#(e) Save the three matrices in three different files. Read these files, and
#concatenate the three sets of sequences.

write.dna(x1, "x1.txt")
write.dna(x2, "x2.txt")
write.dna(x3, "x3.txt")
y1 <- read.dna("x1.txt")
y2 <- read.dna("x2.txt")
y3 <- read.dna("x3.txt")
z <- cbind(y1, y2, y3) #z = concatenate the three sets of sequences

#6.a- Write a program that will extract single nucleotide polymorphism
#(SNP) from a sequence alignment. The output will include the posi-
#  tion of the SNPs along the sequence and the observed bases (alleles).
#You will include an option to output the sequence of the constant
#sites.

