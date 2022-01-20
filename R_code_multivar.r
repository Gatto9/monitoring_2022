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


########################## code from sara piccini ################################
load("biomes_multivar.RData") 
#list files (objects) inside data (also temporary ones) with "ls" function, also files previously used
ls() 

# two important data starting with biomes: biomes and biomes_types
biomes
# we can see all data set (very huge) and how data set is composed : plot (rows) vs. species (columns)
# we can see number of individuals for different plots: ex first plot with 1 chestnut (castania sativa) and the others 0 -> this is a plot in temporary forest
# second plot: chestnus, acer, lichens -> temporary forest too
# plot number 17: rafflesia and giant orb -> 
# 20 plots in total 
biomes_types
# for each plot we know the type of the biome: temperate, tundra, conifer forest...
# 2 different data set

# use the detrended correspondence analysis called decorana (multivariate analysis: sort of PCA compatting the set perfect to see species in two dimensions)
# decorana function with biomes dataset
multivar <- decorana(biomes)
multivar
# we can see the call : decorana function 
# we can see the first 4 axes. eiganvalues represents the amount of variance explain by the different axes 
# with two axes (the first one and the second one: DCA1 explain most tof the variance and DCA2 a bit less) we have a total explained variability of 81 %. Instead of 20 potential axes we can compact the system to 2 different axes
# we use the first two axes in the method since they show the most part of the variance! We can explain all the potentail 
# real lenght different corresponding to variance explained by axes
# we use them to make a plot
# how to plot the result:
plot(multivar)
# at the end we are explaining 80% of variance
# we sqeeze data in two axes: red items are species and points are axes of the original plots - how different plots are scattered in the new sysytem of two axes
#red colubus is close to tropical species: ex: giant orb and tree fern rafflesia dinoponera tiger -> related to tropical system (maybe)
# at the bottom we can see other species
# plot the biome sytes inside the plot of the multivariate systms: use function called ordie ellipse
# this function explains if species are grouped in the same biome or not
# ordihull: multivariate diagram and you add the ellipse (hull: include plots in a certain biome)
# attach dataset with attach function: attach set of r objects to attach biomes types to use them to the ellipse
# let's take a look at the gouping of species. Are they in the same biome?
attach(biomes_types)
# first explain the multivariate space in which we want to put the ellipse, than the type of biome insinde the biome_types table and column in type and we want to use this columns to make the ellipse
#conjunction with all of the plots with the same type
#we can choose colors to represent 4 different biomes and so 4 different ellipse
#explain ehull:convex shape which is incoportating all the plots
#thickness of the line
ordiellipse(multivar, type, col=c("black","red","green","blue"), kin="ehull", lwd=3)
#here we can see 4 different ellipse: these are making a sort of conjunction of plots in one shape, most small possible ellipse containing the plots
#DC1 and DC2 are the axes
#name of the biome: tropical connecting the label with the point called spider -> ordispider function
#inside the manual vegan we can find the description of the functions
#spider graphical stuff with colors of the labels 
ordispider(multivar, type, col=c("black","red","green","blue"), label=TRUE)
#spiders joint in the label the point 
#in the tropical forest we can see that these species are connected and they belong to the same biome
#some species are a bit set aside but in the same zone of the multivaiate system: they are still in the tropical forest
#the core is the ellipse
#we can see the species from each one of the biomes
#we can have interconnections between different plots: we can find lichens in tundra and coniferous forest since nature is not linear without borderd
#now we can understand how the abundancies of the individuals are connected to each other to different species and biomes (or land use, park..)
#the composition of species will change if we deleate a biome (agriculture will take the place of tropical)
# in a community how different organisms are related: multivariate analisys




