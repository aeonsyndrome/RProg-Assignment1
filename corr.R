corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  filelist <- list.files(directory)
  
  ## calculate number of completely observed observations for all monitors
  observations <- complete(directory, 1:length(filelist))
  
  ## remove those with observations under threshold
  observations <- subset(observations, observations$nobs > threshold)
  
  output <- vector(length=length(observations$id))
  
  for (i in observations$id){
    ## read data
    csv_data <- read.csv(paste(directory,filelist[i],sep="/"))
    
  }
  
  observations
  ##observations
  
}
