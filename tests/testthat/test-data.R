context("test-data.R")

# sealr::transcribe(monit1000_sites, mask_seal = TRUE)
#' ℹ: Labeling on 2018-06-18 by the sealr package (v0.1.0)
test_that("check monit1000_sites statement", {
  expect_is(
    monit1000_sites,
    c("sf", "tbl_df", "tbl", "data.frame")
  )
  expect_equal(
    dim(monit1000_sites),
    c(1040L, 6L)
  )
  expect_named(
    monit1000_sites,
    c(
      "ecosystem", "subject", "type", "name", "city_name", "geometry"
    )
  )
  expect_equal(
    monit1000_sites %>% purrr::map(class) %>% unname(),
    list(
      "character", "character", "character", "character", "character",
      c("sfc_POINT", "sfc")
    )
  )
})
