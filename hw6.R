##install.packages('tourr')
##install.packages('ash')
library(tourr)
library(ash)

data <- mtcars[,c("cyl","gear","carb")]

animate(data, tour_path=grand_tour(), display=display_xy())
##not sure why I'm getting two plots
##we had talked about some of the points being negative, but
##what I think is happening is the axis is in the centre of the points
##and so it appears that some points are negative when in fact they
##are just smaller than the mean.
##From this graph, we can see some evidence of clumping, but I think it would be 
##good to get way more data points to see if this is the case.
