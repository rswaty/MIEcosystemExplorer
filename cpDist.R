#tryCircle packing with cpDist

library(circlepackeR)
library(data.tree)
library(readr)


# Change the format. This use the data.tree library. This library needs a column that looks like root/group/subgroup/..., so I build it

data <- read_csv("cpDist.csv")
View(data)


data$pathString <- paste("world", data$BPS_NAME, data$Disturbed, data$DIST_NAME, sep = "/")
population <- as.Node(data)

p <- circlepackeR(population, size = "TotAcresDist", color_min = "hsl(153, 66%, 76%)", color_max = "hsl(153, 100%, 15%)")
p


# save the widget
library(htmlwidgets)
saveWidget(p,  "cpDist.html",selfcontained = TRUE)
