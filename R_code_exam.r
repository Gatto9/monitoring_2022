

# This is my job. Thank you for your whatching. My purpose today is analyze but specialy show a disaster that has been hidden from eyes of everybody.
# The flames have restarted in the Aspromonte Mountain around the San Luca Valley, a little land of 3hundred, where there are the Unesco heritage beech trees called Faggete Vetuste. 
# Ground teams from other italian regions have been deployed to the affected places, as well several Canadairs and helicopters. 
# The area of my interest is situated in province of Reggio Calabria, a little land of 3hundred of abitant named San Luca.


# install.packages("raster")
# install.packages("rgdal")
# install.packages("RStoolbox")# classification: RStoolbox is a Collection of Remote Sensing Tools
                               # The RStoolbox package provides a set of functions which simplify performing standard remote sensing tasks in R.
# install.packages("ggplot2") # ggplot can be used to declare the input data frame for a graphic
# install.packages("viridis") # package to choose color
# install.packages("ncdf4") # provides an high-level R interface to data file written using Unidata's netCDF library
# install.packages("patchwork") # patchwork' is a package that expands the API to allow for arbitrarily complex composition of plots by, among others, 
                                ## providing mathematical operators for combining multiple plots.
# install.packages("sf") # useful to open and manage shapefile
# install.packages("RColorBrewer") 
# install.packages('mapview') # mapview provides functions to very quickly and conveniently create interactive visualisations of spatial data.
# install.packages("magrittr") # The magrittr package offers a set of operators which make your code more readable by:
                               ## structuring sequences of data operations left-to-right
                               ### The operations are performed to arrive at the desired data set, 
                               #### and they are written in a natural order: the same as the order of execution.


library(raster)
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(viridis)
library(patchwork)
library(RColorBrewer)
library(ncdf4)
library(sf)
library(mapview) # I get this from the code of Fabio Castelli 
library(magrittr)

setwd("/Users/macdisimonegatto/Desktop/lab/project") # Setting the working directory

# Import all the files of the burned area
# I create a list of files

burned_list <- list.files(pattern="BA300")
burned_list

# [1] "c_gls_BA300-FDOB-DEKAD_202108100000_CUSTOM_S3_V1.2.1.tiff" 
# [2] "c_gls_BA300-FDOB-DEKAD_202108200000_CUSTOM_S3_V1.2.1.tiff" 
# [3] "c_gls_BA300-FDOB-DEKAD_202108310000_CUSTOM_S3_V1.2.1.tiff" 
# [4] "c_gls_BA300-FDOB-SEASON_202108100000_CUSTOM_S3_V1.2.1.tiff" # This unsigned integer (16 bits) provides the First Day of Burn (FDOB) over one or (typical) more dekads within the season, hence a cumulated FDOB value.
# [5] "c_gls_BA300-FDOB-SEASON_202108200000_CUSTOM_S3_V1.2.1.tiff"
# [6] "c_gls_BA300-FDOB-SEASON_202108310000_CUSTOM_S3_V1.2.1.tiff"


# I use the lapply function to assign to each images the raster function
burned_lapply <- lapply(burned_list, raster)
burned_lapply

# [[1]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_BA300-FDOB-DEKAD_202108100000_CUSTOM_S3_V1.2.1.tiff 
# names      : c_gls_BA300.FDOB.DEKAD_202108100000_CUSTOM_S3_V1.2.1 
# values     : 0, 65535  (min, max)


# [[2]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_BA300-FDOB-DEKAD_202108200000_CUSTOM_S3_V1.2.1.tiff 
# names      : c_gls_BA300.FDOB.DEKAD_202108200000_CUSTOM_S3_V1.2.1 
# values     : 0, 65535  (min, max)


# [[3]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_BA300-FDOB-DEKAD_202108310000_CUSTOM_S3_V1.2.1.tiff 
# names      : c_gls_BA300.FDOB.DEKAD_202108310000_CUSTOM_S3_V1.2.1 
# values     : 0, 65535  (min, max)


# [[4]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_BA300-FDOB-SEASON_202108100000_CUSTOM_S3_V1.2.1.tiff 
# names      : c_gls_BA300.FDOB.SEASON_202108100000_CUSTOM_S3_V1.2.1 
# values     : 0, 65535  (min, max)


