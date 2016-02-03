staterank <- function(substate, colnum, num) {
  # Get number of hospital with data
  n <- dim(substate[!is.na(substate[,colnum]), ])[1]
  # Get hospital names:
  hosname <- substate[,2]
  # Handle special cases:
  if(num == "best") {
    rank <- 1
  } else if(num == "worst"){
    rank <- n # number of hostpitals in the state
  } else if(num > n) {
    return(NA)
  } else {
    rank <- num
  }
  ## Return hospital name in that state with the given rank
  result <- hosname[order(substate[,colnum], hosname)[rank]]
  return(result)
}

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  # Change data type from character to numeric
  dat[, 11] <- as.numeric(dat[, 11]) # heart attack
  dat[, 17] <- as.numeric(dat[, 17]) # heart failure
  dat[, 23] <- as.numeric(dat[, 23]) # pneumonia
  statevec <- sort(unique(dat$State))
  ## Check that outcome are valid
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop("invalid outcome")
  }
  
  for(i in 1:length(statevec)){
    substate <- dat[dat$State == statevec[i], ]
    hosname <- substate[,2]
    # Get number of hospital with data
    if(outcome == "heart attack") {
      hosplist[i] <- staterank(substate, 11, num)
    } else if (outcome == "heart failure") {
      hosplist[i] <- staterank(substate, 17, num)
    } else {
      hosplist[i] <- staterank(substate, 23, num)
    }
  }
  output <- data.frame("hospital"=hosplist,"state"=statevec)
  return(output)
}