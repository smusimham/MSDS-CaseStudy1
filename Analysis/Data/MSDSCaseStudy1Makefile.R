
parentwd <- "/Users/rsimham/Documents/Ramesh/SMU/GitRepos/Case Studies/MSDS-CaseStudy1/Analysis"

setwd("/Users/rsimham/Documents/Ramesh/SMU/GitRepos/Case Studies/MSDS-CaseStudy1/Analysis/Data")

## download and install the libraries, if not already available in the session
# install.packages("repmis")    # Misc tools for Reproduciable Research
# install.packages("plyr")      # Tools for Splitting, Applying and Combining Data
# install.packages("ggplot2")   # Used for Advanced Graphics

# Load packages
library(repmis)
library(plyr)
library(ggplot2)

## download the files and read into tables 
source("countryGDPrawdata.R")
source("countryFedStatsrawdata.R")

## clean the source files, and create tidy data
source("countryGDPcleandata.R")
source("countryFedStatscleandata.R")

## merge the dataset, remove unmatched records, and create final tidy data for analysis
source("countryGDPIncometidydata.R")

setwd(parentwd)
## Analyse the tidy data to provide answers to Case Study questions.
source("caseStudyAnalysis.R")