#Load functions

Get_started_dataset <- function(a,b) {
  download.file( url= a,
                 destfile = b)
  
  }

Get_started_dataset(a="https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx",
                    b="data.dat")

