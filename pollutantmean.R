pollutantmean <- function(directory, pollutant, id = 1:332){
  
  # Create an empty vector used for calculating the mean at the end.
  pollvector <- numeric()
  
  # Loop trough all files in the id parameter
  for(index in id){
    # Obtain directory and filename
    filename = paste(directory,"/", formatC(index, width=3, flag="0"),".csv",sep="")
    
    #Read file
    polldata = read.csv(filename)
    
    # Increase the vector with the column of the file that is selected with pollutant param.
    pollvector <- rbind( pollvector, polldata[!(is.na(polldata[pollutant])),][pollutant] )   
  }
  
  # return the mean
  mean(pollvector[[1]])
}