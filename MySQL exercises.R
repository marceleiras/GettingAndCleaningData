#MySQL scripts
#Conenct to UCSCDb

library(RMySQL)
ucscDb <- dbConnect(MySQL(), user="genome",
                    host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb)

#Get the hg19 data base
#Connect to the database
hg19 <- dbConnect(MySQL(), user="genome", db="hg19",
                  host="genome-mysql.cse.ucsc.edu")
#list all tables in it
allTables <- dbListTables(hg19)
#get the lenght of every table
length(allTables)

#get a particular table in hg19 and the fields (columns) in it
dbListFields(hg19, "affyU133Plus2")

#get the number of records (rows) in each field
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

#read the data in a particular table
affyData <- dbReadTable(hg19, "affyU133Plus2")
#see the first fields and records in the table
head(affyData)

#select a subset of a data base (they tend to be gigantic)
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
#fetch only the selection and get the quantiles of it
affyMis <- fetch(query); quantile(affyMis$misMatches)
#get only a few rows of that selection
affyMisSmall <- fetch(query, n=10); dbClearResult(query);
#get the dimensions of the object affyMisSmall
dim(affyMisSmall)

#remember to disconnect from the data base
dbDisconnect(hg19)