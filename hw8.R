library(igraph)

##simulate a random graph and print it's adjacency matrix
g <- erdos.renyi.game(10,0.3)
plot.igraph(g)

##I'm looking at this graph and I'm not sure what information this can tell me
##Also, how do I print the adjacency matrix? 