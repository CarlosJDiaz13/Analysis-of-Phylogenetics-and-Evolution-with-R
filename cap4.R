#1. Draw Fig. 4.11 using a color scale in place of the grey one. The figure should include a legend.

# agregation the colors
library(ape)
co <- c("red", "blue", "yellow")

data("bird.orders")
tr <-  bird.orders
plot(tr)
tr$Nnode
pajarito <- rnorm(20)
# simulamos un arbol
x <- rtree(10) 
vnodos <- rnorm(9)
plot(x)
nodelabels(vnodos)

ncolor <- c("blue", "green", "red")
p <- vnodos
p[(vnodos > 0.5 )] <- ncolor[1]
p[(vnodos > 0.5 & vnodos < 0.7  )] <- ncolor[2]
p[(vnodos < 0.7 )] <- ncolor[3]

nodelabels(vnodos)

plot(x, no.margin = TRUE, use.edge.length = F)
nodelabels(pch = 22, bg = p, cex = 3)
plot(x)
node
#-----------------------------------------------------------------------

tr1 <- rtree(10)

vnodos1 <- rnorm(9)
col <- c("blue","red","yellow","orange")
vnodos1[vnodos1 < -0.5] <- col[1]
vnodos1[vnodos1 > -0.5 & vnodos1 < 0] <- col[2]
vnodos1[vnodos1 > -0 & vnodos1 < 0.5] <- col[3]
vnodos1[vnodos1 > 0.5] <- col[4]
#-------------------------------------------------------------------------------
#gRAFICAR PARA MARCAR PROAVES
data("bird.orders")
tr <-  bird.orders
plot(tr)
rect(1.2, 0.5, 36, 5.4, lty = 6)
tiplabels(tr$tip.label[1:5], 1:5, adj = 0,
          bg = "red", col = "black")
nodelabels(text = "Proaves",node = 25,bg = "lightblue",frame = "circle")

#--------------------------------------------------------------------
x2 <- rtree(3)
x3 <- x2$edge[,2]
x3 <- c("red","blue","green","orange")

plot(x2)
x2$edge
y <- c("blue","blue","red","red")
y1 <- c("blue","red","yellow","pink")
plot(x3)
nodelabels()
plot(x2,edge.color = y1,
           use.edge.length = F,edge.width = 5,edge.lty = 1)
#-------------------------------------------------------------------------------
z <- read.tree("tre2.tree")
plot(z)
nodelabels()
z$edge


# hacer el 4to punto --
##



