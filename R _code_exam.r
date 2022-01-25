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
raster("c_gls_BA300_202108100000_GLOBE_S3_V1.2.1.nc")
# Or importing all the files creating a list
firelist <- list.files(pattern="BA300")
firelist

cl <- colorRampPalette(c('red','green','yellow'))(100) 


# crop the file and take the south italy images
ext <- c(15.5, 18, 37.7, 40)
fire_cropped <- crop(fire, ext)
plot(fire_cropped)
plot(fire_cropped, col=cl)




########################################
#NDVI 
library(patchwork)
library(raster)
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(viridis)
library(ncdf4)
setwd("/Users/macdisimonegatto/Desktop/lab/project")

# i can import all the file by hand, so lazy...
NDVI_2014 <- raster("c_gls_NDVI300_2014_08_010000_GLOBE_PROBAV_V1.0.1.nc")
# this images are important to consider the impact of the covid on the beavhiour of the popualation and ecomafie during the pandemic era
NDVI_07_21 <- raster("c_gls_NDVI300_2020_07_210000_GLOBE_PROBAV_V1.0.1.nc")
NDVI_08_01 <- raster("c_gls_NDVI300_2020_08_010000_GLOBE_PROBAV_V1.0.1.nc")
NVDI_08_11 <- raster("c_gls_NDVI300_2020_08_110000_GLOBE_PROBAV_V1.0.1.nc")
NVDI_08_11 <- raster("c_gls_NDVI300_202108010000_GLOBE_OLCI_V2.0.1.nc")
NVDI_08_11 <- raster("c_gls_NDVI300_202108110000_GLOBE_OLCI_V2.0.1.nc")
NVDI_08_11 <- raster("c_gls_NDVI300_202108210000_GLOBE_OLCI_V2.0.1.nc")

# and assigning a function to each images
# or better i can create a list from a common name
rlist <- list.files(pattern="NDVI300")
rlist
# [1] "c_gls_NDVI300_202007210000_GLOBE_PROBAV_V1.0.1.nc" 
# [2] "c_gls_NDVI300_202008010000_GLOBE_PROBAV_V1.0.1.nc"
# [3] "c_gls_NDVI300_202008110000_GLOBE_PROBAV_V1.0.1.nc"
# [5] "c_gls_NDVI300_202108010000_GLOBE_OLCI_V2.0.1.nc"    
# [6] "c_gls_NDVI300_202108110000_GLOBE_OLCI_V2.0.1.nc"    
# [7] "c_gls_NDVI300_202108210000_GLOBE_OLCI_V2.0.1.nc"  

# applying a function to every image
list_rast <- lapply(rlist, raster)
list_rast

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
# source     : c_gls_NDVI300_2020_07_210000_GLOBE_PROBAV_V1.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333M 
# zvar       : NDVI 


# [[3]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_2020_08_010000_GLOBE_PROBAV_V1.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333M 
# zvar       : NDVI 


# [[4]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_2020_08_110000_GLOBE_PROBAV_V1.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333M 
# zvar       : NDVI 

# [[5]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_202108010000_GLOBE_OLCI_V2.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333m 
# z-value    : 2021-08-01 
# zvar       : NDVI 


# [[6]]
# class      : RasterLayer 
# dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : c_gls_NDVI300_202108110000_GLOBE_OLCI_V2.0.1.nc 
# names      : Normalized.Difference.Vegetation.Index.333m 
# z-value    : 2021-08-11 
# zvar       : NDVI 


#[[7]]
#class      : RasterLayer 
#dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
#resolution : 0.00297619, 0.00297619  (x, y)
#extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
#crs        : +proj=longlat +datum=WGS84 +no_defs 
#source     : c_gls_NDVI300_202108210000_GLOBE_OLCI_V2.0.1.nc 
#names      : Normalized.Difference.Vegetation.Index.333m 
#z-value    : 2021-08-21 
# zvar       : NDVI 


##  creation of a stack of this different rasterlayer 
vegetation <- stack(list_rast)
vegetation

