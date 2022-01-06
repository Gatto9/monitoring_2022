# R code for estimating energy in ecosystems
# install.packages("raster")
# install.packages("rgdal")

library(raster)
## Loading required package: sp

library(rgdal)

# Set the working directory
# setwd("~/lab/") # Linux
# setwd("C:/lab/") # windows
setwd("/Users/macisimonegatto/Desktop/lab/") # mac

# importing the data
l1992 <- brick("defor1.jpg") # image of 1992

l1992
# information about the image

# plotRGB

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

# name's Bands: defor1.1, defor1.2, defor1.3
# defor1.1= NIR
# defor1.2= Red
# defor1.3= Green

# inverting the NIR in the Green component what we'll see all fluo/green 
# this representing the forest with the near infrared mounted on the green component on the RGB 

plotRGB(l1992, r=2, g=1, b=3, stretch="Lin")

# lesson of friday 19/11 
## lesson 2

# we can see in rio pexoto the amount of solid inside the river is smaller
# the amount of dispersed soil inside the river is smaller since here we can see that the river is blue in this case 
# instead of white as in the other case
# the water is absorbing the all NIR. it will became black when there is a complete absorbtion, pure water

# par

par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# if we have 3 RGB layers of an images and want two use only two of we'll have a new layer called DVI 
# which it'll have a new value for the pixel of forest that we are going to consider

# let's calculate energy in 1992
# $ --> it is used to link the image with its internal band

dvi1992 <- l1992$defor1.1 - l1992$defor1.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme and 100 is the amount of color
plot(dvi1992, col=cl)

# do the same thing for the energy in 2006
dvi2006 <- l2006$defor2.1 - l2006$defor2.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi2006, col=cl)

# all the yellow part are the energy completely lost 
# energy which is been removed from the sistem 
# oxgygen which is been removed for us 

# differencing two images of energy in two different times
dvidif <- dvi1992 - dvi2006

# plot the results

cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(dvidif, col=cld)
# all of the red part have a big loss of energy

# final plot: original images, dvis, final dvi difference
par(mfrow, c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
plotRGB(l2006, r=3, g=2, b=3, stretch="Lin")

# the two images in infrared represt the amount of energy that there are in the system and it had and lost in the present
# the images fifth images represent final amount of the energy which has been lost


# pdf() function to export the output of our code
pdf("energy.pdf")
par(mfrow= c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
plotRGB(l2006, r=3, g=2, b=3, stretch="Lin")
dev.off()
