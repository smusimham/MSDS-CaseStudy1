########################################################################################
# Load the educational data from this data set
########################################################################################

#setwd(file.path(getwd(),"/Analysis/Data"))

cat("Start reading Federal Educational Stats file from internet")

countryFedStatsUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
## download the file from the URL set 
download.file(countryFedStatsUrl, destfile = "./countryFedStats.csv")

# read csv into a data frame
# preserve character data type where approrpiate - use stringsAsFactors
# current headers looks ok, keep them for now
countryFedStatsraw <- read.csv("countryFedStats.csv", stringsAsFactors = FALSE, header = TRUE)

## get dimension, variable names, and structure of the data
## dimension of the dataframe shows observations and variables
dim(countryFedStatsraw)

## examine general schema/structure of the table to determine useful variables and observations 
## for merge and analysis
str(countryFedStatsraw) #should show 234 observsation with 31 variables

## explore data with top 10 rows
head(countryFedStatsraw, 10)

cat("End of reading Federal Educational Stats file from internet and reading to local session table")
