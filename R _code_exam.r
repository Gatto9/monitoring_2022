# “Combustion is a complex process in which fuel is heated, ignites, and oxidizes rapidly, giving off heat in the process. 
# Fire is a special case of combustion—self-perpetuating combustion characterized by the emission of heat and accompanied by flame and/or smoke. 
# With fire, the supply of combustible fuel is controlled by heat given off during combustion” 
#
# I would like to see the vegetation changes of the Calabrian aspromonte after the summer, caused by self-igniting forest fires
# I'd like to detect the emission of CO2 in the summer period for these fires 
# I want to discuss about the causes and how to prevent or manage the fires in time
# I can detect the temperature during that period
# thank to special data i can see the smoke plumes of these fires

install.packages(raster)
install.packages(rgdal)
install.packages(RStoolbox)
install.packages(ggplot2)
install.packages(viridis)
install.packages(ncdf4)
install.packages(patchwork)

library(patchwork)
library(raster)
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(viridis)
library(ncdf4)


setwd("/Users/macdisimonegatto/Desktop/lab/project")

fire <- raster("c_gls_BA300_202008010000_GLOBE_S3_V3.0.1.nc")

cl <- colorRampPalette(c('red','yellow','green','black'))(100) 


# crop the file and take the south italy images
ext <- c(15.5, 18, 37.7, 40)
fire_cropped <- crop(fire, ext)
plot(fire_cropped)
plot(fire_cropped, col=cl)


