library(dplyr)
library(readr)
library(stringr)
library(lubridate)

## Question 1 ##
setwd('~/work/datasciencecoursera/cleandata/Week4/')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
              destfile = 'housing_idaho.csv')
housing <- read_csv('housing_idaho.csv')
split_names <- strsplit(names(housing), 'wgtp')
split_names[123]
## Ans: ""   "15"
## Question 1 ##

## Question 2 ##
setwd('~/work/datasciencecoursera/cleandata/Week4/')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
              destfile = 'gdp.csv')
gdp <- read_csv('gdp.csv',skip=4, n_max=190,
                col_types = cols_only(X1='c',X2='i',X4='c',X5='c'))
names(gdp) <- c('CountryCode','Rank','Country','GDP')
gdp$GDP <- as.numeric(gsub(',', '', gdp$GDP))
mean(gdp$GDP)
## Ans: 377652.4
## Question 2 ##

## Question 3 ##
grep("^United",gdp$Country)
## Ans: grep("^United",countryNames), 3
## Question 3 ##

## Question 4 ##
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
              destfile = 'edu.csv')
edu <- read_csv('edu.csv')
data <- merge(gdp, edu, by = "CountryCode")
fiscalyeTF <- grepl('fiscal year end', tolower(data$`Special Notes`))
juneTF <- grepl('june', tolower(data$`Special Notes`))
table(fiscalyeTF, juneTF)
## Ans: 13
## Question 4 ##

## Question 5 ##
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sum(year(sampleTimes)==2012)
sum(wday(sampleTimes[year(sampleTimes)==2012], label = TRUE) == 'Mon')
## Ans: 250, 47
## Question 5 ##