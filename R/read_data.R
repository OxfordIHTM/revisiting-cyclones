## Task 2

read_data <- function(url, destfile) {
  download.file (url = url, destfile = destfile)
  
  read_xlsx(file = destfile)
}

