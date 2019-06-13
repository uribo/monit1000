read_sin04 <- function(path) {
    col_n <-
      length(names(suppressMessages(readr::read_csv(path,
                                                  locale = readr::locale(encoding = "cp932"),
                                                  n_max = 1))))
  if (col_n == 24L) {
    readr::read_csv(path,
                    locale = readr::locale(encoding = "cp932"),
                    col_types = c("cccddccccdddddddddcccccc"))
    mutate()
  } else if (col_n == 25L) {
    readr::read_csv(path,
                    locale = readr::locale(encoding = "cp932"),
                    col_types = c("cccddcccccddddddddccccccc"))
  } else if (col_n == 28L) {
    readr::read_csv(path,
                    locale = readr::locale(encoding = "cp932"),
                    col_types = c("cccddcccccddddddddcccccccccc"))
  }
}
