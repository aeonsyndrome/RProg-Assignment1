complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  filelist <- list.files(directory)
  
  # create empty data table
  output <- data.frame(id = integer(), nobs = integer())
  tags <- colnames(output)
  
  ## loop over id files
  for(i in id) {
    ## read data
    csv_data <- read.csv(paste(directory,filelist[i],sep="/"))
    complete <- complete.cases(csv_data) ## find rows where data is available
    csv_data <- csv_data[complete,] ## remove NA rows
    
    ## calculate number of full observations
    observations <- nrow(csv_data)
    
    ## add row to output
    output <- rbind(output,c(i,observations))
  }
  
  ## print output
  colnames(output) <- tags
  output
}