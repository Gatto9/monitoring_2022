# R_code_multivar.r
install.packages("vegan")
library(vegan)
## Loading required package: permute
## Loading required package: lattice
## This is vegan 2.5-7
setwd("/Users/macdisimonegatto/Desktop/lab/")
load("biomes_multivar.RData")
ls()
## [1] "biomes" "biomes_types" "cl" "snow2000"

# plot per species matrix
biomes

multivar <- decorana(biomes)
multivar

##
## Call:
## decorana(veg = biomes)
##
## Detrended correspondence analysis with 26 segments.
## Rescaling of axes with 4 iterations.
##
## DCA1 DCA2 DCA3 DCA4
## Eigenvalues 0.5117 0.3036 0.12125 0.14267
## Decorana values 0.5360 0.2869 0.08136 0.04814
## Axis lengths 3.7004 3.1166 1.30055 1.47888
plot(multivar)
# biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)

pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()
