install.packages(raster)
install.packages(rgdal)
install.packages(RStoolbox)
install.packages(ggplot2)
install.packages(viridis)

library(raster)
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(viridis)


setwd("/Users/macdisimonegatto/Desktop/lab/project")

fire <- raster("c_gls_BA300_202008010000_GLOBE_S3_V3.0.1.nc")

cl <- colorRampPalette(c('red','yellow','green','black'))(100) 


# crop the file and take the south italy images
ext <- c(15.5, 18, 37.7, 40)
fire_cropped <- crop(fire, ext)
plot(fire_cropped)
plot(fire_cropped, col=cl)


