complete <- function(directory, id = 1:332) {
    csv <- dir(directory) #list of file names
    ids <- vector()
    nobs <- vector()
    
    for (i in id) {
        path <- paste(directory,"/",csv[i],sep="") #create file path for each csv
        files <- read.csv(path)
        ids <- c(ids,i) #create list of IDs
        nobs <- c(nobs, sum(complete.cases(files))) #create list of nobs
    }
    data.frame(id = ids, nobs = nobs) #create data frame
}