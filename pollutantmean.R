pollutantmean <- function(directory, pollutant, id = 1:332) {
    csv <- dir(directory) #list of file names
    data <- NA
    
    for (i in id) {
        path <- paste(directory,"/",csv[i],sep="") #create file path for each csv
        files <- read.csv(path)
        data <- rbind(data, files) #combine data
    }
    mean(data[[pollutant]], na.rm = TRUE)
}