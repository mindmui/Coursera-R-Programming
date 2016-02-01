## Week 3 - R Programming
# Loop functions

# lapply : loop over a list of object to apply the function on each element
  # very useful*
  lapply(list,function,...)
    # example:
      x <- list(a=1:5, b=rnorm(10))
      y <- lapply(x,mean) # y is a list (lapply always come out as a list)
    # example #2:
      x <- 1:4
      lapply(x,runif, min=0,max=10) #runif is the random uniform between 0 to 1 (default)
    # lapply is commonly used with anonymous fn:
      x <- list(a= matrix(1:4,2,2), b= matrix(1:6,3,2))
      lapply(x, function(elt) elt[,1]) #anonymous function -- don't have the name!
      # it uses to extract the first column of each matrix
      
# sapply - will try to simplify the result of lapply if possible
      # simplify a list into a vector:
      x <- list(a=1:2,b=3:5)
      sapply(x,mean)
      
# apply - is used to evaluate a function over the margins of an array:
  # it is not really faster than writing a loop
  # the good thing about apply is that you type less! -- good programmers are lazy
  str(apply) # there are 4 arguments for apply
  # example:
     x <- matrix(rnorm(200),20,10) # 20 rows and 10 columns
     apply(x,2,mean) # taking the mean across the row --> left with 10 columns
     apply(x,1,mean) # margin = 1, preserves the row --> collapse all the columns
     # special functions that optimize to do this quickly:
      rowSums = apply(x,1,sum) # margin = 1, to preserve the row
      # if margin = 2, preserve the second dimension which is the column
      # if margin = c(1,2) then it means preserve the first two dimensions
  
# mapply - is the multivariate appply of sorts which applies a function in parallel over a set of arguments
  str(mapply)
  # Suppose we want to do this:
    list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
      # this is tedious, we can simply type:
    mapply(rep,1:4,4:1)
    mapply(noise, 1:5, 1:5, 2)
    
# tapply - apply a function over subsets of a vector
    x <- c(rnorm(10),runif(10),rnorm(10,1))
    f <- gl(3,10) # generate factor level
    f
    tapply(x,f,mean) # will take the mean for each group
    tapply(x,f,mean, simplify=FALSE) # by default it's true, FALSE will give you a list
    
# split - takes a vector or other objects and splits it into groups determined by a factor.
  # similar to tapply but without applying the function
    str(split)
  # example:
    x <- c(rnorm(10),runif(10),rnorm(10,1))
    f <- gl(3,10) # generate factor variables
    split(x,f) # always return a list back
      # and if you want to do something with this list, then you can use lapply or sapply
      # split + lapply = tapply --> to make things more compact
  # Splitting Data Frame: ** very useful
    head(airquality)
    s <- split(airquality, airquality$Month)
      # split according to month 
      # now we find the mean:
       lapply(s,function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm=TRUE))
       # lapply will return the list
      # what if we want to return a simplified result:
       sapply(s,function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm=TRUE))
        # get the means of the observed values as a matrix (3 values for each month)

# Debugging:
  # figuring what's wrong when you know there is an error
  # three main types of indications:
       # message -- a generic notification; execution continues
       # warning -- not necessary a fatal
       # error -- a fatal problem has occrued; stop execution
       # condition -- a generic concept for indicating that something unexpected can occur
  # example:
    # warning -- it's fine, execution occured
        log(-1)
    
# Tools in Debugging:
  # Most basic one:
    traceback() # prints out the function call stack after an error occurs
      # give the most recent error, if there is no error, the function will not be worked!
    debug() # "debug mode" allow you to step through a function line by line!
      # debug(lm) # to declare the debug mode
      # then when you call lm(y~x), it will be executed line by line
    browser() # suspends the execution of a function
    trace() # allows you to inster debugging code into a function a specific places
      # useful when you're editing somebody's code
    recover() # allows you to modify the error behaviour so that you can browse the function call stack
  # tips:
    print() 
    cat()
    # will also be useful for you
  # Note: Debugging tools are not a substitute for thinking