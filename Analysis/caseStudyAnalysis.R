cat("\nStart of Case Study Analysis")

########################################################################################
# EVALUATE FOR CASE STUDY QUESTIONS:
########################################################################################
# QUESTION 1: Merge the data based on the country shortcode. How many of the IDs match? 
# ANSWER: 190 matches per the str function
########################################################################################
# QUESTION 2: Sort the data frame in ascending order by GDP (so United States is last). 
# What is the 13th country in the resulting data frame?
# ANSWER 2: Spain

# sort the data in ascending order of rank - no explicity "asc" required for arrange function
cleanGDPIncomeGroup <- arrange(cleanGDPIncomeGroup, rank)
head(cleanGDPIncomeGroup)

# find the countryname for the rank=13
cleanGDPIncomeGroup$countryname[which(cleanGDPIncomeGroup$rank == 13)]
##################################################################################################
# QUESTOIN 3: What are the average GDP rankings for the "High income: OECD" and 
# "High income: nonOECD" groups? 
OECDdata <- cleanGDPIncomeGroup[which(cleanGDPIncomeGroup$income.group == "High income: OECD"),]
mean(OECDdata$rank) # 32,9667 (sum=989 of 30 observations) 

nonOECDdata <- cleanGDPIncomeGroup[which(cleanGDPIncomeGroup$income.group == "High income: nonOECD"),]
mean(nonOECDdata$rank) # 91.91304 (sum=2114 of 23 observations)
##################################################################################################
# QUESTION 4:Plot the GDP for all of the countries. Use ggplot2 to color your plot by 
# Income Group.
qplot(data=cleanGDPIncomeGroup, countrycode, log10(gdpinusd), color=income.group, 
      main="Plot GDP for All Countries", xlab="Country Code", ylab="GDP in USD - log10") +
  theme(axis.text.x = element_text(angle = 90, size=6))
##################################################################################################
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 

# Find quantiles and analyse
quantileGDP <- quantile(cleanGDPIncomeGroup$gdpinusd)
quantileGDP
### Analysis: It's very interesting to find the diveregence GDP differences between the countries
### top 25% percentile of the countries account for >98.5% of world GDP; bottom 25% account for < 0.05%

# How many countries are Lower middle income but among the 38 nations with highest GDP?
countrylmiLT39 <- cleanGDPIncomeGroup[which(cleanGDPIncomeGroup$income.group == "Lower middle income" & 
                                              cleanGDPIncomeGroup$rank <=38 ),]
# list all countries that meet the criteria - lower middle income category & in top 38 GDP rank
countrylmiLT39

# Number of observations in the criteria: 5
nrow(countrylmiLT39)
cat("\nEnd of Case Study Analysis")