source("complete.R")
corr <- function( directory, threshold = 0){
  #find number of observations
  obs <- complete("specdata")
  obsid <- obs[obs$nobs > threshold,]
  returnvector <- numeric()

    # Loop trough all files in the id parameter
  for(index in obsid$id){
    # Obtain directory and filename
    filename = paste(directory,"/", formatC(index, width=3, flag="0"),".csv",sep="")
    
    #Read file
    polldata = read.csv(filename)
    
    # Find number of observations and put them in the result dataframe
    comp <- polldata[complete.cases(polldata),]
    
    # Find the corr values and add it to the returnvector
    returnvector <- c(returnvector, cor( comp$sulfate, comp$nitrate ) )  
  }
  
  returnvector
}