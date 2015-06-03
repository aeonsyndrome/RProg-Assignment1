## Results to find: https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fpollutantmean-demo.html

## setwd("My Box Files/DataSciTraining/Repos/RProg-Assignment1")

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
  
  sum_pollutant <- 0
  count_pollutant <- 1
  
  filelist <- list.files(dir)
  
  for(i in id) {
    csv_data <- read.csv(paste(dir,filelist[i],sep="/"))
    
  }
  
  
  complete <- complete.cases(csv1)
  csv1[complete,]
  
  mean_pollutant <- sum_pollutant / count_pollutant
  mean_pollutant
}

## tests
pollutantmean(directory="specdata/",pollutant="sulfate")