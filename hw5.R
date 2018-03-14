library(tidyverse)
library(plotly)

dat1<- mtcars

pp1 <- plot_ly(dat1, x = ~wt, y = ~mpg, color = ~gear, type = "scatter") %>%
  layout(
    title = "Cars",
      xaxis = list(title = 'Weight'),
      yaxis = list(title = 'Miles Per Gallon')
    )

pp1

##You can use the zoom feature as well as the mouseover feature (identification) \
##using plotly. I have a question: When I do mouseover a point, it'll say the coordinate,
##and then trace 0. How do I get rid of trace 0? Thanks!!