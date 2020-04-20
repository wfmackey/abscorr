
# Reading and cleaning ANZSCO correspondence

library(tidyverse)
library(glue)

# fun for captial -> title case
to_title <- function(x) str_to_title(x) %>% tools::toTitleCase()

# Set up
# ty asiripanich
anzsic_url <- "https://raw.githubusercontent.com/asiripanich/anzsic/master/anzsic_2006.csv"

temp_dir <- tempdir()
temp_path <- glue("{temp_dir}/anzsic.csv")

download.file(anzsic_url, temp_path)

# Read
anzsic <- readr::read_csv(temp_path) %>%
    rename_all(~ glue("anzsic_{.}")) %>%
    mutate_if(is.double, as.integer)

# Export
save(anzsic, file = "data/anzsic.rda", compress = "xz")




