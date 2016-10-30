########################################################################################
# Purpose: Load the Federal Educational Statistical data from this data set
# Author: Ramesh Simhambhatla
# Date Created: 10/28/2016
########################################################################################

# set url of the Federal Educational Stats data to a local variable
countryFedStatsUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

# download the file from the URL set 
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

message("Observations while reading the Federal Stats raw data file: 
a. GDP data file contains Federal Stats on Income and some census survey data with 234 observations.
b. The file has appropriate headers and kept it while reading
c. Only Contry Code and Income Group has relavent and useful data for analysis
d. The file contains various other data, incomplete, which is not be required for final analysis") 