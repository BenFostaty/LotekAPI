alerts <- paste(url, "/alerts", sep = "")

alerts <- GET(alerts, add_headers(Authorization = key))

alerts <- content(alerts,type = "application/json")

alerts <- data.frame(t(sapply(alerts, as.character)))

alerts <- setcolorder(alerts,
                      c("X1", "X2", "X3","X4", "X5", "X6"))

names(alerts)<-c("Device ID", "Type", "Date & Time [GMT]", 
                 "Mortality Cancellation Date & Time [GMT]", 
                 "Latitude", "Longitude",
                 "Fence Event","VIT/Fawn ID")

alerts <- as.data.table(alerts)

alerts[, "Date & Time [GMT]" := parse_date_time(alerts$`Date & Time [GMT]`, orders="ymd_HMS")]

alerts[, "Mortality Cancellation Date & Time [GMT]" := parse_date_time(alerts$`Mortality Cancellation Date & Time [GMT]`, orders="ymd_HMS")]

all_alerts<-setcolorder(alerts,
                        c("Device ID", "Type", "Date & Time [GMT]", 
                          "Mortality Cancellation Date & Time [GMT]",
                          "Latitude", "Longitude","Fence Event","VIT/Fawn ID"))


singleAlerts <- data.frame(subset(all_alerts, all_alerts$`Device ID` == deviceID))
