read_data <- function(url, destfile) {
  download.file (url = url, destfile = destfile)
  
  read_xlsx(file = destfile)
}

read_data(url = "https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx",
 destfile = "data/cyclones.xlsx")
