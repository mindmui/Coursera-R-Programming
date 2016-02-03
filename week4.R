## Week 4 - R Programming
setwd("/Users/Mind/Desktop/R Coursera/Github/ProgAssignment3")
      
# str - compactly display the internal STRucture of an R object
  str(str) # shows that it's a function that takes an object
  str(lm) # shows the arguments of the function
  
  x<- rnorm(100,2,4)
  summary(x)
  # apply str to vectors instead of functions:
    str(x) # give fist 5 numbers
  # apply str to other types of vectors:
    f <- gl(40,10)
    str(f)
  # apply str to the data set
    str(airquality)
      # for each variable, str gives a bit of information and first few values
  # In short, str give a good quick summary on the object
  # ** most useful function in R **

# Simulation    
  # Generating Random Numbers: from a given distribution
    rnorm # random 'variable' generation
    dnorm # d for density
    pnorm # cumulative distribution
    qnorm # quartile distribution
      # Note: if phi() is the cumulative distribution function for a std normal distribution
        # then pnorm() = phi() and qnorm() = inverse of phi() 
    rpois # Poisson Distribution (with parameter lambda)
    dpois # ... similar to _norm
      # you can always add 'r' 'd' 'p' 'q' in front of the distribution 
      # such as 'norm', 'pois', 'gamma', ...
    
    # example:
      rnorm(10,mean=20,sd=2) # a vector of 10 random numbers with mean =2, sd =2
    
  # Setting a seed, to ensure reproducibility
    # if you want to generate the same set of number AGAIN
      set.seed(1) # reset the seed to be 1
      rnorm(5)
    # this is called pseudo-random number generator
    # this allows you to reproduce the same numbers 

  ## Generating Random Numbers from a linear model:
    x <- rbinom(100,1,0.5)
    e <- rnorm(100,0,2) # error term
    y <- 0.5 * x + e
    plot(x,y)

  ## Random Sampling
    # to generate random samples
    sample(1:10,4) # random 4 from 1 to 10 without replacement
    sample(letters, 5)
    sample(1:10) # by default it will be the permutation
    sample(1:10, replace = TRUE)
    
# Profiler in R
  # tools to help you 'optimize' the software:
    # Is you code running slow?
  # examine how much time is being spent in different parts of a program
    # profiling is better than guessing!
    
  # Using system.time(EXPRESSION HERE)
    # user time is the CPU running time
    # ellasped time is the time you spent waiting for
    ## example:
      system.time(readLines("http://www.mind.in.th"))
    # to time longer expressions
      # simply wrap everything inside {}
       system.time({  })
  # Going beyond system.time()
    # this may only be useful for a small function 
    # or you already know where to start
  # R Profiler
    Rprof() # keeps track of the function call stack, how much time spent
    summaryRprof()
    # Remark: Don't use system.tim() and Rprof() together! at the same time
    # Methods for normalizing the data you get from the Rprof()
      # by.total
      # by.self <- highlighting specific part
  # In conclusion, it is good to break your code into functions so that the profiler
    # can give useful information about where time is being spent
