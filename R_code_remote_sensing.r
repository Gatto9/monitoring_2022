# R code for ecosystem monitoring by remote sensing
# First of all, we need to install additional packages
# raster package to manage image data
# https://

install.packages("raster")

library(raster)


# we are going to import satellite data
# object cannot be number
l2011 <- brick("p224r63_2011.grd")

l2011

plot(l2011)

#B1 us the reflectance in the blue band
#B2 us the reflectance in the green band
#B3 us the reflectance in the red band


colorRampPalette(c("black","grey","light grey"))(100) 


cl <- colorRampPalette(c("black","grey","light grey"))(100) 
plot(l2011, col=cl)


plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")


