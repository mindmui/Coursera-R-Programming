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
    
    