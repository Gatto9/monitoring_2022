# “Combustion is a complex process in which fuel is heated, ignites, and oxidizes rapidly, giving off heat in the process. 
# Fire is a special case of combustion—self-perpetuating combustion characterized by the emission of heat and accompanied by flame and/or smoke. 
# With fire, the supply of combustible fuel is controlled by heat given off during combustion” 
#
# I would like to see the vegetation changes of the Calabrian aspromonte after the summer, caused by self-igniting forest fires
# I'd like to detect the emission of CO2 in the summer period for these fires 
# I want to discuss about the causes and how to prevent or manage the fires in time
# I can detect the temperature during that period
# thank to special data i can see the smoke plumes of these fires

# install all the package you need 

# install.packages("raster")
# install.packages("rgdal")
# install.packages("RStoolbox")
# install.packages("ggplot2")
# install.packages("viridis")
# install.packages("ncdf4")
# install.packages("patchwork")

library(patchwork)
library(raster)
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(viridis)
library(ncdf4)


setwd("/Users/macdisimonegatto/Desktop/lab/project")

# i'm curious to see the cover fire in calabrian region during the 2021 summer
fire <- raster("c_gls_BA300_202008010000_GLOBE_S3_V3.0.1.nc")

cl <- colorRampPalette(c('red','green','yellow'))(100) 


# crop the file and take the south italy images
ext <- c(15.5, 18, 37.7, 40)
fire_cropped <- crop(fire, ext)
plot(fire_cropped)
plot(fire_cropped, col=cl)

###########
#NDVI 
library(patchwork)
library(raster)
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(viridis)
library(ncdf4)
setwd("/Users/macdisimonegatto/Desktop/lab/project")

rlist <- list.files(pattern="NDVI")
rlist
# [1] "c_gls_NDVI300_202007210000_GLOBE_PROBAV_V1.0.1.nc" 
# [2] "c_gls_NDVI300_202008010000_GLOBE_PROBAV_V1.0.1.nc"
# [3] "c_gls_NDVI300_202008110000_GLOBE_PROBAV_V1.0.1.nc"

list_rast <- lapply(rlist, raster)
# list_rast

# [[1]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_202007210000_GLOBE_PROBAV_V1.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333M 
# zvar       : NDVI 

# [[2]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_202008010000_GLOBE_PROBAV_V1.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333M 
# zvar       : NDVI  

# [[3]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_202008110000_GLOBE_PROBAV_V1.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333M 
# zvar       : NDVI 

vegetation <- stack(list_rast)
# vegetation

#class      : RasterStack 
#dimensions : 47040, 120960, 5689958400, 3  (nrow, ncol, ncell, nlayers)
#resolution : 0.00297619, 0.00297619  (x, y)
#extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
#crs        : +proj=longlat +datum=WGS84 +no_defs 
#names      : Normalized.Difference.Vegetation.Index.333M.1, Normalized.Difference.Vegetation.Index.333M.2, Normalized.Difference.Vegetation.Index.333M.3 


a <- vegetation$Normalized.Difference.Vegetation.Index.333M.1
b <- vegetation$Normalized.Difference.Vegetation.Index.333M.2
c <- vegetation$Normalized.Difference.Vegetation.Index.333M.3 

ext <- c(15.5, 18, 37.7, 40)

cveg <- crop(a, ext)
cveg1 <- crop(b, ext)
cveg2 <- crop(c, ext)

par(mfrow=c(1,3))
plot(cveg)
plot(cveg1)
plot(cveg2)
plot(Cvegdif)
difcl <- colorRampPalette(c("darkblue","yellow","red","black"))(100)


Cvegdif<-cveg-cveg1-cveg2

napa <- unsuperClass(cveg, nClasses=2)
napa
# *************** Map ******************
# $map
# class      : RasterLayer 
# dimensions : 772, 840, 648480  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : 15.49851, 17.99851, 37.70089, 39.99851  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : memory
# names      : layer 
# values     : 1, 2  (min, max)
plot(napa$map)
