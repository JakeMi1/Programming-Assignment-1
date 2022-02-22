corr <- function(directory, threshold = 0) {
    csv <- dir(directory) #list of file names
    compl <- complete(directory) #get complete cases
    filtered <- subset(compl, compl$nobs > threshold)
    c <- vector()
    
    for (i in filtered$id) {
        path <- paste(directory,"/",csv[i],sep="")
        files <- read.csv(path)
        rmna <- subset(files, complete.cases(files)) #filter on complete cases
        c <- c(c, cor(rmna$nitrate, rmna$sulfate)) #create correlation vector
    }
    c
}