dat1<-(read_csv("data1.csv")
      %>% select(-c(Domain, Element, Item))
      %>% mutate(fYear = factor(Year),
                 value_mtons = Value/1e3,
                 Country = reorder(Country, -Value))
      )

View(dat1)

library(readr)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
display.brewer.all()

gg1 <- (ggplot(dat1, aes(x = Year, y = value_mtons, colour = Country)) + 
   geom_line() + 
   scale_x_continuous(breaks = seq(1994,2006, by=2)) + 
     scale_y_log10() + 
     labs(y = "Kilotons of Bananas") + 
     scale_color_brewer(palette = "Set3")
)

  
(ggplot(dat1, aes(x = fYear, y = Value, colour = Country, group = Country)) + geom_line())
    
direct.label(gg1 + expand_limits(x=1990) + theme_bw())
