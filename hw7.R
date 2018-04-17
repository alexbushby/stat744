library(sunburstR)

library(dplyr)
library(d3heatmap)
library(GGally)

mt2 <- mtcars[order(mtcars$carb),]

mt3 <- mtcars[,5:6]

d3heatmap(mt2, scale = "column", colors = "Greens", dendrogram = "none")
d3heatmap(mtcars, scale = "column", colors = "Greens", dendrogram = "none")
d3heatmap(mt3, scale = "column", colors = "Greens", dendrogram = "none")

heatmap(as.matrix(mt2),scale="column")
heatmap(as.matrix(mt3),scale="column",keep.dendro=FALSE)

##is there a better way to select variables to choose in the heatmap?
##too many variables included seems to not tell any information.
##from mt3 you can tell that a lower real axle ratio (drat) 
##gives a higher wt (weight)

## BMB: the problem with the data may just be that there's not much
## clustering.  There are some fairly strong *correlations*, but these
## are not clusters ... e.g.
## ggpairs(mtcars)
pairs(mtcars,gap=0,cex=0.5)
corrplot::corrplot.mixed(cor(mtcars),upper="ellipse")

## If you need another method to pick the variables, then the method
## you've chosen may not be good for high-dimensional analysis of that
## data set!
