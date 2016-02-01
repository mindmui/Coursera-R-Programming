## Week 3 Quiz
# Question 1
  library(datasets)
  data(iris)
  head(iris)
  irisvir = iris[iris$Species=="virginica",]
  mean(irisvir$Sepal.Length)
# Question 2
  colMeans(iris[, 1:4])
   # or
  apply(iris[, 1:4], 2, mean)
# Question 3
  library(datasets)
  data(mtcars)
  head(mtcars)
  sapply(split(mtcars$mpg, mtcars$cyl), mean)
  tapply(mtcars$mpg, mtcars$cyl, mean)  
  with(mtcars, tapply(mpg, cyl, mean))
# Question 4
  