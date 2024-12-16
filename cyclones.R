# Workflow to perform task 2 for the **Revisiting cyclones** exercise------------
library(openxlsx2)

source("read_data.R")

cyclones_data <- read_cyclones(
    url = "https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx", 
    destfile = "data/cyclones.xlsx"
    )