# class      : RasterStack 
# dimensions : 47040, 120960, 5689958400, 4  (nrow, ncol, ncell, nlayers)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# names      : Normalized.Difference.Vegetation.Index.333M.1, 
#              Normalized.Difference.Vegetation.Index.333M.2, 
#              Normalized.Difference.Vegetation.Index.333M.3, 
#              Normalized.Difference.Vegetation.Index.333M.4, 
#              Normalized.Difference.Vegetation.Index.333m.1,
#              Normalized.Difference.Vegetation.Index.333m.2,
#              Normalized.Difference.Vegetation.Index.333m.3
#create the extenction of coordiantes first (x,y)
# I decide to crop first because the image have a huge amount of pixels

names(vegetation)<- c("August_2014",  "July_21", "August_01",  "August_11", "August_fire_01", "August_fire_11", "August_fire_21")

ext <- c(15.6, 16.4036, 37.8463, 38.4) # provincia di Reggio, Asprumunti.
veg_cropped <- crop(vegetation, ext)
veg_cropped

# class      : RasterBrick 
# dimensions : 186, 270, 50220, 7  (nrow, ncol, ncell, nlayers)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : 15.5997, 16.40327, 37.84673, 38.4003  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : r_tmp_2022-01-23_235322_7161_69049.grd 
# names      : August_2014,   July_21, August_01, August_11, August_fire_01, August_fire_11, August_fire_21 
# min values :      -0.076,    -0.080,    -0.080,    -0.080,         -0.080,         -0.080,         -0.080 
# max values :   0.9360001, 0.9360001, 0.9360001, 0.9360001,      0.9360000,      0.9360000,      0.9360000


plot(veg_cropped)
plot(veg_cropped$August_2014)
# i'd obtain a plotting point to see the loss of vegetation in seven years
plot(veg_cropped$August_2014, veg_cropped$August_fire_21)
abline(0,1)
abline(0,1, col="red")

# assign a name for a multitemporal frame

Aug_08_2014 <- veg_cropped[[1]]
Aug_01_2020 <- veg_cropped[[3]]
Aug_21_2021 <- veg_cropped[[7]]
Aug_01_2021 <- veg_cropped[[5]]
#or
Aug_08_2014 <- veg_cropped$August_2014
Aug_01_2020 <- veg_cropped$August_01
Aug_21_2021 <- veg_cropped$August_fire_21
Aug_01_2021 <- veg_cropped$August_fire_01

# zoom to a better vision of the point of interest
extReggio <- c(15.7456, 16.1973, 37.9463, 38.2839) # provincia di Reggio, Asprumunti.

temporal_stack <-stack(Aug_08_2014, Aug_01_2020, Aug_21_2021, Aug_01_2021)

# the situation is dramatically compromised, we must do something
# the people are out of their minds

plot(Aug_08_2014)
plot(Aug_01_2021)
plot(Aug_21_2021)

#create a palette first
clb<- colorRampPalette(c("darkblue","green","lightblue"))(100)
clg<- colorRampPalette(c("darkgreen","green","lightgreen"))(100)
rgBk<- colorRampPalette(c("red","green","black"))(100)

#plot the images and assign the color

par(mfrow=c(2,3))
plot(Aug_08_2014, col=clb)
plot(Aug_08_2014, col=clg)
plot(Aug_01_2021, col=clb)
plot(Aug_01_2021, col=clg)
plot(Aug_21_2021, col=clb)
plot(Aug_21_2021, col=clg)

#i want to see the images from january 2014 and january 2020
#extraxt them from the stack


#I want to see if there is a difference in this two period
difcl<-colorRampPalette(c("yellow","red","black"))(100)#create the color ramp palette
Vegdif<-Aug_08_2014-Aug_21__2021 #make the difference
plot(Vegdif, col=difcl)#plotting the images

