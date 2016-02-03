rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(!state %in% dat[,7]){
    stop("invalid state")
  }
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop("invalid outcome")
  }
  # Filter state:
  substate <- dat[dat[,7]==state,]
  # Change data type from character to numeric
  substate[, 11] <- as.numeric(substate[, 11]) # heart attack
  substate[, 17] <- as.numeric(substate[, 17]) # heart failure
  substate[, 23] <- as.numeric(substate[, 23]) # pneumonia
  # Get number of hospital with data
  if(outcome == "heart attack") {
    n <- dim(substate[!is.na(substate[,11]), ])[1]
  } else if(outcome == "heart failure") {
    n <- dim(substate[!is.na(substate[,17]), ])[1]
  } else {
    n <- dim(substate[!is.na(substate[,23]), ])[1]
  }
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
  if(outcome == "heart attack") {
    result <- hosname[order(substate[,11], hosname)[rank]]
    return(result)
  } else if(outcome == "heart failure") {
    result <- hosname[order(substate[,17], hosname)[rank]]
    return(result)
  } else {
    result <- hosname[order(substate[,23], hosname)[rank]]
    return(result)
  }
  
}
