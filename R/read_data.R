# Function to download and read cyclones.xlsx dataset ----

read_data <- function(url, destfile) {
  download.file (url = url, destfile = destfile)
  
  read_xlsx(file = destfile)
}

### Feberuary 10 
# Revisiting cyclones exercise ----

## Load bespoke functions in R folder and load libraries ----
for (i in list.files("R", full.names = TRUE)) source(i)
library(openxlsx2)


## Read cyclones dataset ----
cyclones <- read_data(
  url = "https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx", 
  destfile = "data/cyclones.xlsx"
)