plot(Vegdif, col = rev(terrain.colors(10)), main = "layer")


 plot(Agosto2014_un$map)
 plot(Agosto2014_un$map, col=clb)
 Agosto2014_un <- unsuperClass(august2014, nClasses=2)
 plot(Agosto2014_un$map, col=clb)
 Agosto2014_un <- unsuperClass(august2014, nClasses=4)
 plot(Agosto2014_un$map, col=clb)
 Agosto2014_un <- unsuperClass(august2014, nClasses=5)
 plot(Agosto2014_un$map, col=clb)
 Agosto2014_un <- unsuperClass(august2014, nClasses=8)
 plot(Agosto2014_un$map, col=clb

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

ext <- c(15.5, 16.5, 37.8, 38.5) # provincia di Reggio, Asprumunti.


######################### make the frequencies of the precences of 2014 ############################

v2014 <- raster("c_gls_NDVI300_201408010000_GLOBE_PROBAV_V1.0.1.nc")
v2014
#class      : RasterLayer 
#dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
#resolution : 0.00297619, 0.00297619  (x, y)
#extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
#crs        : +proj=longlat +datum=WGS84 +no_defs 
#source     : c_gls_NDVI300_201408010000_GLOBE_PROBAV_V1.0.1.nc 
#names      : Normalized.Difference.Vegetation.Index.333M 
#zvar       : NDVI 
# crop the place of interest, cut the large extent
ext <- c(15.6, 16.9436, 37.8463, 38.4) # provincia di Reggio, Asprumunti.
v2014c <- crop(v2014, ext)
plot(v2014c)

      
      
      
      
      
      
      ############################# different cropping ###############################
# frequencies unsuperClass
v2014c_un <- unsuperClass(v2014c, nClasses=2)
plot(v2014c)
plot(v2014c_un)
v2014c_un
> v2021c_un <- unsuperClass(crop_Aug_21_2021, nClasses=2)
> 
> plot(v2021c_un)
Errore in xy.coords(x, y, xlabel, ylabel, log) : 
  'x' is a list, but does not have components 'x' and 'y'
> v2021c_un
unsuperClass results

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 114, 186, 21204  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : 15.64435, 16.19792, 37.94494, 38.28423  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : memory
names      : layer 
values     : 1, 2  (min, max)

> plot(v2021c_un$map)
> v2021c_un <- unsuperClass(crop_Aug_21_2021, nClasses=3)
> plot(v2021c_un$map)
> frequencies <-v2021c_un$map
> freq(frequencies)
     value count
[1,]     1  6052
[2,]     2  6103
[3,]     3  9049
> 6052+ 6103
[1] 12155
> 6052+ 6103+ 9049
[1] 21204
> tot <- 21204
> freq_vegetation_2021 <- 12155/tot
> freq_vegetation_2021 
[1] 0.5732409
# unsuperClass results

# *************** Map ******************
# $map
# class      : RasterLayer 
# dimensions : 235, 336, 78960  (nrow, ncol, ncell)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : 15.49851, 16.49851, 37.79911, 38.49851  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : memory
# names      : layer 
# values     : 1, 2  (min, max)

plot(v2014c_un$map)
freq(v2014c_un$map)
#      value count
# [1,]     1 58950
# [2,]     2 20010
58950 + 20010
# [1] 78960

propveg2014_1 <- 58950/totale 
propveg2014_2 <- 20010/totale
 
propveg2014_1 
# [1] 0.7465805
propveg2014_2 
# [1] 0.2534195

cover <- c("forest", "deforestation")
prop2014 <- c(propforest, propagri)
proportion <- data.frame(cover, prop2014)
p1 <- ggplot(proportion, aes(x=cover, y= prop2014, color=cover)) + geom_bar(stat="identity", fill="white")  + ylim(0,1)










plot(l2017c)
Errore in h(simpleError(msg, call)) : 
  errore durante la valutazione dell'argomento 'x' nella selezione di un metodo per la funzione 'plot': oggetto 'l2017c' non trovato
 plot(l2107c$map)
 
 plot(v2014c)
 v2014c_un <- unsuperClass(v2014, nClasses=2)
 
 v2014c_un <- unsuperClass(v2014c, nClasses=2)
 plot(v2014c)
 plot(v2014c_un)
Errore in xy.coords(x, y, xlabel, ylabel, log) : 
  'x' is a list, but does not have components 'x' and 'y'
v2014c_un
unsuperClass results

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 235, 336, 78960  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : 15.49851, 16.49851, 37.79911, 38.49851  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : memory
names      : layer 
values     : 1, 2  (min, max)

> plot(v2014c_un$map)
> freq(v2014c_un$map)
     value count
[1,]     1 58950
[2,]     2 20010
> 58950 + 20010
[1] 78960
> 
> propveg2014_1 <-58950/totale
> propveg2014_2 <-20010/totale
> 
> propveg2014_1 
[1] 0.7465805
> propveg2014_2 
[1] 0.2534195

#####

> NDVI_list <- list.files(pattern="NDVI")
> NDVI_list
[1] "c_gls_NDVI_201408110000_GLOBE_PROBAV_V3.0.1.nc"    "c_gls_NDVI300_202007210000_GLOBE_PROBAV_V1.0.1.nc"
[3] "c_gls_NDVI300_202008010000_GLOBE_PROBAV_V1.0.1.nc" "c_gls_NDVI300_202008110000_GLOBE_PROBAV_V1.0.1.nc"
> NDVI_list <- list.files(pattern="NDVI300")
> NDVI_list
[1] "c_gls_NDVI300_202007210000_GLOBE_PROBAV_V1.0.1.nc" "c_gls_NDVI300_202008010000_GLOBE_PROBAV_V1.0.1.nc"
[3] "c_gls_NDVI300_202008110000_GLOBE_PROBAV_V1.0.1.nc"
> veg <- lapply(NDVI_list, raster)
> veg
[[1]]
class      : RasterLayer 
dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_NDVI300_202007210000_GLOBE_PROBAV_V1.0.1.nc 
names      : Normalized.Difference.Vegetation.Index.333M 
zvar       : NDVI 


[[2]]
class      : RasterLayer 
dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_NDVI300_202008010000_GLOBE_PROBAV_V1.0.1.nc 
names      : Normalized.Difference.Vegetation.Index.333M 
zvar       : NDVI 


[[3]]
class      : RasterLayer 
dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_NDVI300_202008110000_GLOBE_PROBAV_V1.0.1.nc 
names      : Normalized.Difference.Vegetation.Index.333M 
zvar       : NDVI 


> stack <- stack(veg)
> veg
[[1]]
class      : RasterLayer 
dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_NDVI300_202007210000_GLOBE_PROBAV_V1.0.1.nc 
names      : Normalized.Difference.Vegetation.Index.333M 
zvar       : NDVI 


[[2]]
class      : RasterLayer 
dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_NDVI300_202008010000_GLOBE_PROBAV_V1.0.1.nc 
names      : Normalized.Difference.Vegetation.Index.333M 
zvar       : NDVI 


[[3]]
class      : RasterLayer 
dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_NDVI300_202008110000_GLOBE_PROBAV_V1.0.1.nc 
names      : Normalized.Difference.Vegetation.Index.333M 
zvar       : NDVI 


> stack
class      : RasterStack 
dimensions : 47040, 120960, 5689958400, 3  (nrow, ncol, ncell, nlayers)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
names      : Normalized.Difference.Vegetation.Index.333M.1, Normalized.Difference.Vegetation.Index.333M.2, Normalized.Difference.Vegetation.Index.333M.3 

> dev.off()
null device 
          1 
> ext <- c(15.5, 18, 37.7, 40)
> veg_index <- crop(stack, ext)
> plot(veg_index)
> plot(veg_index, col=cl)
> plot(veg_index)
> plot(veg_index$[[1]])
Errore: '[[' inatteso in "plot(veg_index$[["
plot(veg_index[[1]])
> hist(veg_index)
Messaggi di avvertimento:
1: In .hist1(raster(x, y[i]), maxpixels = maxpixels, main = main[y[i]],  :
  15% of the raster cells were used. 100000 values used.
2: In .hist1(raster(x, y[i]), maxpixels = maxpixels, main = main[y[i]],  :
  15% of the raster cells were used. 100000 values used.
3: In .hist1(raster(x, y[i]), maxpixels = maxpixels, main = main[y[i]],  :
  15% of the raster cells were used. 100000 values used.
> plot(veg_index[[1]])
> ext <- c(15.5, 16.5, 37.8, 38.5)
> 
> veg_index <- crop(stack, ext)
> plot(veg_index)
> plot(veg_index, col=cl)
> hist(veg_index)
> freq(veg)
Errore in (function (classes, fdef, mtable)  : 
  unable to find an inherited method for function ‘freq’ for signature ‘"list"’
> frequ(veg_index)
Errore in frequ(veg_index) : non trovo la funzione "frequ"
> freq(veg_index)
$Normalized.Difference.Vegetation.Index.333M.1
     value count
[1,]     0  9414
[2,]     1 69546

$Normalized.Difference.Vegetation.Index.333M.2
     value count
[1,]     0 10894
[2,]     1 68066

$Normalized.Difference.Vegetation.Index.333M.3
     value count
[1,]     0  9910
[2,]     1 69050

> 
> plot(veg_index)
> 
> a <-names(veg_index[1])
> plot(a)
Errore in plot.window(...) : i valori 'xlim' devono essere finiti
In aggiunta: Messaggi di avvertimento:
1: In min(x) : nessun argomento non-mancante al minimo; si restituisce Inf
2: In max(x) :
  nessun argomento non-mancante al massimo; si restituisce -Inf
3: In min(x) : nessun argomento non-mancante al minimo; si restituisce Inf
4: In max(x) :
  nessun argomento non-mancante al massimo; si restituisce -Inf
> dev.off()
null device 
          1 
> plot(a)
Errore in plot.window(...) : i valori 'xlim' devono essere finiti
In aggiunta: Messaggi di avvertimento:
1: In min(x) : nessun argomento non-mancante al minimo; si restituisce Inf
2: In max(x) :
  nessun argomento non-mancante al massimo; si restituisce -Inf
3: In min(x) : nessun argomento non-mancante al minimo; si restituisce Inf
4: In max(x) :
  nessun argomento non-mancante al massimo; si restituisce -Inf
> v2014 <- raster("c_gls_NDVI300_201408010000_GLOBE_PROBAV_V1.0.1.nc")
> v2014
class      : RasterLayer 
dimensions : 47040, 120960, 5689958400  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : -180.0015, 179.9985, -59.99851, 80.00149  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_NDVI300_201408010000_GLOBE_PROBAV_V1.0.1.nc 
names      : Normalized.Difference.Vegetation.Index.333M 
zvar       : NDVI 

>  v2014c <- crop(v2014, ext)
> plot(v2014c)
> l2107 <- veg_index[1]
> l2107
     Normalized.Difference.Vegetation.Index.333M.1 Normalized.Difference.Vegetation.Index.333M.2
[1,]                                         0.936                                         0.936
     Normalized.Difference.Vegetation.Index.333M.3
[1,]                                         0.936
> l2107 <- veg_index[[1]]
> l2107
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 235, 336, 78960  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : 15.49851, 16.49851, 37.79911, 38.49851  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : r_tmp_2022-01-22_175433_7161_83264.grd 
names      : Normalized.Difference.Vegetation.Index.333M.1 
values     : -0.08, 0.9360001  (min, max)

> plot(l2017)
Errore in h(simpleError(msg, call)) : 
  errore durante la valutazione dell'argomento 'x' nella selezione di un metodo per la funzione 'plot': oggetto 'l2017' non trovato
> plot(l2107)
> dev.off()
null device 
          1 
> plot(l2107)
> l2107c <- unsuperClass(l2107, nClasses=2)
> 
> l2107c
unsuperClass results

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 235, 336, 78960  (nrow, ncol, ncell)
resolution : 0.00297619, 0.00297619  (x, y)
extent     : 15.49851, 16.49851, 37.79911, 38.49851  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : memory
names      : layer 
values     : 1, 2  (min, max)

> plot(l2107c$map)
> freq(l2107c $map)          # Generate and format frequency tables from a variable or a table, with percentages and formatting options.
     value count
[1,]     1 61022
[2,]     2 17938
> 
> 61022 +17938
[1] 78960
> totale <-78960
> proveg1 <-61022
> proveg1 <-61022/totale
> proveg2 <-17938/totale
> proveg1
[1] 0.7728217







