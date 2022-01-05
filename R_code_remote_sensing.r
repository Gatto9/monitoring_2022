# R code for ecosystem monitoring by remote sensing
# First of all, we need to install additional packages
# raster package to manage image data
# https://

install.packages("raster")

library(raster)

setwd("/Users/macdisimonegatto/Documents/R/lab")

# we are going to import satellite data
# object cannot be number

l2011 <- brick("p224r63_2011.grd")

# we use brick function to import a satellite immage
# rasterbrick is a multilayer function
l2011

plot(l2011)

# B1 us the reflectance in the blue band
# B2 us the reflectance in the green band
# B3 us the reflectance in the red band


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

# do the same thing usig dark blue, blue and light blue, e.g clb

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

# our eyes cannot see over 0.59 micrometers
# melenconia è un quadro con il quadrato dei pixels
# parakana is the most forest with pollutant
# grd(grid) is a structure that we use to made a code
# brick function to import a satellite immage

#----------------DAY 3

plot(l2011$B1_sre)

# plot the blue band using a blue colorRampPalette
clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(l2011$B1_sre, col=clb)

# multiframe

par(mfrow=c(1,2)) # the first numer is the number of row in the multiframe,
clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(l2011$B1_sre, col=clb)

clg <- colorRampPalette (c("dark green","green","light grey"))(100)
plot(l2011$B1_sre, col=clg)

#confronta i quattro colori
par(mfrow=c(2,2)) 



clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(l2011$B1_sre, col=clb)

clr <- colorRampPalette(c("dark red", "red", "pink"))(100)
plot(l2011$B2_sre, col=clr)

clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(l2011$B3_sre, col=clg)

clnir <- colorRampPalette(c("dark red","orange", "yellow"))(100)
plot(l2011$B4_sre, col=clnir)

dev.off()


par(mfrow=c(2,2))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") # natural colours
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin") # false colours

par(mfrow=c(2,2))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") # natural colours
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin") # false colours


#----------------------FINAL DAY ON THIS CODE TROPICAL FOREST RESERVE
# Showcasing project monitor the change of biodiversity in farmlands in Europe, how agriculture is impacting the biodiversity over the all european countries, taken drone's immages 

# reflectants is the ratio between the reflected waveland, the amount of reflected energy and the incoming energy. if it is evrything absorbed we'll achieve 0, if everything is reflect we'll achieve 1. we'll consider only the range between 0,  4 to 0,7

plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")

# importing past data

l1988 <- brick("p224r63 1988.grd")
l1998 #to see the values of the data packages (class, dimension, resolution and so on)

par(mfrow=c(2,1))
plotRGB(l1998, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")

# Put the NIR in the blue channel

plotRGB(l1998, r=2, g=3, b=4, stretch="Lin")
plotRGB(l2011, r=2, g=3, b=4, stretch="Lin")



