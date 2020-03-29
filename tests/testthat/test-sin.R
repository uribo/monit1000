test_that("multiplication works", {
  file <-
    system.file("extdata/dummy-TreeGbh-2004-2018-ver2.transf.csv",
              package = "monit1000")
  d <-
    read_sin01(file,
               tidy = TRUE)
  expect_equal(
    dim(d),
    c(15, 16))
  d <-
    read_sin01(file,
               tidy = FALSE)
  expect_equal(
    dim(d),
    c(1, 99))
})
