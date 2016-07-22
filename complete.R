complete <- function( directory, id = 1:332){
  
  # Create an empty dataframe
  comp <- data.frame()
  
  # Loop trough all files in the id parameter
  for(index in id){
    # Obtain directory and filename
    filename = paste(directory,"/", formatC(index, width=3, flag="0"),".csv",sep="")
    
    #Read file
    polldata = read.csv(filename)
    
    # Find number of observations and put them in the result dataframe
    comp <- rbind( comp, c(index,nrow(polldata[complete.cases(polldata),])))
  }
  
  # give column names and return the complete cases with ID and Number
  colnames(comp) <- c("id", "nobs")
  comp
  
}