library(dplyr)


test_that("anzsco and anzsco_c are as-expected", {
  # Check object
  expect_is(anzsco_c, "tbl_df")
  expect_is(anzsco, "tbl_df")
  # Check non-title labels
  expect_equal(anzsco_c[[2]][952], "Labourers")
  expect_equal(as.character(anzsco[[2]][952]), "Labourers")
  # Check title labels
  expect_equal(anzsco_c[[2]][721], "Clerical and Administrative Workers")
  expect_equal(as.character(anzsco[[2]][721]), "Clerical and Administrative Workers")
  # Check digit conversion
  expect_identical(anzsco_c$anzsco1_code,
                   substr(anzsco$anzsco5_code, 1, 1))
  expect_identical(anzsco_c$anzsco2_code,
                   substr(anzsco$anzsco3_code, 1, 2))
  # Spotcheck occupations and skill levels
  expect_equal(anzsco %>%
                 filter(anzsco5_code == "452311") %>%
                 pull(anzsco5) %>%
                 as.character(),
               "Diving Instructor (Open Water)")

  expect_equal(anzsco_c %>%
                 filter(anzsco5_code == "899999") %>%
                 pull(anzsco5),
               "Labourers nec")

  expect_equal(anzsco %>%
                 filter(anzsco5_code == "631112") %>%
                 pull(skill_level),
               "5")
})


test_that("asced_foe is as-expected", {
  # Check object
  expect_is(asced_foe, "tbl_df")
  expect_is(asced_foe_c, "tbl_df")
  # Check non-title labels
  expect_equal(asced_foe_c[[2]][200], "Health")
  # Check title labels
  expect_equal(as.character(asced_foe[[2]][150]), "Agriculture, Environmental and Related Studies")
  # Check digit conversion
  expect_identical(asced_foe_c$foe2_code,
                   substr(asced_foe$foe6_code, 1, 2))
  expect_identical(asced_foe_c$foe4_code,
                   substr(asced_foe$foe6_code, 1, 4))
  # Spotcheck occupations and skill levels
  expect_equal(asced_foe %>%
                 filter(foe6_code == "091901") %>%
                 pull(foe6) %>%
                 as.character(),
               "Economics")

  expect_equal(asced_foe_c %>%
                 filter(foe6_code == "129999") %>%
                 pull(foe6),
               "Mixed Field Programmes, n.e.c.")

  expect_equal(asced_foe %>%
                 filter(foe6_code == "040101") %>%
                 pull(foe4) %>%
                 as.character(),
               "Architecture and Urban Environment")
})

