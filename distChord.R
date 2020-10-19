

library(readr)
distChord <- read_csv("distChord.csv")
View(distChord)

# load igraph library and create adjacency matrix
library(igraph)
distChordmx2 <- as.matrix(as_adjacency_matrix(graph_from_data_frame(distChord), attr = "Acres", names = T))
distChordmx2<- distChordmx2[c(1:8), c(9:13)] %>% t()

# load chorddiag lobrary and create cord diagram
library(chorddiag)
distChord <- chorddiag(data = distChordmx2,
                           type = "bipartite",
                           groupnamePadding = 10,
                           groupPadding = 3,
                           groupColors = c("#ffffe5","#fff7bc","#fee391","#fec44f","#fe9929","#32784f","#cc4c02","#8c2d04", "#32784f"),
                           groupnameFontsize = 12,
                           showTicks = FALSE,
                           margin = 170,
                           tooltipGroupConnector = "    &#x25B6;    ",
                           chordedgeColor = "#B3B6B7")
distChord 


library(htmlwidgets)
saveWidget(distChord , file = "distChord .html")




