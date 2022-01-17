# R_code for ice melt in Greenland


# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma
library(raster)
library(ggplot2)
library(RStoolbox)
library(patchwork)
library(viridis)

setwd("/Users/macdisimonegatto/Desktop/lab/greenland")


# imoport all the file in a difficult way (handwritten)
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# par and plot all the files, lazy stuff
par(mfrow= c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# or i can do the job in a simple way, creating a list of files:

rlist <- list.files(pattern = "lst")
rlist
## [1] "lst_2000.tif" "lst_2005.tif" "lst_2010.tif" "lst_2015.tif"


# with lapply function i give a function to the list that i have choosen and name the object
import <- lapply(rlist,raster)
import

## [[1]]
## class : RasterLayer
## dimensions : 1913, 2315, 4428595 (nrow, ncol, ncell)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## source : lst_2000.tif
## names : lst_2000
## values : 0, 65535 (min, max)

## [[2]]
## class : RasterLayer
## dimensions : 1913, 2315, 4428595 (nrow, ncol, ncell)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## source : lst_2005.tif
## names : lst_2005
## values : 0, 65535 (min, max)

## [[3]]
## class : RasterLayer
## dimensions : 1913, 2315, 4428595 (nrow, ncol, ncell)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## source : lst_2010.tif
## names : lst_2010
## values : 0, 65535 (min, max)

## [[4]]
## class : RasterLayer
## dimensions : 1913, 2315, 4428595 (nrow, ncol, ncell)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## source : lst_2015.tif
## names : lst_2015
## values : 0, 65535 (min, max)

## this VALUES means that are sixty bit images

TGr <- stack(import)
TGr

## class : RasterStack
## dimensions : 1913, 2315, 4428595, 4 (nrow, ncol, ncell, nlayers)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## names : lst_2000, lst_2005, lst_2010, lst_2015
## min values : 0, 0, 0, 0
## max values : 65535, 65535, 65535, 65535

cl <- colorRampPalette(c("blue", "light blue" , "pink" , "yellow"))(100)
plot(TGr)

# ggplot all the images
ggplot() + geom_raster(TGr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2000")
ggplot() + geom_raster(TGr$lst_2005, mapping = aes(x=x, y=y, fill=lst_2005)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2005")
ggplot() + geom_raster(TGr$lst_2010, mapping = aes(x=x, y=y, fill=lst_2010)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2010")
ggplot() + geom_raster(TGr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2015")

# then assign a name to the ggplot and use the patchwork's function to easy plot

p1 <- ggplot() + geom_raster(TGr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2000")
p2 <- ggplot() + geom_raster(TGr$lst_2005, mapping = aes(x=x, y=y, fill=lst_2005)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2005")
p3 <- ggplot() + geom_raster(TGr$lst_2010, mapping = aes(x=x, y=y, fill=lst_2010)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2010")
p4 <- ggplot() + geom_raster(TGr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma")+ ggtitle("LST in 2015")

# patchwork
p1 + p2
p1 / p3 # etc...

# plotting frequency distribution of data
par(mfrow=c(1,2))
hist(TGr$lst_2000)
hist(TGr$lst_2015)

# comparing all the data
par(mfrow=c(2,2)
hist(TGr$lst_2000)
hist(TGr$lst_2005)
hist(TGr$lst_2010)
hist(TGr$lst_2015)

#dev.off()
# stats in a simple manner
plot(TGr$lst_2000, TGr$lst_2015)

dev.off()
plot(TGr$lst_2010, TGr$lst_2015, xlim=c(12500,25000), ylim=c(12500,15000))
abline(0,1, col="red")
     
# make a plot with all the histograms and all the regressions foe all the variables
par(mfrow=c(4,4))
hist(TGr$lst_2000)
hist(TGr$lst_2005)
hist(TGr$lst_2010)
hist(TGr$lst_2015)
plot(TGr$lst_2010, TGr$lst_2015, xlim=c(12500,25000), ylim=c(12500,15000))
plot(TGr$lst_2010, TGr$lst_2000, xlim=c(12500,25000), ylim=c(12500,15000))
#... put al the data inside

# this is the most simple way to do a comparison between data cause we made a stack previously and we can plot altogheter
pairs(tgr)



















