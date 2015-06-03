pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  ## init both counters
  sum_pollutant <- 0
  count_pollutant <- 0
  
  # get filelist
  filelist <- list.files(directory)
  
  ## loop over id files
  for(i in id) {
    
    ## read data
    csv_data <- read.csv(paste(directory,filelist[i],sep="/"))
    complete <- complete.cases(csv_data[[pollutant]]) ## find rows where data is available
    csv_data <- csv_data[complete,] ## remove NA rows
    
    ## update measures
    sum_pollutant <- sum_pollutant + sum(csv_data[[pollutant]])
    count_pollutant <- count_pollutant + length(csv_data[[pollutant]])
  }
  
  ## calculate mean
  mean_pollutant <- if (count_pollutant == 0) {
    NA ## no data read
  }
  else { 
    sum_pollutant / count_pollutant
  }
  # output
  mean_pollutant
}
