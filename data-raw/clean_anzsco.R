# Reading and cleaning ANZSCO correspondence

library(tidyverse)
library(glue)


anzsco_url <- "https://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&1220.0%20ANZSCO%20Version%201.2%20Structure%20v3.xls&1220.0&Data%20Cubes&6A8A6C9AC322D9ABCA257B9E0011956C&0&2013,%20Version%201.2&05.07.2013&Latest"

temp_dir <- tempdir()
temp_path <- glue("{temp_dir}/anzsco.zip")

download.file(anzsco_url, temp_path)

# Read
raw <- readxl::read_excel(temp_path,
                          sheet = 6,
                          range = "A11:G1555",
                          col_names = FALSE) %>%
  janitor::clean_names()

# Extract each level:
anzsco1 <- raw %>%
  filter(!is.na(x1)) %>%
  select(anzsco1_code = 1,
         anzsco1 = 2) %>%
  mutate(anzsco1_code = as.character(anzsco1_code))

anzsco2 <- raw %>%
  anti_join(anzsco1, by = c("x2" = "anzsco1")) %>%
  filter(!is.na(x2)) %>%
  select(anzsco2_code = 2,
         anzsco2 = 3) %>%
  mutate(anzsco1_code = substr(anzsco2_code, 1, 1))

anzsco3 <- raw %>%
  anti_join(anzsco1, by = c("x2" = "anzsco1")) %>%
  anti_join(anzsco2, by = c("x3" = "anzsco2")) %>%
  filter(!is.na(x3)) %>%
  select(anzsco3_code = 3,
         anzsco3 = 4) %>%
  mutate(anzsco2_code = substr(anzsco3_code, 1, 2),
         anzsco1_code = substr(anzsco2_code, 1, 1))

anzsco4 <- raw %>%
  anti_join(anzsco1, by = c("x2" = "anzsco1")) %>%
  anti_join(anzsco2, by = c("x3" = "anzsco2")) %>%
  anti_join(anzsco3, by = c("x4" = "anzsco3")) %>%
  filter(!is.na(x4)) %>%
  select(anzsco4_code = 4,
         anzsco4 = 5) %>%
  mutate(anzsco3_code = substr(anzsco4_code, 1, 3),
         anzsco2_code = substr(anzsco3_code, 1, 2),
         anzsco1_code = substr(anzsco2_code, 1, 1))

anzsco5 <- raw %>%
  anti_join(anzsco1, by = c("x2" = "anzsco1")) %>%
  anti_join(anzsco2, by = c("x3" = "anzsco2")) %>%
  anti_join(anzsco3, by = c("x4" = "anzsco3")) %>%
  anti_join(anzsco4, by = c("x5" = "anzsco4")) %>%
  filter(!is.na(x5)) %>%
  select(anzsco5_code = 5,
         anzsco5 = 6,
         skill_level = 7) %>%
  mutate(anzsco4_code = substr(anzsco5_code, 1, 4),
         anzsco3_code = substr(anzsco4_code, 1, 3),
         anzsco2_code = substr(anzsco3_code, 1, 2),
         anzsco1_code = substr(anzsco2_code, 1, 1))

# Join into wide anzscoupation list
anzsco <- anzsco1 %>%
  left_join(anzsco2) %>%
  left_join(anzsco3) %>%
  left_join(anzsco4) %>%
  left_join(anzsco5) %>%
  mutate(anzsco1 = str_to_title(anzsco1),
         anzsco1 = tools::toTitleCase(anzsco1),
         skill_level = as.character(skill_level))


# Export
save(anzsco, file = "data/anzsco.rda", compress = "xz")




