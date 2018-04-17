library(sunburstR)

library(dplyr)
library(d3heatmap)
library(GGally)

mt2 <- mtcars[order(mtcars$carb),]

mt3 <- mtcars[,5:6]

d3heatmap(mt2, scale = "column", colors = "Greens", dendrogram = "none")
d3heatmap(mtcars, scale = "column", colors = "Greens", dendrogram = "none")
d3heatmap(mt3, scale = "column", colors = "Greens", dendrogram = "none")


##is there a better way to select variables to choose in the heatmap?
##too many variables included seems to not tell any information.
##from mt3 you can tell that a lower real axle ratio (drat) 
##gives a higher wt (weight)
