 ## Device List ##

device_list_res <- GET(paste0(url, "/devices"), add_headers(Authorization = key), verbose())

device_list <- (content(device_list_res, as = "parsed", type = "application/json"))

devices <- data.frame(matrix(unlist(device_list), nrow = length(device_list), byrow = T))

names(devices) <- c("Device ID", "IMEI", "Date Created", "Satellite")

View(devices)





