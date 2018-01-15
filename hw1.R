install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
theme_set(theme_bw())
library(readr)  
library(dplyr)   
library(tidyr)   
library(GGally)  

dat <- read_csv("hw1/iris.csv")

gg0 <- (ggplot(dat,aes(Petal.Length, Petal.Width))
        + geom_point()
)

print(gg0
      + geom_smooth() 
      + geom_smooth(method="lm",col="red",fill="red") 
)


gg1 <- (ggplot(cdat,aes(Petal.Length,Petal.Width,colour=Species))
        + geom_point(aes(shape=Species),size=4)
)

gg2 <- (gg1
        + geom_smooth(method="lm",
                      aes(color=Species,fill=Species))
)
print(gg2)

ggplot(dat,aes(Species,Petal.Length)) + geom_boxplot()+
  geom_point(size=2,alpha=0.2) 
