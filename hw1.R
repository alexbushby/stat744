## BMB: please **don't** put install.packages() in scripts -- this
##   decision should be left to the user.  If you must, comment it out
## install.packages("tidyverse")
library(tidyverse)
library(ggplot2) ## BMB: this is included in tidyverse(), so redundant
theme_set(theme_bw())
library(readr)   ## ditto
library(dplyr)   ## ditto
library(tidyr)   ## ditto
library(GGally)  

## BMB: iris.csv isn't in HW1/
dat <- read_csv("iris.csv")

## BMB: you might not need explicit group=Species ; the default
##  behaviour would work OK here
gg1 <- (
    ggplot(dat, aes(x = Petal.Length, y = Petal.Width, group = Species)) +
    geom_point(aes(shape = Species, color = Species), size = 1.5) + 
    scale_shape_manual(values = c(1, 3, 6)) + 
    labs(x = "Petal Length", y = "Petal Width")
)

print (gg1) 

##for the gg1 plot, I decided to change the default shape of the points per Rauser's suggestion (as seeing different shapes and different colours is always better). I also set the size to be large enough so that it was clear, but small enough that the points didn't overpower the plot.

## BMB: if you put color=Species in the main ggplot() specification,
##  you wouldn't need to repeat it here
gg2 <- (
    gg1 + 
    geom_smooth(method = "lm", aes(color = Species, fill = Species))
)

print(gg2) 

##one thing I would try and change from the gg2 plot would be to try and make the lines less dark (I've looked into it and I can't seem to find a way to do that... any suggestions?) as I feel the darkness of the lines really takes away from the points on the plot.


## BMB: you have some repeated points here which are obscured.
##  geom_jitter() would work, but I prefer stat_sum(). You can
## adjust the range of sizes via scale_size_continuous(limits=c(min,max))
## if you want to ...

ggplot(dat, aes(x = Petal.Length, y = Petal.Width, group = Species)) +
    stat_sum(aes(shape = Species, color = Species))+
    scale_shape_manual(values = c(1, 3, 6)) + 
    labs(x = "Petal Length", y = "Petal Width")



## BMB: you could make the lines thinner:
    gg1 + 
    geom_smooth(method = "lm", aes(color = Species, fill = Species),
                size=0.5)

## BMB: I would normally make the lines lighter by adjusting alpha-transparency,
## but that would actually be a bit of a nuisance since
## the 'alpha' control in geom_smooth() is geared to adjusting the
## transparency of the confidence regions.
## The other way you could do this is with something like
##  the base R adjustcolor() function, but it would be fussy ...

gg3 <- (
    ggplot(dat,aes(x = Species,y = Petal.Length)) + 
    ## geom_point(size = 1,alpha = 1, aes(colour = Species, shape=Species)) +
    ## BMB: geom_dotplot uses point types that have both a colour (edge)
    ##   and a fill
    geom_dotplot(dotsize = 0.5,alpha = 1,
                 colour="gray",
                 aes(fill=Species),
                 binaxis="y",stackdir="center",) +
    geom_boxplot(outlier.shape = 17, outlier.color = "black", fill=NA) +
    labs(y = "Petal Length") + 
    scale_shape_manual(values = c(1, 3, 6)) ##how can I change the different shapes of the Species in this case?
    ## BMB: not sure what you want to adjust:
    ##   - shape of geom_point() ? (use shape=Species in geom_point)
    ##   - shape of outlier points? (use shape=Species in geom_boxplot)
    ## scale_shape_manual will only work if you've specified a shape
    ##  mapping somewhere in the plot
    ## BMB:  you have lots of repeated values, I decided to use
    ##  geom_dotplot() on them
    + expand_limits(x=-0.5)
)

print(gg3)
##Rauser brought up a good point about the gridlines and how one should be careful with them. The default for these three graphs have been a nice faint line so I haven't had to change that.
##I decided to make the outliers for the boxplots a different shape and colour to make them more obvious.
##Also, somehow I managed to make the fill of the boxplot white, so you can't see the points the occur in the boxplot. How do I reverse this?
##   BMB: either use fill=NA (as above) *or* change the order of the geoms