# [[5]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_BA300-FDOB-SEASON_202108200000_CUSTOM_S3_V1.2.1.tiff 
# names      : c_gls_BA300.FDOB.SEASON_202108200000_CUSTOM_S3_V1.2.1 
# values     : 0, 65535  (min, max)


# [[6]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_BA300-FDOB-SEASON_202108310000_CUSTOM_S3_V1.2.1.tiff 
# names      : c_gls_BA300.FDOB.SEASON_202108310000_CUSTOM_S3_V1.2.1 
# values     : 0, 65535  (min, max)
# this values are the 16 bit of the images.
# i stacked all the images for better analysis


burned_stack <- stack(burned_lapply)
burned_stack

# class      : RasterStack 
# dimensions : 47040, 120960, 5689958400, 6  (nrow, ncol, ncell, nlayers)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# names      : c_gls_BA3//_S3_V1.2.1, c_gls_BA3//_S3_V1.2.1, c_gls_BA3//_S3_V1.2.1, c_gls_BA3//_S3_V1.2.1, c_gls_BA3//_S3_V1.2.1, c_gls_BA3//_S3_V1.2.1 
# min values :                     0,                     0,                     0,                     0,                     0,                     0 
# max values :                 65535,                 65535,                 65535,                 65535,                 65535,                 65535 


# I create two extention with the leghts of a part of calabria region and the area of interest that will be important later with NDVI
extCal <- c(15.5997, 16.40327, 37.84673, 38.4003) # i use this extention to see the province of Reggio Calabria one time
extReggio <- c(15.6589, 16.18244, 37.91141, 38.25393) # this is the extection that i use for the rest of my job


# Crop the stack due to the huge amount of the pixels
burned_crop <- crop(burned_stack, extCal)
burned_crop # recall the object to see info and if it's all right

