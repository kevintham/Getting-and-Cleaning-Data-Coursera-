library(dplyr)

## Question 1 ##
setwd('~/work/datasciencecoursera/cleandata/Week3/')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
              destfile = 'housing.csv')
housing <- read_csv('housing.csv')
agricultureLogical <- (housing$AGS==6) & (housing$ACR==3)
which(agricultureLogical)
## Ans: 125, 238,262
## Question 1 ##

## Question 2 ##
library(jpeg)
setwd('~/work/datasciencecoursera/cleandata/Week3/')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg',
              destfile = 'jpeg.jpg')
jpegdat <- readJPEG('jpeg.jpg',native=TRUE)
percentile <- quantile(jpegdat, c(0.3,0.8))
percentile
## Ans: -15259150 -10575416
## Question 2 ##

## Question 3 ##
library(readr)
library(dplyr)
setwd('~/work/datasciencecoursera/cleandata/Week3/')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
              destfile = 'gdp.csv')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
              destfile = 'edu.csv')
gdp <- read_csv('gdp.csv',skip=4, n_max=190,
                col_types = cols_only(X1='c',X2='i',X4='c',X5='c'))
edu <- read_csv('edu.csv')
names(gdp) <- c('CountryCode','Rank','Country','GDP')
merged <- merge(gdp,edu,by='CountryCode')
nrow(merged)
arranged <- arrange(merged, desc(Rank))
arranged[13,3]
## Ans: 189 matches, 13th country is St. Kitts and Nevis
## Question 3 ##

## Question 4 ##
summ <- arranged %>% 
  group_by(arranged$'Income Group') %>%
  summarise(mean_rank = mean(Rank, na.rm=T))
summ
## Ans: 32.96667, 91.91304
## Question 4 ##

## Question 5 ##
cuts <- cut(arranged$Rank,breaks=quantile(arranged$Rank,seq(0.,1.,0.2)))
table(cuts, arranged$`Income Group`)
## Ans: 5
## Question 5 ##