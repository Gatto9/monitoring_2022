# R code for ecosystem monitoring by remote sensing
# First of all, we need to install additional packages
# raster package to manage image data
# https://

install.packages("raster")

library(raster)


# we are going to import satellite data
# object cannot be number
l2011 <- brick("p224r63_2011.grd")


