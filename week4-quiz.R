## Quiz 4 -
  # Solutions are provided with brief explanation. Use with care.
# Q1 What is produced at the end of this snippet of R code?
  set.seed(1)
  rpois(5, 2)
# Q2 What R function can be used to generate standard Normal random variables?
  rnorm
# Q3 When simulating data, why is using the set.seed() function important? Select all that apply.
  # It can be used to specify which random number generating algorithm R should use, ensuring consistency and reproducibility.
# Q4 Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution?
  # ppois gives the cumulative distribution function while
  # qpois give its inverse
# Q5 What does the following code do?
  set.seed(10)
  x <- rep(0:1, each = 5)
  e <- rnorm(10, 0, 20)
  y <- 0.5 + 2 * x + e # normal linear model
# Q6 What R function can be used to generate Binomial random variables?
  # r is used as a prefix to generate random variable
# Q7 What aspect of the R runtime does the profiler keep track of when an R expression is evaluated?
  # the function call stack
# Q8 (Assume that y, x1, and x2 are present in the workspace.) 
  # Without running the code, what percentage of the run time is spent in the 'lm' function, based on the 'by.total' method of normalization shown in 'summaryRprof()'?
  library(datasets)
  Rprof()
  fit <- lm(y ~ x1 + x2)
  Rprof(NULL)
  # 100% 
  # When using 'by.total' normalization, the top-level function (in this case, `lm()') always takes 100% of the time.
# Q9 When using 'system.time()', what is the user time?
  # It is the time spent by the CPU evaluating an expression
# Q10 If a computer has more than one available processor and R is able to take advantage of that, then which of the following is true when using 'system.time()'?
  # elapsed time may be smaller than user time
  