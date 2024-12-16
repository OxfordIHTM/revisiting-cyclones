library(openxlsx2)

save.URL <-  function(a, b){
  download.file(
    url = a,
    destfile = b
  )
  read_xlsx(b)
}

ba <- save.URL(a = "https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx", 
               b = "data/cyclones.xlsx")
