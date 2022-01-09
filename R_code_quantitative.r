

install.packages("ggplot2")
install.packages("RStoolbox")
library(RStoolBox)
library(raster)
library(RStoolbox) # classification
library(ggplot2)
 
setwd("/Users/macdisimonegatto/Desktop/lab")
rlist <- list.files(pattern="defor")
rlist
[1] "defor1.jpg" "defor2.jpg"
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


l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, b=2, g=3, stretch="lin")
plot(1992[[1]])
 
l1992c <- unsuperClass(l1992, nClasses=2)
l1992c <- unsuperClass(l1992, nClasses=2)
l1992c
# unsuperClass results

*************** Map ******************
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
plot(l1992c$map)
dev.off()

freq(l1992c$map)
#     value  count
# [1,]     1 305601
# [2,]     2  35691

total <- 341292
propagri <- 35619/total
propforest <- 305601/total
propagri
# [1] 0.1043652 # 0.10 is the percentage to the total, about the agriculture
propforest
# [1] 0.8954239 # 0.90 is the percentage of forest to the total

# cover: Replace NA values with values of other layers
cover <- c("forest", "agriculture")
prop1992 <- c(propforest, propagri) # here we had create a proportion 
prop1992
# [1] 0.8954239 0.1043652


proportion1992 <- data.frame(cover, prop1992)
proportion1992

#         cover  prop1992
# 1      forest 0.8954239
# 2 agriculture 0.1043652














