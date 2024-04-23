## Positional Data ##

start <- "2000-02-11T00:00:00Z"

UTC <- format(now(tz = "UTC"), "%H:%M:%S")

end <- paste0(Sys.Date(), "T", UTC, "Z")

positions_res <- GET(paste0(url, "/positions/findByDate?from=", start, "&to=", end), add_headers(Authorization = key), verbose())

positions_content <- content(positions_res, as = "parsed", type = "application/json")

all_positions <- data.frame(matrix(unlist(positions_content), nrow = length(positions_content), byrow = T))

names(all_positions) <- c("ChannelStatus", "UploadTimeGMT", "Latitude", "Longitude", "Altitude", "ECEFx", "ECEFy", "ECEFz", "RxStatus", 
                          "DOP", "MainV", "BackupV", "Temperature", "FixDuration", "bHasTempVoltage", "DeviceName", "DeltaTime", "FixType", 
                          "CEPRadius", "CRC", "DeviceID", "DateTimeGMT")

all_positions$DateTimeGMT <- as.POSIXct(all_positions$DateTimeGMT, format = "%Y-%m-%dT%H:%M:%S")
all_positions$UploadTimeGMT <- as.POSIXct(all_positions$UploadTimeGMT, format = "%Y-%m-%dT%H:%M:%S")


all_positions <- as.data.table(setcolorder(all_positions, c("DeviceName", "DeviceID", "DateTimeGMT", "UploadTimeGMT", "Latitude", "Longitude", "Altitude", "RxStatus", "DOP", "MainV", 
                "Temperature", "FixDuration", "DeltaTime", "FixType", "CEPRadius", "CRC")))

setkey(all_positions, DeviceID)

parse_RxStatus <- Vectorize(
  function(x){
    binary <- decimal2binary(x, length = 7)
    
    fix_strategy <- binary2decimal(binary[5:7])
    
    # satellites
    satellites <- binary2decimal(binary[1:4])
    
    fix_type <- case_when(
      fix_strategy == 0 ~ "No Fix", # 1 = no fix
      fix_strategy == 1 ~ "1 SV KF",
      fix_strategy == 2 ~ "2 SV KF",
      fix_strategy == 3 ~ "3 SV KF",
      fix_strategy == 4 ~ "4 or more SV KF",
      fix_strategy == 5 ~ "2-D least squares",
      fix_strategy == 6 ~ "3-D least squares",
      fix_strategy == 7 ~ "Dead Reckoning")
    
    return(paste(fix_type, ",", satellites, "SVs"))}
)

all_positions$RxStatus <- parse_RxStatus(all_positions$RxStatus)

View(all_positions)

