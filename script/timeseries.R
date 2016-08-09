#Author: Victor Kubam
# To run this file add the following code in your R console:
#source("https://raw.githubusercontent.com/victorkubam/timeSeries/master/script/timeseries.R")


#Time series Analysis of Belgium Transport Data

#Add libraries
#install.packages("RCurl")
#install.packages("foreign")
#install.packages("dplyr")
#install.packages("MTS")

#Load Libraries
require(RCurl)
require(foreign)
require(dplyr)
require(MTS)

#Import Data
#Deaths
deathUrl <- getURL("https://raw.githubusercontent.com/victorkubam/timeSeries/master/data/DP_LIVE_09082016145313931.csv")
deathsData <- read.csv(textConnection(deathUrl))
names(deathsData)[1]<-"LOCATION"
deathsData <- filter(deathsData,LOCATION=="BEL")
#Road accidents
roadAccUrl <- getURL("https://raw.githubusercontent.com/victorkubam/timeSeries/master/data/DP_LIVE_09082016145434696.csv")
roadAccData <- read.csv(textConnection(roadAccUrl))
names(roadAccData)[1]<-"LOCATION"
roadAccData <- filter(roadAccData,LOCATION=="BEL")
#Passenger Transport
passTransUrl <- getURL("https://raw.githubusercontent.com/victorkubam/timeSeries/master/data/DP_LIVE_09082016145929165.csv")
passTransData <- read.csv(textConnection(passTransUrl))
names(passTransData)[1]<-"LOCATION"
passTransData <- filter(passTransData,LOCATION=="BEL")




#Start Time Series Analysis
deathtimeseries <- ts(deathsData$Value,frequency=1, start = 1970)
roadacctimeseries <- ts(roadAccData$Value,frequency=1, start = 1970)
passtranstimeseries <- ts(passTransData$Value,frequency=1, start = 1970)

#Plot the time series 
plot.ts(deathtimeseries)
plot.ts(roadacctimeseries)
plot.ts(passtranstimeseries)

#Plot the ACF
acf(deathtimeseries,type="correlation")
acf(roadacctimeseries,type="correlation")
acf(passtranstimeseries,type="correlation")

#Plot the PACF
acf(deathtimeseries,type="partial")
acf(roadacctimeseries,type="partial")
acf(passtranstimeseries,type="partial")



