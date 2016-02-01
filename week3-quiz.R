## Week 3 Quiz
# Question 1
  # what is the mean of 'Sepal.Length' for the species virginica? 
    # Please round your answer to the nearest whole number.
  library(datasets)
  data(iris)
  head(iris)
  irisvir = iris[iris$Species=="virginica",]
  mean(irisvir$Sepal.Length)
# Question 2
  # what R code returns a vector of the means of the variables 
  # 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
  colMeans(iris[, 1:4])
   # or
  apply(iris[, 1:4], 2, mean)
# Question 3  
  # How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? 
  # Select all that apply.
  library(datasets)
  data(mtcars)
  head(mtcars)
    # Answers:
    sapply(split(mtcars$mpg, mtcars$cyl), mean)
    tapply(mtcars$mpg, mtcars$cyl, mean)  
    with(mtcars, tapply(mpg, cyl, mean))
# Question 4
    # what is the absolute difference between the average horsepower of 
    # 4-cylinder cars and the average horsepower of 8-cylinder cars?
  head(mtcars)
  # hp for cyl = 4 
    hp4 = mtcars[mtcars$cyl==4,]$hp
  # hp for cyl = 8
    hp8 = mtcars[mtcars$cyl==8,]$hp
  # take the diff between the mean
    mean(hp8)-mean(hp4)
# Question 5
    # what happens when you call 'ls' function after debug(ls)?
    debug(ls)
    ls
    