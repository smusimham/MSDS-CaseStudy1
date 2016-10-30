###########################
# Purpose: create a tidy federal stats table for merge with GDP data & later analysis
# Author: Ramesh Simhambhatla
# Date Created: 10/28/2016
###########################

# copy the original to the to-be-cleaned-up table
countryFedStats <- countryFedStatsraw

#first convert all names to lowercase for easier reference and consistency
names(countryFedStats) <- tolower(names(countryFedStats)) 

# determine unique type of Income Groups
unique(countryFedStats$income.group) 

# will ouput FALSE for blanks, and TRUE non valid
count(countryFedStats$income.group != "") 

# identify observation numbers (row number) for degrouping
noIncomeGroup <- which(countryFedStats$income.group == "")
noIncomeGroup # view the rows for exclusion

# exclude those with income.group blank (not countries)
countryFedStats <- countryFedStats[(-1*noIncomeGroup),]
# view first two variables to confirm they are not countries
# str(countryFedStats)[,1:2]

# since the case study is focussed on GDP and Income Group, create a Final dataset for merging
# with GDP table - by country code
countryFedStatsFinal <- countryFedStats[,c(1,3)]
str(countryFedStatsFinal)

write.csv(countryFedStatsFinal, "countryFedStatsFinal.csv")

message("Clean up performed on Federal Stats raw data file: 
a. Converted all names to lowercase for easier reference and consistency.
b. Country and non-counry data was mixed; Removed observations which do not have Income Group
c. Final clean up data contains 210 observations with country code & income.group; rest of the variables discarded")