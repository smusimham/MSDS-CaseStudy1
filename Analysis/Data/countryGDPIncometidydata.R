########################################################################################
# Purpose: merge cleaned GDP and Income Group data by countrycode
# Author: Ramesh Simhambhatla
# Date Created: 10/28/2016
########################################################################################

# note the GDP data has 190 observations, and Income Group has 210 observations
mergeGDPIncomeGroup <- merge(countryGDPfinal, countryFedStatsFinal, by="countrycode", all=FALSE)

# view top 6 observations to get an idea on ther merge
head(mergeGDPIncomeGroup)

# view the structure of the merged data
str(mergeGDPIncomeGroup)

# No further clean up required, mark it as clean and tidy
cleanGDPIncomeGroup <- mergeGDPIncomeGroup

# save the table to external csv file for reference
write.csv(cleanGDPIncomeGroup, file="cleanGDPIncomeGroup.csv")

message("Following actions performed to create tidy data: 
a. merged the cleaned GDP and Federal Stats data by countrycode
b. 189 observations have matches; remove unmatched observations")