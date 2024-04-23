## Ben's Master API Script ##

setwd("ENTER LOCATION OF R SCRIPTS")


source("packageInstaller.R") ## Checks package requirements,
                             ## manages installs and loads packages

username <- "ENTER USERNAME"      ## Your Web Service username##
password <- "ENTER PASSWORD"      ## Your Web Service password##


source("Login.R") ## Log in (Access Lasts 1 Hour)## 


source("refreshToken.R") ## Refresh the page (Token Lasts 1 week) ##


source("deviceList.R")

deviceID <- "152616" ## Applies to all single device functions

source("allPositions.R") # May take a couple minutes to parse RxStatus. 

source("singleDevice.R")

source("allAlerts.R")

source("singleAlerts.R")

