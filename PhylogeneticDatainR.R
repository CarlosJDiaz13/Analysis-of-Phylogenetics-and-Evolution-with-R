a <- "http://www.esapubs.org/archive/ecol/E084/093/"
b <- "Mammal_lifehistories_v2.txt"
ref <- paste(a, b, sep = "")
X <- read.delim(ref)
names(X)
paste(X$Genus, X$species, sep = "_")[1:5]
installed.packages("BoSSA")
library(BoSSA)
tzs <- read.PDB("http://www.rcsb.org/pdb/files/1TZS.pdb")


###-------------------------------------------------------------
a <- "http://pfam.sanger.ac.uk/family/tree/"
b <- "download?alnType=meta&acc=PF01607"
library(ape)
ref <- paste(a, b, sep = "")
tr <- read.tree(ref)
tr
## writing data 

save(x, y, tr, file = "mydata.RData")
#-----------------------------------------
# read and write files

tr <- read.tree(text = "(a:1,b:1);")
write.tree(tr)
[1] "(a:1,b:1);"
x <- write.tree(tr)
x
[1] "(a:1,b:1);"
# write the tree, in this moment the file called .tree
write.tree(tr, file = "treefile.tre")
## now one file in the format .nex or file nexus  #Nexus
write.nexus(tr)


write.nexus(tr1, tr2, tr3, file = "treefile.nex")
#-------------------------------------------------------------------------------------------

L <- list(tr1, tr2, tr3)
write.nexus(L, file = "treefile.nex")


#Splits can be written in a NEXUS file with write.nexus.splits in phangorn:

write.nexus.splits(as.splits(tr))

#3.4 Manipulating Data
#This section includes materials on phylogenetic data manipulation in R rang-
 # ing from basic to elaborate procedures. This will interest most users. Most of
#this section is devoted to the manipulation of trees since the manipulation of
#molecular, allelic, or phenotypic is usually done using basic R’s tools.

#3.4.1 Basic Tree Manipulation
#ape has several functions to manipulate "phylo" objects. They are listed
#below. In the examples, the trees are written as Newick strings for convenience;
#the results could also be visualized with plot instead of write.tree.
tr <- read.tree(text = "((a:1,b:1):1,(c:1,d:1):1);")
write.tree(drop.tip(tr, c("a", "b")))
write.tree(drop.tip(tr, 1:2)) # same as above
write.tree(drop.tip(tr, 3:4, trim.internal = FALSE))


#-------------------------------------------------------------------------------------

ta <- read.tree(text = "(a,b,c);")
tb <- read.tree(text = "(a,b,c):1;")
tc <- read.tree(text = "((a,b),c);")
is.rooted(ta)
is.rooted(tb)
is.rooted(tc)
td <- read.tree(text = "(a,b,c):0;")
is.rooted(td)


#3.4.3 Graphical Tree Manipulation
#It is fundamental to allow tree manipulation from the command line because
#in many situations the same operation must be done on several trees and this
#is practically done via a script or some command lines. But in exploratory
#analyses, it may be a bit tedious to pass the correct arguments to these func-
 # tions, and the user may prefer to interact more closely with the graphical
#display of the tree. The functions drop.tip, extract.clade, bind.tree, and
#root have an option interactive = FALSE which, when switched to TRUE,
#invites the user to click on the plotted tree to identify the argument tip or #node. The user must take care that the correct tree has been plotted, as well #as assigning the returned tree in a possibly different object.
plot(tr)
plot(ta <- root(tr, interactive = TRUE))

#
tr <- rtree(5)
#
#
##Dichotomous Versus Multichotomous Trees
#The Newick format represents multichotomies by having more than two sibling
#groups:
 # (. . . ,(A,B,C),. . . );
#This is represented explicitly in the class "phylo" by letting a node have
#several descendants in the element edge, for instance:

#.4.5 Summarizing and Comparing Trees
#There is a summary method for "phylo" objects. This function prints a brief
#summary of the tree including the numbers of nodes and tips.
#is.ultrametric tests if a tree is ultrametric (all tips equally distant from
#the root), and returns a logical value. This is done taking the numerical pre-
#cision of the computer into account or as specified by the user.

t1 <- read.tree(text = "((a:1,b:1):1,c:2);")
t2 <- read.tree(text = "(c:2,(a:1,b:1):1);")
all.equal(t1, t2)
#
t3 <- read.tree(text = "(c:1,(a:1,b:1):1);")
all.equal(t1, t3)
all.equal(t1, t3, use.edge.length = FALSE)

###
#Two objects of class "treeshape" can also be compared with all.equal.
#Because all.equal does not always return a logical value, it should not be
#used in programming a conditional execution. The following should be used
#instead:
 
isTRUE(all.equal(t1, t2))

ta <- read.tree(text = "(((a:1,b:1):1,c:2):1,d:3);")
tb <- read.tree(text = "(((a:0.5,b:0.5):1.5,d:2):1,c:3);")
compare.phylo(ta, tb, presCol = "white", absCol = "black",+
                  tsCol="darkgrey", font = 1)
#

distinct.edges(ta, tb)

installed.packages("phyloch")
installed.packages("LibPath")
