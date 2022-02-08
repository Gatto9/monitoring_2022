# “Combustion is a complex process in which fuel is heated, ignites, and oxidizes rapidly, giving off heat in the process. 
# Fire is a special case of combustion—self-perpetuating combustion characterized by the emission of heat and accompanied by flame and/or smoke. 
# With fire, the supply of combustible fuel is controlled by heat given off during combustion” 
# La superficie boscata bruciata è stata di 2.281 ettari con un aumento, rispetto al 2013, del numero degli incendi boschivi pari al 79% 
# I would like to see the vegetation changes of the Calabrian aspromonte after the summer, caused by self-igniting forest fires
# I'd like to detect the emission of CO2 in the summer period for these fires 
# I want to discuss about the causes and how to prevent or manage the fires in time
# I can detect the temperature during that period
# thank to special data i can see the smoke plumes of these fires
# Sono nove i progetti del Parco Nazionale dell’Aspromonte finanziati dal Ministero della Transizione Ecologica attraverso il bando 2021 “Parchi per il clima”, per un importo complessivo di 4,2 milioni di euro. 
#Gli interventi prevedono l’efficientamento energetico di alcune strutture nei Comuni del territorio del Parco, con priorità ai punti informativi e ad edifici destinati alle attività culturali e all’accoglienza.





# install all the package you need 

# install.packages("raster")
# install.packages("rgdal")
# install.packages("RStoolbox")
# install.packages("ggplot2")
# install.packages("viridis")
# install.packages("ncdf4")
# install.packages("patchwork")
# install.packages("sf") # useful to open and manage shapefile

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

hist(ndvi,
     main = "Distribution of NDVI values",
     xlab = "NDVI",
     ylab= "Frequency",
     col = "wheat",
     xlim = c(-0.5, 1),
     breaks = 30,
     xaxt = 'n')
axis(side=1, at = seq(-0.5,1, 0.05), labels = seq(-0.5,1, 0.05))


# i open the file with ncdf4 packages to know more information like latitude and longitude

nc_file <- nc_open("c_gls_BA300_202107310000_GLOBE_S3_V1.2.1.nc")
nc_file
lon <- ncvar_get(nc_file, varid = "lon")
lat <- ncvar_get(nc_file, varid = "lat")
 
summary(lon)
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-1.80e+02 -9.00e+01 -1.49e-03 -1.49e-03  9.00e+01  1.80e+02 
summary(lat)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    -60     -25      10      10      45      80 

MLD <- nc_open(MLD)
   print(MLD)


