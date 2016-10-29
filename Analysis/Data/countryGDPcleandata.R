########################################################################################
# create a clean/tidy GDP table for later analysis
########################################################################################

# cleanup the original table to make it appropriate for merge and analysis
# keep the original table, and follow next steps to create final country GDP table

# further exploring data, GDP rankings and data available until from row 6 to 195, 
# so include only those observations
countryGDPfinal <- countryGDPraw[(6:195),]
head(countryGDPfinal)

# now remove columns/variables 3 and 6 to 10 - they are not required to consturct the GDP table
countryGDPfinal <- countryGDPfinal[,-c(3, 6:10)]
head(countryGDPfinal)

# let's rename the column or variable names to match relavent data
names(countryGDPfinal) # current variable names
names(countryGDPfinal) <- c("countrycode", "rank", "countryname", "gdpinusd") #set new names
names(countryGDPfinal) # verify new names are set correctly

# let's verify the data types of the final variables
str(countryGDPfinal)

# convert "rank" to integer, and "gdpinusd" to numeric
countryGDPfinal$rank <- as.integer(countryGDPfinal$rank)
countryGDPfinal$gdpinusd <- as.numeric(gsub("[^[:digit:]]","",countryGDPfinal$gdpinusd))

# let's verify the data types of the final variables
str(countryGDPfinal)
head(countryGDPfinal)

# now countryCode and CountryName are chars; rank is integer and GDPinUSD is numeric.
dim(countryGDPfinal) # will show the table 190 countries with 4 variables