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

## Reading Data
# One of the most commonly use function:
read.table(file = ,header = TRUE, ..) # lots of arguments 
# read.csv is identical to read.talbe except that the default seperator is a comma
read.csv() # most commmonly format
# Reading large table
help("read.table") # read carefully
# R use RAM, make sure your computer has enough (pre-calculate)
# initialize is useful for reading large data sets (what class of cols, how many rows)

# Textual Formats
dump()
dput()
# contains meta data, so that another user doesn't have to specify it all over again
# The only downside is that the format is not very space-efficient

# Connections to the outside world
con <- file("foo.txt","r")
data <- read.csv(con)
close(con)
# is the same as read.csv("foo.txt)
# However, it's useful for reading lines of a text file
con <- gzfile("words.gz")
x <- readLines(con, 10)

# Read from webpage
con <- url("http://www.google.com", "r")
x <- readLines(con)
head(x)

# Subsetting Objects in R
# - [ ] returns object of the same class as the original
# - [[]] is used to extract elements of a list or a data frame. It can only be used to extract a single element on a list
# - $ is used to extract elements of a list or data frame by "Name"
# Note: R start counting from 1 
x <- c("a","b","a","c","d")
x[1] # will return "a
x[x>"a"] # will return the logical vector

# Subsetting Lists*
x <- list(foo = 1:4, bar = 0.6)
x[1] # a list that contains 1:4
x[[1]] # a sequence 1 to 4
x$bar
# is equivalent to
x[["bar"]]
 
# Subsetting Matrix
x <- matrix(1:6,2,3)
x
# to obtain the first row
x[1,]
x[,1] # first column
x[1,2] # get number 3
x[1,2,drop=FALSE] # preserve the class --> 1x1 matrix 
# by default you don't get the sub matrix back: you get back elements

# Removing Missing (NA) Values **
# common operations in data analysis
# create a logical vector: where missing element is
bad <- is.na(x)
x[!bad] # vector without missing value
# for multiple sets:
# we use complete.cases()
good <- complete.cases(x,y)
# you can also use complete.cases(matrix) or (dataframe) too!
# this is a very handy function 

# Vectorized Operations (like MATLAB) -- easier & cleaner!
x <- 1:4
y <- 6:9
# these operations are element-wise
x+y
x>2
x==3
x*y
x/y
x %*% y ## for TRUE matrix multiplication (be careful of the dimension )

