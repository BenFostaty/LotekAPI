library(tidyverse)
library(GA)

parse_RxStatus <- Vectorize(
  function(x){
    binary <- decimal2binary(x, length = 7)
    # Binary is read right to left. The fix strategy is stored in the last two digits.
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

