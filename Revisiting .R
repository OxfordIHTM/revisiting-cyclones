library("openxlsx2")

ba <- function (url,lostfile){
  download.file(
    url = url,
    destfile = lostfile
  )
  read_xlsx(lostfile,header = TRUE, sep = "")
}


