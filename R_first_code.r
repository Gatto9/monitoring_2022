# This is my firs code in github! quite exciting, right?

# Here are the input data
# Costanza data on streams
water <- c(100, 200, 300, 400, 500)
water

# Marta data on fishes genomes
fishes <- c(10, 50, 60, 100, 200)
fishes

# plot the diversity of fishes (y) versus the amount of water (x)
# a function is used with argument inside
plot(water, fishes)

# the data we developed can be stored in a table
# a table in E is called data frame

stream <- data.frame(water, fishes)
stream

#From now on, we are going to import and/or export data!
#setwd for Windows
#setwd (setting work directory)
#getwd (what is the directory)

setwd(C:/lab/)
water <- c(100, 200, 300, 400, 500)
> 

> stream <- data.frame(water, fishes)
> stream
  water fishes
1   100     10
2   200     50
3   300     60
4   400    100
5   500    200

# Let's export our table
# x è l'oggetto preferibilmente una matrice o un data frame

write.table(streams, file="my_first_table.txt)

some colleagues did send us a table How to import in R
read.table("my first_table.txt")

#let's assign it to an object inside R
simonetable <- read.table("my_first_table.txt")

#the first statistics for lazy beautiful people
 summary (simonetable)

#marta don't like the water
#marta want to get info only on fishes
summary(simonetable$fishes)

#histogram
hist (simonetable$fishes)
hist (simonetable$water)


