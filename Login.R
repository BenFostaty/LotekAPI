### API Login ###

{library(httr);library(jsonlite);library(lubridate)}

####login###

login<-list(
  grant_type = "password",
  username = username,
  password = password
)

url <- "https://webservice.lotek.com/API"

login_res <- POST(paste0(url, "/user/login"), body = login, encode = "form", verbose())

login <- content(login_res, as = "parsed", type = "application/json")

access_token <- login$access_token

refresh_token <- login$refresh_token

key = paste("bearer", access_token, sep = " ")

login_info <- data.frame(matrix(unlist(login), nrow = 1))

names(login_info) <- c("Access Token", "Token Type", "Time Valid", "Refresh Token", "Username", "Issuance Timestamp", "Expiry Timestamp")

login_status <- setcolorder(login_info, c("Username", "Issuance Timestamp", "Expiry Timestamp", "Time Valid", "Token Type", "Access Token", "Refresh Token"))


