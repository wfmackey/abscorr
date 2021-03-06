
# Reading and cleaning ANZSCO correspondence

library(tidyverse)
library(glue)


# ty asiripanich
anzsic_url <- "https://raw.githubusercontent.com/asiripanich/anzsic/master/anzsic_2006.csv"

temp_dir <- tempdir()
temp_path <- glue("{temp_dir}/anzsic.csv")

download.file(anzsic_url, temp_path)

# Read
anzsic_raw <- readr::read_csv(temp_path) %>%
    rename_all(~ glue("anzsic_{.}")) %>%
    mutate_if(is.double, as.integer) %>%
    as_tibble()

# Add layers of nfd
class_nfd <- anzsic_raw %>%
  distinct(anzsic_division_title, anzsic_division_code,
           anzsic_subdivision_title, anzsic_subdivision_code,
           anzsic_group_title, anzsic_group_code) %>%
  mutate(anzsic_class_code = anzsic_group_code * 10,
         anzsic_class_title = glue("{anzsic_group_title}, nfd"))

group_nfd <- anzsic_raw %>%
  distinct(anzsic_division_title, anzsic_division_code,
           anzsic_subdivision_title, anzsic_subdivision_code) %>%
  mutate(anzsic_group_title = glue("{anzsic_subdivision_title}, nfd"),
         anzsic_group_code = anzsic_subdivision_code * 10,
         anzsic_class_title = anzsic_group_title,
         anzsic_class_code = anzsic_group_code * 10)

top_div_codes <- anzsic_raw %>%
  distinct(anzsic_division_title, anzsic_division_code, anzsic_subdivision_code) %>%
  group_by(anzsic_division_code, anzsic_division_title) %>%
  summarise(anzsic_subdivision_code = min(anzsic_subdivision_code))

subdivision_nfd <- anzsic_raw %>%
  group_by(anzsic_division_code, anzsic_division_title) %>%
  summarise(anzsic_subdivision_code = min(anzsic_subdivision_code)) %>%
  mutate(anzsic_subdivision_title = glue("{anzsic_division_title}, nfd"),
         anzsic_group_title = anzsic_subdivision_title,
         anzsic_group_code = anzsic_subdivision_code * 10,
         anzsic_class_title = anzsic_group_title,
         anzsic_class_code = anzsic_group_code * 10)

anzsic <- anzsic_raw %>%
  bind_rows(subdivision_nfd) %>%
  bind_rows(group_nfd) %>%
  bind_rows(class_nfd) %>%
  arrange(anzsic_class_code)


# Export
save(anzsic, file = "data/anzsic.rda", compress = "xz")

