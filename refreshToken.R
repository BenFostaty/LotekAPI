## API Refresh ##

refresh_body <- list(
  grant_type = "refresh_token",
  username = username,
  refresh_token = refresh_token
)

refresh_res <- POST(paste0(url, "/user/login"),  body = refresh_body, encode = "form", verbose())

refresh <- content(refresh_res, as = "parsed", type = "application/json")

access_token <- refresh$access_token

refresh_token <- refresh$refresh_token

key = paste("bearer", access_token, sep = " ")

login_info <- data.frame(matrix(unlist(refresh), nrow = 1))

names(login_info) <- c("Access Token", "Token Type", "Time Valid", "Refresh Token", "Username", "Issuance Timestamp", "Expiry Timestamp")

login_status <- setcolorder(login_info, c("Username", "Issuance Timestamp", "Expiry Timestamp", "Time Valid", "Token Type", "Access Token", "Refresh Token"))
