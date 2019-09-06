# Clean ASCED

library(tidyverse)
library(glue)


asced_url <- "https://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1272.0%20australian%20standard%20classification%20of%20education%20(asced)%20structures.xls&1272.0&Data%20Cubes&B286FC6C1777688DCA257ECB001657BC&0&2001&29.09.2015&Latest"


temp_dir <- tempdir()
temp_path <- glue("{temp_dir}/asced.zip")

download.file(asced_url, temp_path)

# Read long list
raw <- readxl::read_excel(temp_path,
                          sheet = 3,
                          range = "A8:D446",
                          col_names = FALSE) %>%
  janitor::clean_names()

# Extract each level:
foe2 <- raw %>%
  filter(!is.na(x1)) %>%
  select(foe2_code = 1,
         foe2 = 2) %>%
  mutate(foe2_code = as.character(foe2_code))

foe4 <- raw %>%
  anti_join(foe2, by = c("x2" = "foe2")) %>%
  filter(!is.na(x2)) %>%
  select(foe4_code = 2,
         foe4 = 3) %>%
  mutate(foe2_code = substr(foe4_code, 1, 2))

foe6 <- raw %>%
  anti_join(foe2, by = c("x2" = "foe2")) %>%
  anti_join(foe4, by = c("x3" = "foe4")) %>%
  filter(!is.na(x3)) %>%
  select(foe6_code = 3,
         foe6 = 4) %>%
  mutate(foe4_code = substr(foe6_code, 1, 4),
         foe2_code = substr(foe4_code, 1, 2))


# Join into wide ascedupation list
asced_foe_c <- foe2 %>%
  left_join(foe4) %>%
  left_join(foe6) %>%
  mutate(foe2 = str_to_title(foe2),       # "Natural And Physical Sciences"
         foe2 = tools::toTitleCase(foe2)) # "Natural and Physical Sciences"


# Create factor alternative; the default
asced_foe <- asced_foe_c %>%
  mutate(foe2 = as_factor(foe2),
         foe4 = as_factor(foe4),
         foe6 = as_factor(foe6))


# Export
save(asced_foe, file = "data/asced_foe.rda", compress = "xz")
save(asced_foe_c, file = "data/asced_foe_c.rda", compress = "xz")






