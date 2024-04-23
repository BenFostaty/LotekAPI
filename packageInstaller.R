# Trying httr

if(require("httr")){
  print("httr is loaded correctly")
} else {
  print("trying to install httr")
  install.packages("httr")
  if(require(httr)){
    print("httr installed and loaded")
  } else {
    stop("could not install httr")
  }
}

# Trying jsonlite

if(require("jsonlite")){
  print("jsonlite is loaded correctly")
} else {
  print("trying to install jsonlite")
  install.packages("jsonlite")
  if(require(jsonlite)){
    print("jsonlite installed and loaded")
  } else {
    stop("could not install jsonlite")
  }
}

# Trying lubridate

if(require("lubridate")){
  print("lubridate is loaded correctly")
} else {
  print("trying to install lubridate")
  install.packages("lubridate")
  if(require(lubridate)){
    print("lubridate installed and loaded")
  } else {
    stop("could not install lubridate")
  }
}

# Trying data.table

if(require("data.table")){
  print("data.table is loaded correctly")
} else {
  print("trying to install data.table")
  install.packages("data.table")
  if(require(data.table)){
    print("data.table installed and loaded")
  } else {
    stop("could not install data.table")
  }
}

# Trying shiny

if(require("shiny")){
  print("shiny is loaded correctly")
} else {
  print("trying to install shiny")
  install.packages("shiny")
  if(require(shiny)){
    print("shiny installed and loaded")
  } else {
    stop("could not install shiny")
  }
}

# Trying miniUI

if(require("miniUI")){
  print("miniUI is loaded correctly")
} else {
  print("trying to install miniUI")
  install.packages("miniUI")
  if(require(miniUI)){
    print("miniUI installed and loaded")
  } else {
    stop("could not install miniUI")
  }
}

# Trying taskScheduleR

if(require("taskscheduleR")){
  print("taskscheduleR is loaded correctly")
} else {
  print("trying to install taskscheduleR")
  install.packages("taskscheduleR")
  if(require(taskscheduleR)){
    print("taskscheduleR installed and loaded")
  } else {
    stop("could not install taskscheduleR")
  }
}

# Trying GA

if(require("GA")){
  print("GA is loaded correctly")
} else {
  print("trying to install GA")
  install.packages("GA")
  if(require(GA)){
    print("GA installed and loaded")
  } else {
    stop("could not install GA")
  }
}

# Trying tidyverse

if(require("tidyverse")){
  print("tidyverse is loaded correctly")
} else {
  print("trying to install tidyverse")
  install.packages("tidyverse")
  if(require(tidyverse)){
    print("tidyverse installed and loaded")
  } else {
    stop("could not install tidyverse")
  }
}