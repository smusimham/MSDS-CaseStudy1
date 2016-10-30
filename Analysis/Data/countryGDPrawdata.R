########################################################################################
# Purpose: Read the GDP raw data for all countries file
# Author: Ramesh Simhambhatla
# Date Created: 10/28/2016
########################################################################################

countryGDPUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# download the file from the URL set 
download.file(countryGDPUrl, destfile = "./countryGDPdata.csv")

# read csv into a data frame
# preserve character data type where approrpiate - use stringsAsFactors
# current headers not appropriate, make it false
countryGDPraw <- read.csv("countryGDPdata.csv", stringsAsFactors = FALSE, header = FALSE)

# get dimension, variable names, and structure of the data
# dimension of the dataframe shows observations and variables
dim(countryGDPraw)

# examine general schema/structure of the table to determine useful variables and observations 
# for merge and analysis
str(countryGDPraw)

message("Observations while reading the GDP raw data file: 
a. GDP data file contains GDP data for 190 countries with ranking. 
b. The file do not have appropriate headers, so removed while reading into the data frame
c. String data read as factors, so prevented while reading the file
d. The file contains various other data, which may not be required for final analysis") 
