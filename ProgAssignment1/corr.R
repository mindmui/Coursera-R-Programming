corr <- function(directory, threshold = 0) {
  fullfiles <- list.files(directory, full.names = TRUE)
  vec <- vector(mode = "numeric", length = 0) ## initialize 
  
  for(i in 1:length(fullfiles)) {
    item <- read.csv(fullfiles[i])
    sumcomplete <- sum((!is.na(item$sulfate)) & (!is.na(item$nitrate)))
    # alternatively, use the defined function complete: complete(item)
    if(sumcomplete > threshold) { ## condition
      subitem <- item[complete.cases(item),]
      vec <- c(vec, cor(subitem$sulfate,subitem$nitrate))
    }
  }
  return(vec)

}
