## =======================================================================
## Climate classification - color key split in two, 
## and countries added
## implementation: Karline Soetaert
## =======================================================================

# these data are from 
url <- "http://koeppen-geiger.vu-wien.ac.at/shifts.htm"

# space for legend
par(mar = c(11, 4, 4, 2), oma = c(2, 0, 0, 0))

library(OceanView)
library(maps)
library(readxl)
world <- map("world", plot = FALSE)
state <- map("state", plot = FALSE)

# These data are in long format
Dat <- read_excel("/Users/Nicholas/Documents/R/Koppen-Geiger.xlsx", col_names = TRUE)
head(Dat)

Names <- levels (Dat[,3])
head (Names)

# create crosstable
Dat.cross <- OceanView::db2cross(Dat, row = 2, col = 1, value = 3)
dim(Dat.cross$z)

# Color scheme, asd according to the climate classes
Col <- c(ramp.col(c("red", "darkred"), n = 4),           #A..
         ramp.col(c("yellow", "orange"), n = 4),         #B..
         ramp.col(c("lightgreen","darkgreen"), n = 9),   #C..
         ramp.col(c("lightblue", "darkblue"), n = 11),   #D..
         "lightgrey", "darkgrey")                        #E..

# Figure, with climate classes; shade to increase resolution          
image2D(x = Dat.cross$x, y = Dat.cross$y, z = Dat.cross$z, 
        col = Col, shade = 0.1, colkey = FALSE, cex.axis = 0.8, 
        mgp = c(2, 1, 0), cex.lab = 0.8, xlab = "longitude", ylab = "latitude",  
        main = "World Map of Koppen-Geiger Climate Classification")

# color key split in two parts
colkey (side = 1, col = Col[1:15], clim = c(0, 15),
        at = seq(0.5, 14.5, by = 1), width = 0.5, addlines = TRUE,
        labels = Names[1:15], add = TRUE, cex.axis = 0.7)

colkey ( side = 1, col = Col[16:30], clim = c(15, 30),
         at = seq(15.5, 29.5, by = 1), width = 0.5, addlines = TRUE,
         labels = Names[16:30], add = TRUE, cex.axis = 0.7, dist = 0.10) 
lines2D(x = world$x, y = world$y, add = TRUE)

# legend added   
legend("bottomleft", bg = "white", , cex = 0.8, title = "Main climate",
       legend = c("A: equatorial", "B: arid", "C: warm", "D: snow", "E: polar")) 

AddSource(url)