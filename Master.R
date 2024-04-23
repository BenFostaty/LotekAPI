## Ben's Master API Script ##

setwd("ENTER LOCATION OF R SCRIPTS")


source("packageInstaller.R") ## Checks package requirements,
                             ## manages installs and loads packages

username <- "ENTER USERNAME"      ## Your Web Service username as a character string##
password <- "ENTER PASSWORD"      ## Your Web Service password as a character string##


source("Login.R") ## Log in (Access Lasts 1 Hour)## 


source("refreshToken.R") ## Refresh the page (Token Lasts 1 week) ##


source("deviceList.R")

deviceID <- "ENTER 5 OR 6 DIGIT DEVICE ID" ## Applies to all single device functions
                                           ## Can be a character string or numeric

source("allPositions.R") # May take a couple minutes to parse RxStatus. 

source("singleDevice.R")

source("allAlerts.R")

source("singleAlerts.R")