# Crop the stack due to the huge amount of the pixels 
burned_crop <- crop(burned_stack, extReggio)
burned_crop # recall the object to see info and if it's all right
names(burned_crop)<- c("Fire August 10", "Fire August 20", "Fire August 31", "FDOB - end of season 10","FDOB - end of season 20", FDOB - end of season 20","FDOB - end of season 30")

# I create a color palette to see better the fire area
clBk<- colorRampPalette(c("red","black"))(10)

plot(burned_crop, col = clBk, leggend = FALSE) 
# In these images we can see that different fires are active at the same time but in different place. the fires start from deep of the forest, where the fire track can't go.
# So for this reason the firefigher had had difficult to extinguish the fire.
# And this allowed the fire to move freely


################################################ NDVI EVALUATION #########################################################


# The NDVI 300m V2 products are generated from Sentinel-3/OLCI V2
# The imagery from copernicus are important to evaluate the loss of vegetation
# NDVI 300m V2 shows good consistency with NDVI 300m V1, although a small negative
# systematic bias was found. Where PROBA-V NDVI300 V1 tends to saturate at the maximum
# NDVI for forest biomes, this is not the case for S3 NDVI300 V2. Spatial distribution of the
# bias is strongly linked to vegetation densities. Users should be aware of these differences
# when using the PROBA-V NDVI300 V1 archive as a reference for the more recent S3 NDVI300 V2 products.

# i can import all the file by hand but it is so lazy...
NDVI_2014 <- raster("c_gls_NDVI300_2014_08_010000_GLOBE_PROBAV_V1.0.1.nc")
# these images are important to evaluate the loss of vegetation 


#  I can create a list from a common name through the list file function
ndvi_list <- list.files(pattern="NDVI300")
ndvi_list # recall the list to have a look with the files

# [1] "c_gls_NDVI300_2014_08_010000_GLOBE_PROBAV_V1.0.1.nc"
# [2] "c_gls_NDVI300_2020_08_210000_GLOBE_OLCI_V2.0.1.nc"  # this images are important to consider the difference from the previous year 
# [3] "c_gls_NDVI300_2021_08_010000_GLOBE_OLCI_V2.0.1.nc"  
# [4] "c_gls_NDVI300_2021_08_110000_GLOBE_OLCI_V2.0.1.nc"  
# [5] "c_gls_NDVI300_2021_08_210000_GLOBE_OLCI_V2.0.1.nc" 


# Applying raster function to every image for better and fast analysis
ndvi_rast <- lapply(ndvi_list, raster)
ndvi_rast

# [[1]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_2014_08_010000_GLOBE_PROBAV_V1.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333M 
# zvar       : NDVI 

# [[2]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_2020_08_210000_GLOBE_OLCI_V2.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333m 
# z-value    : 2020-08-21 
# zvar       : NDVI 

# [[3]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_2021_08_010000_GLOBE_OLCI_V2.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333m 
# z-value    : 2021-08-01 
# zvar       : NDVI 

# [[4]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_2021_08_110000_GLOBE_OLCI_V2.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333m 
# z-value    : 2021-08-11 
# zvar       : NDVI 

# [[5]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_2021_08_210000_GLOBE_OLCI_V2.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333m 
# z-value    : 2021-08-21 
# zvar       : NDVI 


# Creation of a stack of these rasterlayer 
ndvi_stack <- stack(ndvi_rast)
ndvi_stack

# class      : RasterStack 
# dimensions : 47040, 120960, 5689958400, 5  (nrow, ncol, ncell, nlayers)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# names      : Normalized.Difference.Vegetation.Index.333M,
# Normalized.Difference.Vegetation.Index.333m.1,
# Normalized.Difference.Vegetation.Index.333m.2, 
# Normalized.Difference.Vegetation.Index.333m.3,
# Normalized.Difference.Vegetation.Index.333m.4 

# I decide to rename the file
names(ndvi_stack)<- c("Aug_01_2014", "Aug_21_2020", "Aug_01_2021", "Aug_11_2021", "Aug_21_2021")

# Crop the area of interest, also due to the huge amount of pixels, using the previous extention created.

ndvi_crop_Cal <- crop(ndvi_stack, extCal) # i use this extention to see the province of Reggio Calabria only one time
ndvi_crop_RC <- crop(ndvi_stack, extReggio) # this is the extection that i use for the rest of my job

ndvi_crop_RC # call the object to see if it's all right

# class      : RasterBrick 
# dimensions : 115, 176, 20240, 5  (nrow, ncol, ncell, nlayers)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : 15.65923, 16.18304, 37.9122, 38.25446  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : r_tmp_2022-02-12_224230_75857_97463.grd 
# names      : Aug_01_2014, Aug_21_2020, Aug_01_2021, Aug_11_2021, Aug_21_2021 
# min values :  0.02400001, -0.08000000, -0.08000000, -0.06800000, -0.08000000 
# max values :   0.9360001,   0.9360000,   0.9360000,   0.9360000,   0.9360000 

# i will create a set of palette that i will use for the job
my_col=c("white", "darkolivegreen" , "darkolivegreen4" , "limegreen" , "yellow2" , "orange2", "red", "purple")
cl1 <- colorRampPalette(c("red", "yellow", "lightgreen"))(20) # i use the previous palette used for the tresholding
difcl <-  colorRampPalette(brewer.pal(11, "RdYlGn"))(100) # create the color palette useful for this plot
cl2 <- (col=brewer.pal(4, 'RdYlGn'))

plot(ndvi_crop_Cal, col= cl1) #I chose this palette because it shows the area without vegetation very well
plot(ndvi_crop_RC, col= cl1) # To start the job
# This plot it's only to see the image. It's curious to see the different densieties of the two sensor used for the detection from the '14s image

# Now i want to show ndvi time series during the wildfire event
# I use this image to do the unsupervised classification to evaluate the difference with the postfire event
NDVI_21_2020 <-  ndvi_crop_RC[[2]]
NDVI_01_2021 <-  ndvi_crop_RC[[3]]
NDVI_21_2021 <-  ndvi_crop_RC[[5]]     

# I focused myself to the last day of the wildfire event, 21th of August
par(mfrow=c(2,1))
plot(NDVI_21_2020, col = my_col)
plot(NDVI_21_2021, col = my_col)
# The situation is dramatically changed after the wildifire...

######################################################## THRESHOLDING ###########################################################

# The non-vegetation pixels (<0.4) can be masked out. 
# The function 'calc' is used to make arithmetic calculations on rasters (among others applications). 
# In this case, a function is created to select all values smaller than 0.4, and make them equal to no data (NA). 
# The resulting image will have values greater than 0.4. This process is called “Thresholding”.
# NDVI values are standardized and range between -1 to +1. Pixels having NDVI values greater than 0.4 are very probably vegetation.

veg_pre <- calc(NDVI_01_2021, function(x){x[x < 0.4] <- NA; return(x)})
veg_post <- calc(NDVI_21_2021, function(x){x[x < 0.4] <- NA; return(x)})

par(mfrow=c(2,2))
breakpoints <- seq(-1, 1, by=0.2) # Set up the limits of the values scale (y axis)
 plot(NDVI_01_2021, col = colorRampPalette(c("red", "yellow", "lightgreen"))(length(breakpoints)-1), breaks=breakpoints, main = 'NDVI Pre-Fire')
 plot(NDVI_21_2021, col = colorRampPalette(c("red", "yellow", "lightgreen"))(length(breakpoints)-1), breaks=breakpoints, main = 'NDVI Post-Fire')

# Plot both NDVI outputs. In the second plot all colored pixels are very probably vegetation.

 plot(veg_pre, col = colorRampPalette(c("red", "yellow", "lightgreen"))(length(breakpoints)-1), breaks=breakpoints, main = 'NDVI Threshold, Pre-Fire')
 plot(veg_post, col = colorRampPalette(c("red", "yellow", "lightgreen"))(length(breakpoints)-1), breaks=breakpoints, main = 'NDVI Threshold Post-Fire')     

####################################################### HISTOGRAM ############################################################
# let's do a quantitative analysis.....
# Each bin represents a bar on your histogram plot. Each bar represents the frequency or number of pixels that have a value within that bin.
# For instance, there is a break between 0 and 1 in the histogram results above. 
# let's see the distribution of vegetation using hist fuction that show us an histogram where the pixels are distruibuted under the bar

par(mfrow=c(2,1))
hist(NDVI_21_2020,
      xlim = c(-0.080, 0.936),
      ylim = c(0, 3000),
      breaks = 20,
      main = "Histogram of NDVI distribution in 2020",
      col = "springgreen",
      xlab = "NDVI value")

hist(NDVI_21_2021,
      xlim = c(-0.080, 0.936),
      ylim = c(0, 3000),
      breaks = 20,
      main = "Histogram of NDVI distibution in 2021",
      col = "springgreen",
      xlab = "NDVI value")

# the hist slope toward the centre in 2021
 
 
####################################################### CLASSIFICATION ############################################################

# I make a classification to distinguish different element of the land. The year i choose is 2021.
# Forest have a value equal or greater than 0.4 
forest <- NDVI_21_2021 >=0.4
forest
plot(forest)

# I chose a value for cropland between 0.3 and 0.5
cropland <-   NDVI_21_2021  >= 0.3 & NDVI_21_2021<0.5
plot(cropland, col=c("white", "yellow3"))    
cropland_n =cropland*2 # change the value to allow the plot otherwise all the value are the same and it is imposible to plot the layer
cropland_n

# For followland the value is between 0.1 and 0.3
fallowland <- NDVI_21_2021 > 0.1 & NDVI_21_2021 <0.3
fallowland
plot(fallowland, col=c("white", "azure3"))
fallowland_n <- fallowland*3    # change the value which will be the correspondent color in the map

par(mfrow=c(1,1))
# Combine the element altogheter
NDVI_class <- water + forest + cropland_n + fallowland_n 

# I use par function. It can be used to set graphical parameters. 'mar' -> A numerical vector of the form c(bottom, left, top, right) 
## which gives the number of lines of margin to be specified on the four sides of the plot.
# The default is c(5, 4, 4, 2).
par(mar = c(8, 8, 7, 9)) 

plot(NDVI_class, col= cl2)
legend(x="bottomright", inset = c(-0.45, 0),  # Coordinates (x also accepts keywords)
       legend=c("water", "forest", "cropland","fallowland"), # Vector with the name of each group inset = c(-0.45, 0),
       fill= cl2,   
       col = cl2, 
       xpd = TRUE)

# This bar plot allow to explain the distribution of the different class counting the pixels and assign them to each class
vals <- getValues(NDVI_class)
 
pix_na <- length(subset(vals, vals == -1))
pix_1 <- length(subset(vals, vals == 1))
pix_2 <- length(subset(vals, vals == 2))
pix_3 <- length(subset(vals, vals == 3))

pix_values <- c(pix_na , pix_1 , pix_2 , pix_3)
bp <- barplot(NDVI_class, col=cl2, main = "Number of pixels of each class", names.arg = c("Water" , "Forest" , "Cropland", "Fallowland"))
text(bp, y= 500, labels= pix_values) 
# The operations are performed from the magrittr packages, and the distribution of the pixels are written in a natural order: the same as the order of execution.


####################################################### DIFFERENCE ############################################################

# Showing the difference between the last day of burn and the previous year
vegdif <- NDVI_21_2021 - NDVI_21_2020 # make the difference
plot(vegdif, col=difcl)

# Scatter plotting of this two layer
plot(NDVI_21_2020, NDVI_21_2021)
abline(0,1, col="red")

# I get some tips, from the github of my collegue and from the web, to undestand how calculate the pixels value that is TRUE
sum(values(NDVI_21_2021), na.rm=TRUE) # Sum: returns the sum of all the values present in its arguments.
# [1] 11137.82
sum(values(NDVI_21_2020), na.rm=TRUE) # Values: Compute the total value
# [1] 12278.62

forest_cover_2021 <- sum(values(NDVI_21_2021), na.rm=TRUE) # consider the TRUE value: '0.936'
forest_cover_2020 <- sum(values(NDVI_21_2020), na.rm=TRUE)

dif_cover <- forest_cover_2020 - forest_cover_2021
dif_cover
# [1] 1140.792
300*1140.792 #m^2 of the difference
# [1] 342237.6 m^2 342237.6x0.0003= 102.6713km^2 or 10240 hectares
# This value does not only consider the burned area. Anyway, it is an enormous amount of lost vegetation.


# Now i calculate the loss using unsupervised classification
# This type of classification can be useful when not a lot is known about an area.
# Clustering for quantitative analisys. choose two nclass that represent the presence and the absence of vegetation

####################################################### UNSUPERCLASS ############################################################

unsuper_20 <- unsuperClass(NDVI_21_2020,nSamples = 20240, nIter = 100, norm = FALSE, clusterMap = TRUE, nClasses=2)
unsuper_21_21 <- unsuperClass(NDVI_21_2021,nSamples = 20240, nIter = 100, norm = TRUE, clusterMap = TRUE, nClasses=2)

# Plot the cluster images
par(mfrow=c(2,1))
plot(unsuper_20$map, main= 'Agosto 2020-21',legend = FALSE)
plot(unsuper_21_21$map, main= 'Agosto 2021-21',legend = FALSE)

# Generate and format frequency tables from a variable or a table, with percentages and formatting options
freq(unsuper_21_21$map)
freq(unsuper_20$map)

#    value count
# [1,]     1  9837
# [2,]     2 10394
# [3,]    NA     9
freq(unsuper_21_21$map)

#     value count
# [1,]     1 11704
# [2,]     2  8527
# [3,]    NA     9 

totale <- 9837 + 10394
totale
# [1] 20231

prop_abse_2020 <- 9837/totale
prop_pres_2020 <- 10394/totale

prop_abse_2021 <- 11704/totale
prop_pres_2021 <- 8527/totale


prop_abse_2020 
# [1] 0.4451534 # 0,44x100 44%
prop_pres_2020
# [1] 0.4703593 # 0,47x100 47%
prop_abse_2021
# [1] 0.5296407 # 0,52x100 52%
prop_pres_2021
# [1] 0.385872  # 0.38x100 38%
# the loss of vegetation between 2020 and 2021 is [(52-44)/44]% = 18,18%
in square km are

# Let's calculate the cover extenction
cover <- c("presence", "absence") # cover: Replace NA values with values of other layers
prop2020 <- c(prop_pres_2020, prop_abse_2020) # here we had create a proportion 
prop2020

proportion2020 <- data.frame(cover, prop2020)
proportion2020
#        cover  prop2020
# 1    presence 0.4703593
# 2     absence 0.4451534


cover <- c("presence", "absence") # cover: Replace NA values with values of other layers
prop2021_21 <- c(prop_pres_2021, prop_abse_2021) # here we had create a proportion 
prop2021_21

proportion2021_21 <- data.frame(cover, prop2021_21)
proportion2021_21
#        cover  prop2021.21
# 1    presence 0.3858720
# 2     absence 0.5296407

# I've Used ggplot and patchwork to plot the Histogram
prop1 <- ggplot(proportion2020, aes(x=cover, y=prop2020, color=cover)) + geom_bar(stat="identity", fill="white")
prop2 <- ggplot(proportion2021_21, aes(x=cover, y=prop2021_21, color=cover)) + geom_bar(stat="identity", fill="white")

#patchwork
prop1 / prop2

################################## Qualitative analysis ################################

# Ok, now i decide to show better the area of interest using bowndary shape find out in copernicus site about the day of burn
# I import from a folder renamed calabria situated in the lab folder 
aoi_boundary <-st_read("/Users/macdisimonegatto/Desktop/lab/project/calabria/EMSR534_AOI01_GRA_PRODUCT_areaOfInterestA_r1_v1.shp") # this is the shape of the area of interest
aoi_boundary1 <-st_read("/Users/macdisimonegatto/Desktop/lab/project/calabria/EMSR534_AOI01_GRA_PRODUCT_observedEventA_r1_v1.shp") # shapefile of different wildfire event in the AOI     
aoi_boundary2 <-st_read("/Users/macdisimonegatto/Desktop/lab/project/calabria/EMSR534_AOI01_GRA_PRODUCT_builtUpA_r1_v1.shp") # this is the shape file from calabria folder situated in the lab folder with built up of the AOI

# I use these function to see the information of these shape files
st_geometry_type(aoi_boundary)
st_crs(aoi_boundary)
st_bbox(aoi_boundary)

# I created a ggplot and I plotted it with patchwork package without the shape file
p1 <- ggplot() + geom_raster(ndvi_crop_RC, mapping = aes(x=x, y=y, fill= Aug_21_2021)) + scale_fill_viridis(option="magma")+ ggtitle("August_fire_11") + ggtitle("AOI Boundary Plot") + coord_sf()  
             
# this ggplot is with shapefile of the area of interest
p2 <- ggplot() + geom_raster(ndvi_crop_RC, 
                 mapping = aes(x=x, y=y, fill= Aug_21_2021)) +  
                 scale_fill_viridis(option="magma")+ ggtitle("Aug_21_2021") +  
                 geom_sf(data = aoi_boundary,  size = 0.30, color = "white", fill=NA) + 
                 ggtitle("AOI Boundary Plot") + coord_sf()         
             
# And this with the shape file of the observed event
p3 <- ggplot() + geom_raster(ndvi_crop_RC, 
                 mapping = aes(x=x, y=y, fill= Aug_21_2021)) +  
                 scale_fill_viridis(option="magma")+ ggtitle("Aug_21_2021") +  
                 geom_sf(data = aoi_boundary,  size = 0.30, color = "white", fill=NA) + 
                 geom_sf(data = aoi_boundary1,  size = 0.30, color = "red", fill="red") +
                 ggtitle("AOI Boundary Plot") + coord_sf()  
                 
# Aoi_boundary2 add the building and we can see that most of all are in the fire area. Dramatical
 p4 <- ggplot() + geom_raster(ndvi_crop_RC, 
                 mapping = aes(x=x, y=y, fill= Aug_21_2021)) +  
                 scale_fill_viridis(option="magma") + ggtitle("Aug_21_2021") +  
                 geom_sf(data = aoi_boundary,  size = 0.30, color = "white", fill=NA) + 
                 geom_sf(data = aoi_boundary1,  size = 0.30, color = "red", fill="red") +
                 geom_sf(data = aoi_boundary2,  size = 0.50, color = "green", fill=NA) +
                 ggtitle("AOI Boundary Plot") + coord_sf()  
# This shapes file point out the real extention of the disaster caused by fire.
# Ground teams from other italian regions have been deployed to the affected places to estimate, in situ, the lost.

# Patchwork
p1 
p2
p3
p4

# To export all the graph i use png ext. 
png('name_of_file')
'code'
dev.off()

################################################### FUNNY STUFF ########################################################


plot(ndvi_crop_Cal$Aug_01_2014,col=my_col,legend=F,box=F,axes=F, main="Cool Color")
mapview(ndvi_crop_Cal$Aug_01_2014, col =my_col)











