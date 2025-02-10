read_data(url="https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx", destfile = "data/cyclones.xlsx")

summary(cyclones)

nrow (cyclones)
mean (cyclones)
cyclones$year
cyclones$name
nrow(cyclones$name)
count(year)

x <- year
y <- ca