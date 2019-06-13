read_sin04 <- function(path) {
    col_n <-
      length(names(suppressMessages(readr::read_csv(path,
                                                  locale = readr::locale(encoding = "cp932"),
                                                  n_max = 1))))
  if (col_n == 24L) {
    d <- readr::read_csv(path,
                    locale = readr::locale(encoding = "cp932"),
                    col_types = c("cccddccccdddddddddcccccc"))
  } else if (col_n == 25L) {
    d <- readr::read_csv(path,
                    locale = readr::locale(encoding = "cp932"),
                    col_types = c("cccddcccccddddddddccccccc"))
  } else if (col_n == 28L) {
    d <- readr::read_csv(path,
                    locale = readr::locale(encoding = "cp932"),
                    col_types = c("cccddcccccddddddddcccccccccc"))
  }
    d %>%
      dplyr::mutate(`個体数` = dplyr::na_if(`個体数`, "\uff0d") %>%
                      as.numeric())
}
