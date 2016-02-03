complete <- function(directory , id = 1:332) {
  fullfiles <- list.files(directory, full.names = TRUE) ## list of all files in the directory
  myframe <- data.frame() ## initialize data frame
  for(i in id) { 
    myfile <- read.csv(fullfiles[i]) ## read the single .csv file into the myfile data frame
    nobs <- sum(complete.cases(myfile)) ## to count the complete observants
    temp <- data.frame(i,nobs) 
    myframe <- rbind(myframe, temp)
  }
  return(myframe)
}