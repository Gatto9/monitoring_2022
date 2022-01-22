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

# Or importing all the files creating a list
firelist <- list.files(pattern="BA")
firelist

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
> plot(veg_index[[1]])
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







