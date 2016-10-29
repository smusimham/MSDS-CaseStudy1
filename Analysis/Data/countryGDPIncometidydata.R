########################################################################################
# merge cleaned data
########################################################################################

# merge cleaned GDP and Income Group data by countrycode
# note the GDP data has 190 observations, and Income Group has 210 observations
mergeGDPIncomeGroup <- merge(countryGDPfinal, countryFedStatsFinal, by="countrycode", all=TRUE)

# view top 6 observations to get an idea on ther merge
head(mergeGDPIncomeGroup)

# view the structure of the merged data
str(mergeGDPIncomeGroup)

# find how many contrycodes are matching; TRUE matching; FALSE not matching
count(is.na(mergeGDPIncomeGroup$countryname))

# identify the non-matching countrynames with GDP table
noCountryName <- which(is.na(mergeGDPIncomeGroup$countryname))

# exclude non-matching countrynames from the merged data & 
# make final and clean tidy data for analysis
cleanGDPIncomeGroup <- mergeGDPIncomeGroup[(-1*noCountryName),]

# view structure of cleaned and tidy data to be used for analysis
str(cleanGDPIncomeGroup)