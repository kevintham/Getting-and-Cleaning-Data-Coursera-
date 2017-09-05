library(readr)
setwd('~/work/datasciencecoursera/cleandata/Week2/')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for',
              destfile = 'data.for')
data <- read_fwf('data.for',
                 skip=4,
                 fwf_widths(c(12, 7, 4, 9, 4, 9, 4, 9, 4)))
sum(data[,4])
