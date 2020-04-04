pollutantmean <- function( directory, pollutant, id=1:332 )
{
  #directory is a character vector, on my system specdata
  #pollutant is either sulfate or nitrate
  #id can be a specific vector
  
  #what to do
  # goto directory
  # process all files and match for the ids given
  # calculate the mean for all values that are not NA

  file.names <- list.files(directory)  #files from directory
  file.numbers <- as.numeric(sub('\\.csv$','', file.names)) # get the numbers from them
  selected.files <- na.omit(file.names[match(id, file.numbers)]) 
  #remove what is not selected
  
  #import data
  Data <- lapply(file.path(directory,selected.files),read.csv)
  
  #convert into data frame
  Data <- do.call(rbind.data.frame,Data)
  
  #calculate mean
  mean(Data[,pollutant],na.rm=TRUE)
  
  #wow, I am not a bad programmer
  #but this is one step too far at this moment.
  #did I really miss something
}

