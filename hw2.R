library(tidyverse)
theme_set(theme_bw())
library(readr)  
library(dplyr)   
library(tidyr)   
library(GGally) 
library(RColorBrewer)
library(cowplot)
library(directlabels)

##I believe the graphic is trying to show the trend of diseases over time. 
##More importantly, it's also showing the impact vaccines have on diseases. 
##They portraying this information in the form of circles, using the concept of area and 
##showing that when a vaccine is introduced, the "areas" of the circles decrease, 
##which indicates that the number of diseases have gone down.

dat<-read_csv("vaccine.csv")
dat1 <- subset(dat, vaccine!=FALSE) 
dat1<- dat1[-c(4,9,12),] ##removing rows with repetitive diseases
dat1<-dat1[,-c(1, 5,6,7,8)]
dat1[5,1] = 152209 ##the reason why I am doing this is so that the vaccine for mumps 
##starts at a value where the number of cases is not 0.
dat1[5,3] = 1968


gg1<- (ggplot(dat, aes(x=year, y=cases/1e5, colour=disease)) + 
        geom_line() +
        geom_point(data=dat1, aes(x=year, y=cases/1e5, colour=disease), shape=17,size=3) + 
        ylab("Cases (in 100,000)") + 
        scale_x_continuous(breaks = seq(1945,2015, by=10))
)

gg1



gg2<- (ggplot(dat, aes(x = year, y = disease, size = cases/1e5)) + 
         geom_point(shape = 21, colour = "black", fill = "#40b8d0") + 
         scale_x_continuous(breaks = seq(1945, 2015, by  = 10)) +
         ylab("Disease") + 
         xlab("Year") + 
         labs(size = "Cases (in 100,000)") + 
         scale_size_area(max_size = 15) + 
         geom_point(data=dat1,aes(x=year, y=disease, size=cases/1e5), shape = 21, colour = "black", fill = "yellow" )
)

##sorry I'm not very creative!

gg2
       
##I would say my first graph is much better than the second graph
## or the graph seen in the original display. Although the original display is creative
## and interactive, one thing I do not like about it is that the graphics don't fit on 
## one page (i.e. you have to scroll to see the results). I believe my graph is better because 
## all the diseases are on one graph (however, you could split it up by using
## facet_wrap) and all the information can be seen at one time. You can also observe
## and understand which diseases took a huge toll on US during particular time periods, whereas
## I find with the areas (using circles), I find it's not as obvious. Another thing that I find 
## useful about the first graph is that you can see the dynamics of the individual diseases a 
## lot better than the circles (the rise and fall measles before 1965 is not clear in the
## second graph).