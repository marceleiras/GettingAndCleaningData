##Getting and cleaning quiz Week 1

#calling dplyr

library(dplyr)

#create a destination file

if (!file.exists("Idaho")) {
  
  dir.create("Idaho")
  
  }

#set the url to download data from
#download the file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./Idaho/data.csv", method = "curl")

#read data into R

my_data <- read.csv(data.csv)
head(my_data)

#turn my_data into dplyr data table

the_data <- tbl_df(my_data)

#get properties with value of at least 1 million

valuable <- filter(the_data, VAL > 23)

#load XLConnect

library(XLConnect)

#create a destination for the new excel files

if (!file.exists("Gas")) {
  
  dir.create("Gas")
  
}

#download the gas file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./Gas/gasdata.xlsx", method = "curl")

#read gas file

library(xlsx)
gas_data <- read.xlsx("./Gas/gasdata.xlsx", sheetIndex = 1, header = TRUE)
head(gas_data)

#subset gas_data
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./Gas/gasdata.xlsx", sheetIndex = 1, header = TRUE, colIndex=colIndex, rowIndex = rowIndex)


#XML exercise

library(xml2) 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" 
doc <- xmlTreeParse("./get_data_restaurants.xml") 
rootNode <- xmlRoot(doc) 
xmlName(rootNode)

#data table exercise
library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
DT <- fread(fileUrl)

#Tests of system time
system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))
system.time(rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))

