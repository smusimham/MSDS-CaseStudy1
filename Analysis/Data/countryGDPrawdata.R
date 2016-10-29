########################################################################################
#read the countryGDPdata file
########################################################################################

#setwd(file.path(getwd(),"/Analysis/Data"))

cat("Start reading country GDP file from internet")

countryGDPUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
## download the file from the URL set 
download.file(countryGDPUrl, destfile = "./countryGDPdata.csv")

# read csv into a data frame
# preserve character data type where approrpiate - use stringsAsFactors
# current headers not appropriate, make it false
countryGDPraw <- read.csv("countryGDPdata.csv", stringsAsFactors = FALSE, header = FALSE)

## get dimension, variable names, and structure of the data
## dimension of the dataframe shows observations and variables
dim(countryGDPraw)

## examine general schema/structure of the table to determine useful variables and observations 
## for merge and analysis
str(countryGDPraw)

## explore data
head(countryGDPraw, 10)
cat("End of reading country GDP file from internet and reading to local session table")