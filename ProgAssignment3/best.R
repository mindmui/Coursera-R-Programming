best <- function(state, outcome) {
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
  # Get hospital names:
  hosname <- substate[,2]
  ## Return hospital name in that state with lowest 30-day death rate
  if(outcome == "heart attack"){
    min_index <- which(substate[,11] == min(substate[,11], na.rm = TRUE))
    return(hosname[min_index])
  } else if(outcome == "heart failue"){
    min_index <- which(substate[,17] == min(substate[,17], na.rm = TRUE))
    return(hosname[min_index])
  } else {
    min_index <- which(substate[,23] == min(substate[,23], na.rm = TRUE))
    return(hosname[min_index])
  }
} 
# best("MD", "heart attack")