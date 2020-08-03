context("test-data.R")

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
  # tst::expect_crs(monit1000_sites,
  #            proj4string = "+proj=longlat +datum=WGS84 +no_defs")
  tst::expect_geom_type(monit1000_sites$geometry[[1]], "POINT")
})
