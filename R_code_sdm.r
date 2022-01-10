# install.packages("sdm")
# install.packages("rgdal")
# install.packages(c("rgdal", "sdm") # an array to install different packages

library(raster)
library(rgdal)
library(sdm)

# species 
# systemfile: his function is meant to intercept calls to system.file, so that it behaves well with packages loaded by devtools.

file <- system.file("external/species.shp" , package="sdm" 
file

# "/Library/Frameworks/R.framework/Versions/4.1/Resources/library/sdm/external/species.shp"


species <- shapefile(file) # exatcly as the raster function for raster files
species

# class       : SpatialPointsDataFrame 
# features    : 200 
# extent      : 110112, 606053, 4013700, 4275600  (xmin, xmax, ymin, ymax)
# crs         : +proj=utm +zone=30 +datum=WGS84 +units=m +no_defs 
# variables   : 1
# names       : Occurrence 
# min values  :          0 
# max values  :          1 


# how many occurence are there?
species[species$Occurrence == 1,]    # this is a subset

# class       : SpatialPointsDataFrame 
# features    : 94 
# extent      : 110112, 593393, 4013700, 4275600  (xmin, xmax, ymin, ymax)
# crs         : +proj=utm +zone=30 +datum=WGS84 +units=m +no_defs 
# variables   : 1
# names       : Occurrence 
# min values  :          1 
# max values  :          1 

# how many occurence are there? 

presences <- species[species$Occurrence == 1,]
absences <- species[species$Occurrence == 0,]

# plot
plot(species, pch= 19)
plot(presences, pch= 19, col='blue')
plot(absences, pch= 19, col='red')

# we want to plot both the presences and absences

plot(presences, pch= 19, col='blue')
points(absences, pch= 19, col='red')

# predictors: look at the path

path <- system.file("external", package="sdm")
path 

lst <- list.files(path=path,pattern='asc',full.names = TRUE)

# we can use the lapplu function eoth the raster function but in this 
preds <- stack(lst)
preds

cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl)
points(presences, pch=19)

plot(preds$temperature, col=cl)
points(presences, pch=19)

plot(preds$vegetation, col=cl)
points(presences, pch=19)

plot(preds$precipitation, col=cl)
points(presences, pch=19)



