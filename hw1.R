install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
theme_set(theme_bw())
library(readr)  
library(dplyr)   
library(tidyr)   
library(GGally)  

dat <- read_csv("hw1/iris.csv")

gg1 <- (
    ggplot(dat, aes(x = Petal.Length, y = Petal.Width, group = Species)) +
    geom_point(aes(shape = Species, color = Species), size = 1.5) + 
    scale_shape_manual(values = c(1, 3, 6)) + 
    labs(x = "Petal Length", y = "Petal Width")
)

print (gg1) 

##for the gg1 plot, I decided to change the default shape of the points per Rauser's suggestion (as seeing different shapes and different colours is always better). I also set the size to be large enough so that it was clear, but small enough that the points didn't overpower the plot.

gg2 <- (
    gg1 + 
    geom_smooth(method = "lm", aes(color = Species, fill = Species))
)

print(gg2) 

##one thing I would try and change from the gg2 plot would be to try and make the lines less dark (I've looked into it and I can't seem to find a way to do that... any suggestions?) as I feel the darkness of the lines really takes away from the points on the plot.

gg3 <- (
    ggplot(dat,aes(x = Species,y = Petal.Length)) + 
    geom_point(size = 1,alpha = 1, aes(colour = Species)) +
    geom_boxplot(outlier.shape = 17, outlier.color = "black") +
    labs(y = "Petal Length") + 
    scale_shape_manual(values = c(1, 3, 6)) ##how can I change the different shapes of the Species in this case? 
)

print(gg3)
##Rauser brought up a good point about the gridlines and how one should be careful with them. The default for these three graphs have been a nice faint line so I haven't had to change that.
##I decided to make the outliers for the boxplots a different shape and colour to make them more obvious.
##Also, somehow I managed to make the fill of the boxplot white, so you can't see the points the occur in the boxplot. How do I reverse this?