setwd("/Users/macdisimonegatto/Desktop/lab/project/calabria/")
> aoi_boundary <-st_read("EMSR534_AOI01_GRA_PRODUCT_areaOfInterestA_r1_v1.shp")
Reading layer `EMSR534_AOI01_GRA_PRODUCT_areaOfInterestA_r1_v1' from data source `/Users/macdisimonegatto/Desktop/lab/project/calabria/EMSR534_AOI01_GRA_PRODUCT_areaOfInterestA_r1_v1.shp' 
  using driver `ESRI Shapefile'
Simple feature collection with 1 feature and 5 fields
Geometry type: POLYGON
Dimension:     XY
Bounding box:  xmin: 15.6589 ymin: 37.91141 xmax: 16.18244 ymax: 38.25393
Geodetic CRS:  WGS 84
> st_geometry_type(aoi_boundary)
[1] POLYGON
18 Levels: GEOMETRY POINT LINESTRING POLYGON ... TRIANGLE
> st_crs(aoi_boundary)
Coordinate Reference System:
  User input: WGS 84 
  wkt:
GEOGCRS["WGS 84",
    DATUM["World Geodetic System 1984",
        ELLIPSOID["WGS 84",6378137,298.257223563,
            LENGTHUNIT["metre",1]]],
    PRIMEM["Greenwich",0,
        ANGLEUNIT["degree",0.0174532925199433]],
    CS[ellipsoidal,2],
        AXIS["latitude",north,
            ORDER[1],
            ANGLEUNIT["degree",0.0174532925199433]],
        AXIS["longitude",east,
            ORDER[2],
            ANGLEUNIT["degree",0.0174532925199433]],
    ID["EPSG",4326]]
> 
> st_bbox(aoi_boundary)
    xmin     ymin     xmax     ymax 
15.65890 37.91141 16.18244 38.25393 
> aoi_boundary
Simple feature collection with 1 feature and 5 fields
Geometry type: POLYGON
Dimension:     XY
Bounding box:  xmin: 15.6589 ymin: 37.91141 xmax: 16.18244 ymax: 38.25393
Geodetic CRS:  WGS 84
  emsr_id glide_no area_id locality map_type
1 EMSR534       NA      01 San Luca  Grading
                        geometry
1 POLYGON ((15.90929 37.92512...
> ggplot() + 
+   geom_sf(data = aoi_boundary, size = 3, color = "black", fill = "cyan1") + 
+   ggtitle("AOI Boundary Plot") + 
+   coord_sf()


            
            
            
            
# i download from copernicus the shapefile of the area of interest for my and i rename in "calabria" the folder to simplify the work directory
# this is the shapefile of building area near the wildfire 
aoi_boundary1 <-st_read("EMSR534_AOI01_GRA_PRODUCT_builtUpA_r1_v1.shp")


st_geometry_type(aoi_boundary1)

aoi_boundary1
[1] POLYGON
18 Levels: GEOMETRY POINT LINESTRING POLYGON ... TRIANGLE
> st_bbox(aoi_boundary)
    xmin     ymin     xmax     ymax 
15.65890 37.91141 16.18244 38.25393 
> st_geometry_type(aoi_boundary1)
 [1] POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON
 [9] POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON
[17] POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON
[25] POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON POLYGON
[33] POLYGON POLYGON
18 Levels: GEOMETRY POINT LINESTRING POLYGON ... TRIANGLE
> st_bbox(aoi_boundary1)
    xmin     ymin     xmax     ymax 
15.68655 38.00402 15.90206 38.21481 
> aoi_boundary1
Simple feature collection with 34 features and 10 fields
Geometry type: POLYGON
Dimension:     XY
Bounding box:  xmin: 15.68655 ymin: 38.00402 xmax: 15.90206 ymax: 38.21481
Geodetic CRS:  WGS 84
First 10 features:
                       obj_type    name
1      11-Residential Buildings Unknown
2  12-Non-residential Buildings Unknown
3      11-Residential Buildings Unknown
4  12-Non-residential Buildings Unknown
5      11-Residential Buildings Unknown
6      11-Residential Buildings Unknown
7      11-Residential Buildings Unknown
8      11-Residential Buildings Unknown
9      11-Residential Buildings Unknown
10 12-Non-residential Buildings Unknown
                                  info       damage_gra     det_method
1                   997-Not Applicable          Damaged Not Applicable
2                        1280-Cemetery          Damaged Not Applicable
3                   997-Not Applicable Possibly damaged Not Applicable
4  127-Other non-residential buildings Possibly damaged Not Applicable
5                   997-Not Applicable Possibly damaged Not Applicable
6                   997-Not Applicable Possibly damaged Not Applicable
7                   997-Not Applicable Possibly damaged Not Applicable
8                   997-Not Applicable Possibly damaged Not Applicable
9                   997-Not Applicable Possibly damaged Not Applicable
10 127-Other non-residential buildings Possibly damaged Not Applicable
         notation or_src_id dmg_src_id       cd_value           real
1  Building block       994          8 Not Applicable    Real extent
2  Building block       994          8 Not Applicable    Real extent
3  Not Applicable        10          8 Not Applicable Not Applicable
4  Not Applicable        10          8 Not Applicable Not Applicable
5  Not Applicable        10          8 Not Applicable Not Applicable
6  Not Applicable        10          8 Not Applicable Not Applicable
7  Not Applicable        10          8 Not Applicable Not Applicable
8  Not Applicable        10          8 Not Applicable Not Applicable
9  Not Applicable        10          8 Not Applicable Not Applicable
10 Not Applicable        10          8 Not Applicable Not Applicable
                         geometry
1  POLYGON ((15.81391 38.08579...
2  POLYGON ((15.69648 38.21189...
3  POLYGON ((15.78157 38.16352...
4  POLYGON ((15.78404 38.16303...
5  POLYGON ((15.69884 38.21379...
6  POLYGON ((15.69965 38.21336...
7  POLYGON ((15.69345 38.21365...
8  POLYGON ((15.69285 38.21283...
9  POLYGON ((15.69361 38.18023...
10 POLYGON ((15.80154 38.10552...
> dev.off()

aoi_boundary1 <-st_read("EMSR534_AOI01_GRA_PRODUCT_builtUpA_r1_v1.shp") # this is the shape file from calabria folder situated in the lab folder with built up of the AOI
aoi_boundary2 <-st_read("EMSR534_AOI01_GRA_PRODUCT_imageFootprintA_r1_v1.shp") # footprint of the wildifire
aoi_boundary3 <-st_read("EMSR534_AOI01_GRA_PRODUCT_naturalLandUseA_r1_v1.shp") # shapefile of natural land of the AOI
aoi_boundary4 <-st_read("EMSR534_AOI01_GRA_PRODUCT_observedEventA_r1_v1.shp") # shapefile of different wildfire event in the AOI









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
#The NDVI 300m V2 products are generated from Sentinel-3/OLCI BRDF-corrected

# i import the NDVI detected from the OLCI (ocean and land cover index) instead of PROBAV sensor,because it has been adjust
NDVI_08_01 <- raster("c_gls_NDVI300_2020_08_010000_GLOBE_OLCI_V2.0.1.nc")
NVDI_08_11 <- raster("c_gls_NDVI300_2020_08_110000_GLOBE_OLCI_V2.0.1.nc")
NDVI_07_21 <- raster("c_gls_NDVI300_2020_08_210000_GLOBE_OLCI_V2.0.1.nc")

NVDI_08_01 <- raster("c_gls_NDVI300_202108010000_GLOBE_OLCI_V2.0.1.nc")
NVDI_08_11 <- raster("c_gls_NDVI300_202108110000_GLOBE_OLCI_V2.0.1.nc")
NVDI_08_21 <- raster("c_gls_NDVI300_202108210000_GLOBE_OLCI_V2.0.1.nc")

# and assigning a function to each images
# or better i can create a list from a common name

ndvi_list <- list.files(pattern="NDVI300")
ndvi_list # recall the list to have a look with the files

# [1] "c_gls_NDVI300_2014_08_010000_GLOBE_PROBAV_V1.0.1.nc"
# [2] "c_gls_NDVI300_2020_08_010000_GLOBE_OLCI_V2.0.1.nc"  
# [3] "c_gls_NDVI300_2020_08_110000_GLOBE_OLCI_V2.0.1.nc"  
# [4] "c_gls_NDVI300_2020_08_210000_GLOBE_OLCI_V2.0.1.nc"  
# [5] "c_gls_NDVI300_2021_08_010000_GLOBE_OLCI_V2.0.1.nc"  
# [6] "c_gls_NDVI300_2021_08_110000_GLOBE_OLCI_V2.0.1.nc"  
# [7] "c_gls_NDVI300_2021_08_210000_GLOBE_OLCI_V2.0.1.nc" 

# applying raster function to every image for better and fast analysis
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


#  creation of a stack of this different rasterlayer 
ndvi_stack <- stack(ndvi_rast)
ndvi_stack

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

names(ndvi_stack)<- c("August_2014",  "July_21", "August_01",  "August_11", "August_fire_01", "August_fire_11", "August_fire_21")

extReggio <- c(15.6296, 16.1973, 37.9463, 38.2839) # provincia di Reggio, Asprumunti.
stack_crop <- crop(ndvi_stack, extReggio)
stack_crop

# class      : RasterBrick 
# dimensions : 186, 270, 50220, 7  (nrow, ncol, ncell, nlayers)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : 15.5997, 16.40327, 37.84673, 38.4003  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# source     : r_tmp_2022-01-23_235322_7161_69049.grd 
# names      : August_2014,   July_21, August_01, August_11, August_fire_01, August_fire_11, August_fire_21 
# min values :      -0.076,    -0.080,    -0.080,    -0.080,         -0.080,         -0.080,         -0.080 
# max values :   0.9360001, 0.9360001, 0.9360001, 0.9360001,      0.9360000,      0.9360000,      0.9360000

# plot the stack cropped to see all the images
plot(stack_crop)


# i'd obtain a plotting point to see the loss of vegetation in seven years
plot(stack_crop$August_2014, stack_crop$August_fire_21)
abline(0,1, col="red")

#
plot(stack_crop$August_fire_01, stack_crop$August_fire_21)
abline(0,1, col="red")

# assign a name for a multitemporal analysis and better managing of the files
Aug_08_2014 <- stack_crop[[1]]
Aug_01_2020 <- stack_crop[[3]]
Aug_01_2021 <- stack_crop[[5]]
Aug_21_2021 <- stack_crop[[7]]
# or
Aug_08_2014 <- stack_crop$August_2014
Aug_01_2020 <- stack_crop$August_01
Aug_01_2021 <- stack_crop$August_fire_01
Aug_21_2021 <- stack_crop$August_fire_21


temporal_stack <-stack(Aug_08_2014, Aug_01_2020, Aug_21_2021, Aug_01_2021)
temporal_stack
# class      : RasterStack 
# dimensions : 114, 191, 21774, 4  (nrow, ncol, ncell, nlayers)
# resolution : 0.00297619, 0.00297619  (x, y)
# extent     : 15.62946, 16.19792, 37.94494, 38.28423  (xmin, xmax, ymin, ymax)
# crs        : +proj=longlat +datum=WGS84 +no_defs 
# names      : Aug_08_2014, Aug_01_2020, Aug_21_2021, Aug_01_2021 
# min values :      -0.076,      -0.052,      -0.080,      -0.080 
# max values :   0.9360001,   0.9360001,   0.9360000,   0.9360000 
# the situation is dramatically compromised, we must do something
# the people are out of their minds

plot(Aug_08_2014)
plot(Aug_01_2020)
plot(Aug_01_2021)
plot(Aug_21_2021)

#createing a colors palettes
clb<- colorRampPalette(c("darkblue","green","lightblue"))(100)
clg<- colorRampPalette(c("darkgreen","green","lightgreen"))(100)
clBk<- colorRampPalette(c("red","green","black"))(100)

#plot the images and assign the color

####################### not necessary ####################
par(mfrow=c(2,3))
plot(Aug_08_2014, col=clb)
plot(Aug_08_2014, col=clg)
plot(Aug_01_2021, col=clb)
plot(Aug_01_2021, col=clg)
plot(Aug_21_2021, col=clb)
plot(Aug_21_2021, col=clg)

# I want to see the images from january 2014 and january 2020
#extraxt them from the stack


# I want to see if there is a difference in this two period

difcl <- colorRampPalette(c("yellow","red","black"))(100) # create the color ramp palette
Vegdif <- Aug_08_2014 - Aug_21_2021 # make the difference

# looking for vegetation difference 
plot(Vegdif, col=difcl) # plotting the images 
plot(Vegdif, col = rev(terrain.colors(10)), main = "layer")


#clustering for a better analysis. choose two nclass a
nsuper_stack_14 <- unsuperClass(temporal_stack$Aug_08_2014,nSamples = 21774, nStarts = 25,nIter = 100, norm = FALSE, clusterMap = TRUE, nClasses=2)
nsuper_stack_20 <- unsuperClass(temporal_stack$Aug_01_2020,nSamples = 21774, nStarts = 25,nIter = 100, norm = FALSE, clusterMap = TRUE, nClasses=2)
nsuper_stack_21.01 <- unsuperClass(temporal_stack$Aug_01_2021,nSamples = 21773, nStarts = 25,nIter = 100, norm = FALSE, clusterMap = TRUE, nClasses=2)
nsuper_stack_21.21 <- unsuperClass(temporal_stack$Aug_21_2021,nSamples = 21774, nStarts = 25,nIter = 100, norm = FALSE, clusterMap = TRUE, nClasses=2)

#plot the cluster images
par(mfrow=c(2,2))
plot(nsuper_stack_14$map, main= 'Agosto 2014')
plot(nsuper_stack_20$map, main= 'Agosto 2020')
plot(nsuper_stack_21.01$map, main= 'Agosto 2021-01')
plot(nsuper_stack_21.21$map, main= 'Agosto 2021-21')


freq(nsuper_stack_14$map)
freq(nsuper_stack_20$map)
freq(nsuper_stack_21.01$map)
freq(nsuper_stack_21.21$map)

# freq(nsuper_stack_14$map)
#      value count
# [1,]     1 10645
# [2,]     2 11129
# freq(nsuper_stack_20$map)
#      value count
# [1,]     1 12515
# [2,]     2  9259
# freq(nsuper_stack_21.01$map)
#      value count
# [1,]     1 11062
# [2,]     2 10711
# [3,]    NA     1
# freq(nsuper_stack_21.21$map)
#      value count
# [1,]     1 10038
# [2,]     2 11736

totale <- 10038 + 11736
totale_21.01 <- 11062 + 10711

prop_ndvi_2014 <- 10645/totale 
prop_ndvi_2014.1 <- 11129/totale 

prop_ndvi_2020 <- 12515/totale
prop_ndvi_2020.1 <- 9259/totale


prop_ndvi_2021.01 <- 11062/totale_21.01
prop_ndvi_2021.01.1 <- 10711/totale_21.01


prop_ndvi_2021.21 <- 10038/totale
prop_ndvi_2021.21.1 <- 11736/totale

prop_ndvi_2014 
prop_ndvi_2014.1

prop_ndvi_2020 
prop_ndvi_2020.1

prop_ndvi_2021.01
prop_ndvi_2021.01.1

prop_ndvi_2021.21
prop_ndvi_2021.21.1

# Cells with NDVI values greater than 0.4 are definitely vegetation. The following operation masks all cells that are perhaps not vegetation.
veg <- reclassify(ndvi, cbind(-Inf, 0.4, NA))
plot(veg, main='Vegetation')
land <- reclassify(ndvi, c(-Inf, 0.25, NA,  0.25, 0.3, 1,  0.3, Inf, NA))
plot(land, main = 'What is it?'
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


naip_ndvi_ov <- overlay(veg_cropped[[1]], veg_cropped[[7]]], fun = normalized_diff)




