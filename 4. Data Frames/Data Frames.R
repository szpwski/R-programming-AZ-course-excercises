#IMPORTING DATA INTO R

#Method 1 : Select The Fily Manually
stats <- read.csv(file.choose())

#Method 2 : Set WD and Read Data
getwd() #get working directory
setwd() #set working directory

stats <- read.csv("P2-Demographic-Data.csv")
stats

#-----------------------
#EXPLORING OUR DATASET

stats
#Remember those functions to explore dataset
nrow(stats)
ncol(stats)
head(stats, n = 10)
tail(stats, n = 10)

str(stats) #str for structure
summary(stats)

#-------------------
#USING THE $ SIGN
head(stats)
stats[3,3]
stats[3, 'Birth.rate']
stats[stats['Country.Name'] == 'Angola', 'Birth.rate']
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]

#------------------------
#BASIC OPERATIONS WITH A DATA FRAME
stats[1:10,]
stats[3:9,]
stats[c(4,100),]

#Remember how the [] work:
stats[1,]
is.data.frame(stats[1,]) #no need for drop = F

stats[,1]
is.data.frame(stats[,1])
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])

#Multiply columns
head(stats)
stats$Birth.rate*stats$Internet.users
stats$Birth.rate+stats$Internet.users

#Add column
stats$MyCalc <-stats$Birth.rate*stats$Internet.users
head(stats)

#Test of Knowledge
stats$xyz <- 1:5
head(stats, n=10)

#Remove a Column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL

#------------------------------
#FILTERING A DATA FRAME
head(stats)

filter <- stats$Internet.users < 2
stats[filter, ]

stats[stats$Birth.rate > 40, ]

stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]

stats[stats$Income.Group == 'High income',]

stats[stats$Country.Name == 'Malta',]

#-------------------------------
#INTRODUCTION TO QPLOT()
library(ggplot2)
?qplot

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3)) #use I() to avoid displaying legend
#qplot is mapping objects so it thinks that we will have more objects thats why we get legend
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), color=I('blue'))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom='boxplot')

#-----------------------------
#VISUALIZING WITH QPLOT()
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), col=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate, 
      size=I(4), col=Income.Group)

#----------------------------
#BUILDING DATA FRAMES
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country","Code","Region")
#head(mydf)
rm(mydf)

mydf <- data.frame(Country = Countries_2012_Dataset, 
                   Code = Codes_2012_Dataset, 
                   Region = Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#-------------------------------
#MERGING DATA FRAMES
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)
merged$Country = NULL
head(merged)
str(merged) #str for structure

#------------------------------
#VISUALIZING WITH QPLOT()
library(ggplot2)
#1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), color=Region, shape=I(23)) #R shapes in Google
#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), color=Region, shape=I(19), alpha=I(0.6))
#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), color=Region, shape=I(19), alpha=I(0.6),
      main = "Birth Rate vs Internet Users")
