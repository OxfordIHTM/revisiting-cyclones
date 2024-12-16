##Task 2: Download and read the cyclones dataset----

import_xlsx <- function(url, folder){
  download.file(
    url = url,
    destfile = folder)
  
  read_xlsx(folder, start_row = 1, start_col = NULL)
}

import_xlsx("https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx", "R/cyclones.xlsx")
