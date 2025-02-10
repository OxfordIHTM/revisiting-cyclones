# Function to download and read cyclones.xlsx dataset ----

read_data <- function(url, destfile) {
  download.file (url = url, destfile = destfile, mode = "wb")
  
  openxlsx2::read_xlsx(
    file = destfile,
    types = c(
      year = 1, 
      category_code = 0,
      category_name = 0,
      name = 0,
      rsmc_name = 0,
      start = 3,
      end = 3,
      pressure = 1,
      speed = 1
    )
  )
}

