# install.packages("sdm")
# install.packages("rgdal")
# install.packages(c("rgdal", "sdm") # an array to install different packages

library(raster)
library(rgdal)
library(sdm)

# species 
# systemfile: this function is meant to intercept calls to system.file, so that it behaves well with packages loaded by devtools.

file <- system.file("external/species.shp" , package="sdm" 
file

# "/Library/Frameworks/R.framework/Versions/4.1/Resources/library/sdm/external/species.shp"
# we are predicting the presence of a species in a certain period

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

# I can use the lapply function with the raster function but in this case it is not needed since the data are inside the package and they have an asc extension

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

                    
# in the theroretical slide of SDMs we should use individuals of a scpecies and put
preds
# These are the predictors: elevation, precipitation, temperature, vegetation
# explain what are the data: use the sdmdata from sdm package
# predictors can also named as explenatory variable

datasdm <- sdmData(train= species, predictors= preds)

# Fit and evaluate species distribution models
# sdm(formula, data, methods,...) the argument of sdm function
# sdm: Fit and evaluate species distribution models

# Tilde is used to separate the left- and right-hand sides in a model formula.

# model
m1 <- sdm(Occurrence~temperature + elevation + precipitation + vegetation, data=datasdm, methods="glm") # formula cannot wrote cause is default

# what we have to do is a linear model like y= a(interseption) + b0x0 + b1 + x1...bnxn where the interseption is multiplied by the predictors
# we take/check the formula of this model and we can predict where we can find the species based on this formula
# prediction: is dividing our area in pixels and for each pixel based on the resolution of the input
## predictors for each pixel it will report the probability of finding a certain species

# prediction: map prabability
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(presences, pch=19) 

# pch is any kind of point character type
# in this case I can see some species predicted in a certain part with low probability to find a species
## this due to the usage of some predictors, but maybe there may be some additional predictors that we are not considering
### that's why we may have some small errors in a certain part

# add to the stack
s1 <- stack(preds, p1)
plot(s1, col=cl)

pdf("Presence prediction of a certain species")
s1 <- stack(preds, p1)
plot(s1, col=cl)
dev.off()

# It is possibile to change the name of the images with the name() function
name(s1) <- c('elevation', 'precipitation', 'temperature', 'vegetation', 'model')









