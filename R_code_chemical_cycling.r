R code for chemical cycling study
time series of NO2 change in Europe during the firs lockdown

library(raster)

# Set the working directory
# setwd("~/lab/en") # Linux
# setwd("C:/lab/en") # windows
setwd("/Users/macisimonegatto/Desktop/lab/en") # mac

en01 <- raster("EN_0001.png")
# what is the range of the data

cl <- colorRampPalette(c("red","orange","yellow"))(100) 

# plot the NO2 values of January 2020 by the cl palette

plot(en01, col=cl)

# Exercise: import the end of March NO2 and plot it

en13 <- raster("EN_0013.png")
plot(en13, col=cl)

# Build a multiframe window with 2 rows and 1 column with the par function
par(mfrow=c(2,1))
plot(en01, col=cl)
plot(en13, col=cl)

# Import all the images

EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# plot all the data all togheter

par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)


# stacking vectors concatenate multiple vectors into a single vector along
## with a factor indicating where each obserbation originated.
### Unstating reverses this operation
# we use the stack function to create a plot of all the images

EN <- stack(EN01, EN02, EN03, EN04, EN05, EN06, EN07, EN08, EN09, EN10, EN11, EN12, EN13)

# plot the stack altogher

plot(EN, col=cl)

# plot only the first image from the stack
# check the stack names calling back the stack's name (EN)

EN
## class : RasterStack
## dimensions : 432, 768, 331776, 13 (nrow, ncol, ncell, nlayers)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## names : EN_0001, EN_0002, EN_0003, EN_0004, EN_0005, EN_0006, EN_0007, EN_0008, EN_0009, EN_0010, EN_0011, EN_0012, EN_0013
## min values : 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
## max values : 255, 255, 255, 255, 255, 255, 255, 255, 255, 255

plot(EN$EN_0001, col=cl)

# let's do somethings with RGB
plotRGB(EN, r=1, g=7, b=13, stretch="lin")

# image from sentinel-5P Nitrogen Dioxide tropospheric column 

# in the red we put the very first begining of lockdown, jaunary image
# in the green the mid part of lockdown, in febraury. all the part which will become red will represent the highest value of NO2 in febraury
# in the blue we put the end of the lockdown, march everything which will become blue will be with highest value of NO2 in the 13nt image
# the white on the image represent all the time that NO2 was present in whole lockdown, from jaunary to march.
# in the pianura padana remain the highest value of NO2 during the entire lockdown


# importing all the data together with the lapply function

rlist <- list_file(pattern="EN") 
rlist

## [1] "EN_0001.png" "EN_0002.png" "EN_0003.png" "EN_0004.png" "EN_0005.png" "EN_0006.png"
## [7] "EN_0007.png" "EN_0008.png" "EN_0009.png" "EN_0010.png" "EN_0011.png" "EN_0012.png"
## [13] "EN_0013.png"

list_rast <-lapply(raster, rlist)
list_rast

## [[1]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0001.png
## names : EN_0001
## values : 0, 255 (min, max)
##
##
## [[2]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0002.png
## names : EN_0002
## values : 0, 255 (min, max)
##
##
## [[3]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0003.png
## names : EN_0003
## values : 0, 255 (min, max)
##
##
## [[4]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0004.png
## names : EN_0004
## values : 0, 255 (min, max)
##
##
## [[5]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA

## source : EN_0005.png
## names : EN_0005
## values : 0, 255 (min, max)
##
##
## [[6]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0006.png
## names : EN_0006
## values : 0, 255 (min, max)
##
##
## [[7]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0007.png
## names : EN_0007
## values : 0, 255 (min, max)
##
##
## [[8]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0008.png
## names : EN_0008
## values : 0, 255 (min, max)
##
##
## [[9]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0009.png
## names : EN_0009
## values : 0, 255 (min, max)
##
##
## [[10]]

## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0010.png
## names : EN_0010
## values : 0, 255 (min, max)
##
##
## [[11]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0011.png
## names : EN_0011
## values : 0, 255 (min, max)
##
##
## [[12]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0012.png
## names : EN_0012
## values : 0, 255 (min, max)
##
##
## [[13]]
## class : RasterLayer
## band : 1 (of 3 bands)
## dimensions : 432, 768, 331776 (nrow, ncol, ncell)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## source : EN_0013.png
## names : EN_0013
## values : 0, 255 (min, max)




EN_stack <- stack(list_rast)
EN_stack

## class : RasterStack
## dimensions : 432, 768, 331776, 13 (nrow, ncol, ncell, nlayers)
## resolution : 1, 1 (x, y)
## extent : 0, 768, 0, 432 (xmin, xmax, ymin, ymax)
## crs : NA
## names : EN_0001, EN_0002, EN_0003, EN_0004, EN_0005, EN_0006, EN_0007, EN_0008, EN_0009, EN_0010, EN_0011, EN_0012, EN_0013
## min values : 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
## max values : 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255


cl <- colorRampPalette(c('red','orange','yellow'))(100) 

plot(EN_stack, col=cl)


 # Exercise plot only the first image of the stack
plot(EN_stack$EN_0001, col=cl)

# difference the first image with the last 

ENdif <- EN_stack$EN_0001 - EN_stack$EN_0013
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(ENdif, col=cldif)

# the higest change in the two sets are in red, so all the red part has big change 
## all the blue part where more or less have a countrary change so mantaining hard of NO2.
### this is the file terrify image.
#### it is nice that the bar showing me the highest value in jaunary are in red 
###### the highest values in march are in blue



# automated processing source function
source("name_of_your_file.r")
# we use this function to recall a code from a folder stored in our computer or from the web



