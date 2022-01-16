# R_code for ice melt in Greenland


# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma


setwd("/Users/macdisimonegatto/Deskop/lab/greenland")

rlist <- list.files(pattern = "lst")
rlist


## [1] "lst_2000.tif" "lst_2005.tif" "lst_2010.tif" "lst_2015.tif"
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
##
##
## [[2]]
## class : RasterLayer
## dimensions : 1913, 2315, 4428595 (nrow, ncol, ncell)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## source : lst_2005.tif
1
## names : lst_2005
## values : 0, 65535 (min, max)
##
##
## [[3]]
## class : RasterLayer
## dimensions : 1913, 2315, 4428595 (nrow, ncol, ncell)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## source : lst_2010.tif
## names : lst_2010
## values : 0, 65535 (min, max)
##
##
## [[4]]
## class : RasterLayer
## dimensions : 1913, 2315, 4428595 (nrow, ncol, ncell)
## resolution : 1546.869, 1546.898 (x, y)
## extent : -267676.7, 3313324, -1483987, 1475229 (xmin, xmax, ymin, ymax)
## crs : +proj=stere +lat_0=90 +lon_0=-33 +k=0.994 +x_0=2000000 +y_0=2000000 +datum=WGS84 +units=m +no_defs
## source : lst_2015.tif
## names : lst_2015
## values : 0, 65535 (min, max)

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

plot(TGr)

































