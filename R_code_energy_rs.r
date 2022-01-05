# R code for estimating energy in ecosystems
# install.packages("raster")
# install.packages("rgdal")

library(raster)
## Loading required package: sp

library(rgdal)

# Set the working directory
setwd("~/lab/") # Linux
# setwd("C:/lab/") # windows
# setwd("/Users/name/lab/") # mac

# importing the data
l1992 <- brick("defor1_.jpg") # image of 1992
l1992

# name's Bands: defor1_.1, defor1_.2, defor1_.3
# plotRGB

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

# inverting the NIR in the Green component what we'll see all fluo/green this representing the forest with the near infrared mounted on the green component on the RGB 

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")





