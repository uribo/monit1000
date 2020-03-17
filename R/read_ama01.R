read_ama01 <- function(path) {
  readr::read_csv(path,
           skip = 66,
           na = "nd",
           locale = readr::locale(encoding = "cp932"),
           col_types = "cciiiiiiiiicccccddddcccccccccccc")
}
