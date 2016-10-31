############
# QUESTION 1: Merge the data based on the country shortcode. How many of the IDs match? 
# ANSWER: 189 matches per the str function

nrow(cleanGDPIncomeGroup)
message("Number of matches after merging with country shortcode: ", nrow(cleanGDPIncomeGroup))

############
# QUESTION 2: Sort the data frame in ascending order by GDP (so United States is last). 
# What is the 13th country in the resulting data frame?

# sort the data in ascending order of rank - no explicity "asc" required for arrange function
cleanGDPIncomeGroup <- arrange(cleanGDPIncomeGroup, gdpinusd)
str(cleanGDPIncomeGroup)

# find the countryname for the 13th country in the data frame - KNA - St. Kitts and Nevis
message("The 13th country in the resulting data frame: ", cleanGDPIncomeGroup[13,"countryname"])

############
# QUESTOIN 3: What are the average GDP rankings for the "High income: OECD" and 
# "High income: nonOECD" groups? 
OECDdata <- cleanGDPIncomeGroup[which(cleanGDPIncomeGroup$income.group == "High income: OECD"),]
message("The average GDP rankings for the (High income: OECD): ", mean(OECDdata$rank))

nonOECDdata <- cleanGDPIncomeGroup[which(cleanGDPIncomeGroup$income.group == "High income: nonOECD"),]
message("The average GDP rankings for the (High income: nonOECD): ", mean(nonOECDdata$rank))

###########
#QUESTION 4:Plot the GDP for all of the countries. Use ggplot2 to color your plot by 
# Income Group.

plotData <- ggplot(cleanGDPIncomeGroup, aes(income.group, log10(gdpinusd), fill = income.group)) + 
  geom_boxplot(outlier.shape = NA) +
  theme(axis.text.x = element_text(angle = 45, size=8)) +
  ggtitle("Box Plot for GDP for All Countries by Income Group") +
  labs(x="Income Group", y="GDP in USD - log10")

print(plotData)

message("Observations from the boxplot of GDP data by income.group:
a. All countries in the High income: OECD group countries have higher than all other groups. 
   These are generally regarded as developed countries.
b. Median GDP of the High Income: nonOECD, Lower Middle Income and Uppler Middle income groups are
   very close, shows possible wide income gap in this group.
c. Number of countries in the Lower middle income group are high, could be related to 
   high population, small or poor countries")
  
###########
# QUESTION 5 (a):
#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 

# Find quantiles and analyse
quantileGDP <- quantile(cleanGDPIncomeGroup$gdpinusd)
quantileGDP

message("With GDP quantiles, it's very interesting to find the diveregence GDP differences between the countries
top 25% percentile of the countries account for >98.5% of world GDP; bottom 25% account for < 0.05% of GDP")

#QUESTION 5 (b):
# How many countries are Lower middle income but among the 38 nations with highest GDP?
countrylmiLT39 <- cleanGDPIncomeGroup[which(cleanGDPIncomeGroup$income.group == "Lower middle income" & 
                                              cleanGDPIncomeGroup$rank <=38 ),]

# Number of observations in the criteria: 5
message("Number of obversations with Lower middle income in top 38 GDP countries: ", nrow(countrylmiLT39))

#############