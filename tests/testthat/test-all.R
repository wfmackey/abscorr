library(dplyr)


test_that("anzsco is as-expected", {
  # Check object
  expect_is(anzsco, "tbl_df")
  # Check non-title labels
  expect_equal(anzsco[[2]][1111], "Labourers")
  # Check title labels
  expect_equal(anzsco[[2]][721], "Community and Personal Service Workers")
  # Check digit conversion
  expect_identical(anzsco$anzsco1_code,
                   substr(anzsco$anzsco6_code, 1, 1))
  expect_identical(anzsco$anzsco2_code,
                   substr(anzsco$anzsco3_code, 1, 2))
  # Spotcheck occupations and skill levels
  expect_equal(anzsco %>%
                 filter(anzsco6_code == "452311") %>%
                 pull(anzsco6),
               "Diving Instructor (Open Water)")

  expect_equal(anzsco %>%
                 filter(anzsco6_code == "899999") %>%
                 pull(anzsco6),
               "Labourers nec")

  expect_equal(anzsco %>%
                 filter(anzsco6_code == "631112") %>%
                 pull(skill_level) %>%
                 as.character(),
               "5")
})


test_that("asced_foe is as-expected", {
  # Check object
  expect_is(asced_foe, "tbl_df")
  # Check non-title labels
  expect_equal(asced_foe[[2]][200], "Health")
  # Check title labels
  expect_equal(asced_foe[[2]][150], "Architecture and Building")
  # Check digit conversion
  expect_identical(asced_foe$foe2_code,
                   substr(asced_foe$foe6_code, 1, 2))
  expect_identical(asced_foe$foe4_code,
                   substr(asced_foe$foe6_code, 1, 4))
  # Spotcheck occupations and skill levels
  expect_equal(asced_foe %>%
                 filter(foe6_code == "091901") %>%
                 pull(foe6),
               "Economics")

  expect_equal(asced_foe %>%
                 filter(foe6_code == "129999") %>%
                 pull(foe6),
               "Mixed Field Programmes, n.e.c.")

  expect_equal(asced_foe %>%
                 filter(foe6_code == "040101") %>%
                 pull(foe4),
               "Architecture and Urban Environment")
})

