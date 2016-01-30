## Week 2 - R Programming 
# Control Stuctures

# If-Else
  if(condition){
    ## do something
  } else if(condition2) {
    ## do something else
  } else {
    ## others
  }

    # Example:
        if(x>3){
          y<-10
        } else {
          y<-0
        }
      # which is the same as:
        y <- if(x>3) {
          10
        } else {
          0
        } # all about assigning the value to y

# For Loops
    x <- c("a","b","c","d")
    for(i in 1:4){
      print(x[i])
    }
  # or
    for(i in seq_along(x)){ # generate the sequence based on the length of x
      print(x[i])
    }
  # or
    for(letter in x){ # index doesn't have to be integers
      print(letter)
    }
  # in short, for the single expression:
    for(i in 1:4) print(x[i])
  
  # Useful commands for creating index vector
  seq_len(4) # is the same as 
  1:4 # create a vector 
  
# While Loops
  count <- 0
  while(count < 10){
    print(count)
    count <- count+1
  }
  # use with care!
  # multiple conditions: use logical operators:
    while(z>=3 && z<=10){
      print(z)
      coin <- rbinom(1,1,0.5) #random coin flip here
      if(coin==1){
        z <- z+1
      } else {
        z <- z-1
      }
    }
# Repeat Loop 
  # is an infinite loop the only way to terminate is to call 'break
  repeat {
    # do sth
    if(condition) {
      break
    }
  }
  # better using for loop to set the hard limit so that it will stop
  
# Next and Return
  next # is used to skip an iteration of a loop
  break # is used to exit the function
  return # signals that a function should exit and return a give value
  
# Written a function
  add2 <- function(x,y){
    x+y
  }
  add2(3,4) # basically return the sum
  
  above10 <- function(x){
    use <- x>10
    x[use]
  }
  # now extend to arbitary number 'n'
  above <- function(x,n){
    use <- x>n
    x[use]
  }
  # setting the default value n to 10
  above <- function(x,n=10){
    use <- x>n
    x[use]
  }  
  # A more complicated function: finding the column mean of a matrix
  columnmean <- function(y, removeNA = TRUE){
    #check number of columns:
    nc <- ncol(y)
    means <- numeric(nc)
    for(i in 1:nc){
      means[i] <- mean(y[,i], na.rm=removeNA)
    }
    means
  }
  columnmean(airquality,FALSE)
  
# Functions
  f <- function(set of arguments>){
    ## do something
  }
# Functions can be passed as arguments to other functions
# Function arguments can be missing or might have default values
  # Argument Matching: R functions arguments can be matched positionally or by name
  # Named arguments are useful esp. for the function with a very long argument name
  
  # The "..." Arguments:
  # ... is often used when extending another function and you don't want to copy the entire argument list of the original function
  # For example:
  myplot <- function(x,y, type = "1", ...) {
    plot(x,y,type=type,...)
  }
  # function 'paste'
  args(paste)
  # will show 
  function (..., sep = " ", collapse = NULL) 
  # Note: any arguments that appear after ... on the list must be named explicity and cannot be partially matched!
    paste("a","b", sep = ":")
    paste("a","b", se = ":") # will be regarded as ...
  
# A diversion on binding values to symbol
    # in the case that you declare variable to be the same as function name
    # e.g. lm is a function. But if you declare lm a variable:
    # R search global environment first, thus, will treat it as a variable
    # *Note: R has separate namespaces for functions and non-functions so it's possible to have an object named c and a function named c
    
# Lexical Scoping:
    f <- function(x,y){
      x^2 + y / z 
    }
    # How do we assign value to 'z' if 'z' is the free variable?
      # Ans: the values of free variables are searched for in the environment
      # in which the function was defined.
    # What is a environment?
      # it is a collection of paris (symbol and value)
      # a function + environment = a closure
    # Why does this matter?
      # In R, function can be defined inside a function.
      # that's a function can return another function
    # Check the function's environment, simply using ls function
      ls(environment(functionname))
    # Optimization in R
      optim()
      nlm()
      optimize()
      
# Dates in R
  x <- as.Date("1970-01-01") # this is 'zero day'
  unclass(x) # will give zero
# Times in R
  weekdays() # tell the day
  months() # tell the month
  quaters() # tell the quaters
  # Example:
  x <- Sys.time()
  x # print out year month date time
  p <- as.POSIXlt(x)
  names(unclass(p))
  p$sec # this is to extract the seconds
     
# strptime
  # to convert string into time object
  x <- strptime(datestring, "...")
  # DON'T remember the formatting strings, check ?strptime for details

## Summary:
  date()
  as.Date()
  as.POSIXlt()
  # Date and times have special classes in R that will help you deal with all the execptions such as leap year and time zones.
  