


library(networkD3)
library(dplyr)
library(readr)
library(dplyr)

data <- read_csv("bps2evt.csv")

nodes <- data.frame(
  name=c(as.character(data$source), 
         as.character(data$target)) %>% unique())


data$IDsource <- match(data$source, nodes$name)-1 
data$IDtarget <- match(data$target, nodes$name)-1

# Make the Network
snky2 <- sankeyNetwork(Links = data, 
                       Nodes = nodes,
                       Source = "IDsource", 
                       Target = "IDtarget",
                       Value = "value", 
                       NodeID = "name", 
                       fontSize=14,
                       iterations = 0,
                       sinksRight=FALSE)

snky2

library(htmlwidgets)
saveWidget(snky2,  "snky.html")