# install.packages("raster")
# install.packages("ggplot2") # we will use this packages to make the classification
# install.packages("RStoolbox") # we will use this packages for the ggplot Function
# install.packages("gridExtra") # we will use this packages for multiframe ggplot
# install.packages("patchwork") # is to make it ridiculously simple to combine separate ggplots into the same graphic. 
# patchwork is providing mathematical operators for combining multiple plots.
library(raster)

library(RStoolbox) 
# classification: RStoolbox is a Collection of Remote Sensing Tools
# The RStoolbox package provides a set of functions which simplify performing standard remote sensing tasks in R. 
library(ggplot2) 
# ggplot can be used to declare the input data frame for a graphic
## specify the set of plot aesthetics intended to be common throughout all subsequent layers unless specifically overridden.
library(gridExtra)
# Provides a number of user-level functions to work with "grid" graphics, notably to arrange multiple grid-based plots on a page, and draw tables.
library(patchwork)
# patchwork' is a package that expands the API to allow for arbitrarily complex composition of plots by, among others, 
## providing mathematical operators for combining multiple plots.
setwd("/Users/macdisimonegatto/Desktop/lab")


rlist <- list.files(pattern="defor")
rlist
# [1] "defor1.jpg" "defor2.jpg"

list_rast <- lapply(rlist, brick)
list_rast

# [[1]]
# class      : RasterBrick 
# dimensions : 478, 714, 341292, 3  (nrow, ncol, ncell, nlayers)
# resolution : 1, 1  (x, y)
# extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
# crs        : NA 
# source     : defor1.jpg 
# names      : defor1.1, defor1.2, defor1.3 
# min values :        0,        0,        0 
# max values :      255,      255,      255 


# [[2]]
# class      : RasterBrick 
# dimensions : 478, 717, 342726, 3  (nrow, ncol, ncell, nlayers)
# resolution : 1, 1  (x, y)
# extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
# crs        : NA 
# source     : defor2.jpg 
# names      : defor2.1, defor2.2, defor2.3 
# min values :        0,        0,        0 
# max values :      255,      255,      255 

plot(list_rast[[1]])
plot(list_rast[[2]])
# R give back two impressive immages

# I give a name to the list and then i plotting the object
l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(1992[[1]])
                     

# Unsupervised clustering of Raster* data using kmeans clustering 
l1992c <- unsuperClass(l1992, nClasses=2)
l1992c
# unsuperClass results

# *************** Map ******************
# $map
# class      : RasterLayer 
# dimensions : 478, 714, 341292  (nrow, ncol, ncell)
# resolution : 1, 1  (x, y)
# extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
# crs        : NA 
# source     : memory
# names      : layer 
# values     : 1, 2  (min, max)

plot(l1992c$map)
dev.off()

freq(l1992c$map)          # Generate and format frequency tables from a variable or a table, with percentages and formatting options.
#     value  count
# [1,]     1 305601
# [2,]     2  35691

total <- 341292           # total pixels about the layer
propagri <- 35619/total
propforest <- 305601/total

propagri
# [1] 0.1043652 # ~ 0.10 is the percentage of the total, about the agriculture

propforest
# [1] 0.8954239 # ~ 0.90 is the percentage of forest on the total number of pixels

cover <- c("forest", "agriculture") # cover: Replace NA values with values of other layers
prop1992 <- c(propforest, propagri) # here we had create a proportion 
prop1992
# [1] 0.8954239 0.1043652

proportion1992 <- data.frame(cover, prop1992)
proportion1992
#         cover  prop1992
# 1      forest 0.8954239
# 2 agriculture 0.1043652


ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")


# let's do the same thing for 2006 image
# classification of 2006

l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
plot(2006[[2]])                                 # HERE GIVES ME AN ERROR

# Unsupervised classification

l2006c <- unsuperClass(l2006, nClasses=2)
l2006c

plot(l2006c$map)
# forest is the value number 1 (white)
# agriculture is the value number 2 (green)

# Frequencies
freq(l2006c$map)
#      value  count
# [1,]     1 178510
# [2,]     2 164216

# Proportion

total2006 <- 342726          # total pixels about the layer
propagri2006 <- 164216/total2006
propforest2006 <- 178510/total2006
propagri2006
# [1] 0.4791466
propforest2006
# [1] 0.5208534


# let's build a dataframe
cover <- c("forest", "agriculture")
prop1992 <- c(propforest, propagri)
prop2006 <- c(propforest2006, propagri2006)

proportion <- data.frame(cover, prop1992, prop2006)
proportion

p1 <- ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")  + ylim(0,1)
p2 <- ggplot(proportion1992, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white")  + ylim(0,1)
# + ylim(0,1) #we use this to give the same limit to the both graph


# Plot two graph with gridExtra package 

grid.arrange(p1, p2, nrow=1) 
# Once putting "nrows" in the grid.arrange function, which is actually widely used in other functions,
# it will read it as a piece outside of the ggplot. Hence, instead nrowS we will put NROW

# or with patchwork packages:
p1 +p2 
# that we see it soon in the next lesson below

######### End



# Another day, another story



# install.packages("raster")
# install.packages("ggplot2") # we will use this packages to make the classification
# install.packages("RStoolbox") # we will use this packages for the ggplot Function
# install.packages("gridExtra") # we will use this packages for multiframe ggplot
# install.packages("patchwork") 
library(raster)
library(RStoolbox) 
library(ggplot2) 
library(gridExtra)
library(patchwork) # Provides a number of user-level functions to work with "grid" graphics, notably to arrange multiple grid-based plots on a page, and draw tables.

setwd("/Users/macdisimonegatto/Desktop/lab")


rlist <- list.files(pattern="defor")
rlist
# [1] "defor1.jpg" "defor2.jpg"

list_rast <- lapply(rlist, brick)
list_rast
# [[1]] , # [[2]] # see the previous code on top of the page

# to declare the name of the list
l1992 <- list_rast[[1]]
l2006 <- list_rast[[2]]

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

# Create ggplot2 Raster Plots with RGB from 3 RasterLayers
# Calculates RGB color composite raster for plotting with ggplot2
ggRGB(l1992, r=1, g=2, b=3, stretch="lin")
ggRGB(l1992, r=1, g=2, b=3, stretch="hist") # in this particular image i can see any lines because the image is captured by a satellite, so this is not a photo but an image taken by a scanner
ggRGB(l1992, r=1, g=2, b=3, stretch="sqrt") # in this particular image i can see any lines because the image is captured by a satellite, so this is not a photo but an image taken by a scanner
ggRGB(l1992, r=1, g=2, b=3, stretch="log") # log is not the logarithm in base 10 but is the logarithm in base "e"(ln(e)) which the result is 4.0...



# patchwork

gp1 <- ggRGB(l1992, r=1, g=2, b=3, stretch="lin")
gp2 <- ggRGB(l1992, r=1, g=2, b=3, stretch="hist")
gp3 <- ggRGB(l1992, r=1, g=2, b=3, stretch="sqrt")
gp4 <- ggRGB(l1992, r=1, g=2, b=3, stretch="log")

gp1+ gp2 + gp3 + gp4


# multitemporal patchwork

gp1 <- ggRGB(l1992, r=1, g=2, b=3, stretch="lin")
gp5 <- ggRGB(l2006, r=1, g=2, b=3, stretch="log")

gp1 + gp5 # one beside the other
gp1 / gp5 # one on top of the oder




















