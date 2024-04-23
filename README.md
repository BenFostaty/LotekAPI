# LotekAPI

This is a collection of scripts that can be used to pull data from the Lotek REST API.

# Master.R 

This is the only file that requires user input and action. 
Open the Master.R script in R-Studio.
Input the working directory of the files and your Web Service username and password. 
If single device functions are to be used, input the Device ID. The device must be registered to the Web Service username. 
All scripts can be run using the Master script except for the RxStatus.R
Login.R must be performed before any other scripts to authorize. The token received lasts 1 hour. 
refreshToken.R can be run to receive an auth token that lasts 1 week. 


# RxStatus.R

This file is just a copy of the function for converting hexadecimal metadata (Fix solution, number of satellites, dimensions) into text. 


# packageInstaller.R

This file can be sourced to include check your R system and R session for the necessary packages to run all files. It has been left separate to avoid any unwanted installations on your system. 
All packages used are from CRAN. 
