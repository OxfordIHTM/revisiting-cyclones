library(openxlsx2)

download_revisit <- function(url, destfile) {
  download.file(url = url, destfile = destfile)
  read_xlsx(file = destfile)
}
re_cyclones <- download_revisit (
  url = "https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx",
                        destfile = "data/revisiting-cyclones"
  )

View(re_cyclones)
