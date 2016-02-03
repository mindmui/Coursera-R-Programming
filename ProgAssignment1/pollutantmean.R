pollutantmean <- function(directory, pollutant, id=1:332) {
  fullfiles <- list.files(directory, full.names = TRUE)
  dat <- data.frame()
  for(i in id) { ## loop through files in the directory
    dat <- rbind(dat, read.csv(fullfiles[i])) ## combine the data using rbind
  }
  ## Return the mean of the pollutant across all monitors list in the id vector
  mymean = mean(dat[,pollutant], na.rm=TRUE) ## igoring NA values
  return(mymean)
}
