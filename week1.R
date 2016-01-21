### Week 1 - R Programming @ Coursera

# to get working directory
getwd()
# to set working directory
setwd("/Users/Mind/Desktop")
# to obtain files inside the directory
dir()

## Entering Input
x <- 1
msg <- "hello"
x <- 1:20 # create a sequence

## Objects in R
# The most basic object is a 'vector'
# A vector can only contain objects of the same class.
# BUT: a 'list' can contain objects of different classes.
# Numbers in R are generally treated as double
# to specify integer you need to type 1L for 1

## Creating Vectors
x <- c("a","b","c") # character vector
x <- 9:19 # integer
x <- vector("numeric",length=10) #numerical vector, default = 0

## Coercsion
x <- 0:6
class(x) # "integer"
as.numeric(x)
as.logical(x)
as.character(x)

## Lists are a special type of vector. 
x <- list(1,"a",TRUE,1+4i)
# the elements are shown in double brackets around [[]]

## Matrices are vectors with dimension attribute
m <- matrix(nrow=2,ncol=3)
# initialize in NA values
attributes(m) #will return $dim 2 3

# cbind and rbind *very useful in combining data!
cbind(x,y)
rbind(x,y)

## Factors are used to represent categorical data
# Factors are self-describing. 
# Factors are important as they're treated specially by modelling functions
x <- factor(c("yes","yes","no","yes"))
table(x) # nicely shown
unclass(x) # bring it down

## Missing Values
is.na() 
is.nan() # mathematical undefined
# A NaN is also NA but the convers is not true

## Data Frames to store tabular data
row.names()
x <- data.frame(foo=1:4, bar=c(T,T,F,T))
x <- read.csv() # another way to create data frame

## Names Attribute:
# to assign name
names(x) <- c("foo","bar","norf")
x <- list(a=1,b=2,c=3)
names(x) # will be a b and c accordingly





