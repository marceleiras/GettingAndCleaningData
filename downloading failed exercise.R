#Downloading example 
#the course example is from baltimore city open data site
#I will try with some IMF or World bank data


#try with different dest file and include curl again

fileUrl <- "https://api.worldbank.org/v2/es/indicator/SI.POV.DDAY?downloadformat=csv"
download.file(fileUrl, destfile = "poverty.csv", method = "curl")
list.files("data")

#now it liked it but it did not download anything

