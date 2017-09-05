library(sqldf)
library(RMySQL)

setwd('~/work/datasciencecoursera/cleandata/Week2/')

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv',
              destfile = 'acsdata.csv')

acs <- read.csv('acsdata.csv')

head(sqldf("select pwgtp1 from acs where AGEP < 50", drv = 'SQLite'))
head(sqldf("select distinct AGEP from acs",drv='SQLite'))