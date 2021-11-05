# R code for ecosystem monitoring by remote sensing
# First of all, we need to install additional packages
# raster package to manage image data
# https://

install.packages("raster")

library(raster)

setwd("C:/lab/")

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

#---------------day 2

#B1 us the reflectance in the blue band
#B2 us the reflectance in the green band
#B3 us the reflectance in the red band
#B3 us the reflectance in the NIR band

# let's plot the green band
plot(l2011$B2_sre)

cl <- colorRampPalette (c("black","grey","light grey"))(100)
plot(l2011$B2_sre, col=cl)

# change the colorRampPalette with dark, green, and light green, e.g. clg

clg <- colorRampPalette (c("dark green","green","light grey"))(100)
plot(l2011$B2_sre, col=clg)

#do the same thing usig dark blue, blue and light blue, e.g clb

clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(l2011$B1_sre, col=clb)

# par can be used to change graphical function
par(mfrow=c(1,2))
plot(l2011$B2_sre, col=clb)
plot(l2011$B1_sre, col=clg)

# plot both images in just one multiframe graph with two rows and just one column
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

dev.off() #it close a plotting device (the graphs and so on)



