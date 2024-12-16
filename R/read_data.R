read_cyclones <- function(url, destfile) {
  download.file(url = url, destfile = destfile)
  
  read_xlsx(file = destfile, sheet = "Sheet 1")
}


