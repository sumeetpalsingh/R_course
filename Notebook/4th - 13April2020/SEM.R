sem <- function(data, multiply=1){
  sd.data <- sd(data) # calculate stdev
  number.samples <- length(data)
  sem.data <- sd.data/sqrt(number.samples)
  return(sem.data * multiply)
} 

cv <- function(data){
  sd.data <- sd(data)
  mean.data <- mean(data)
  cv.data <- sd.data / mean.data
  return(cv.data)
} 