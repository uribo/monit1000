#' Read Monitoring Site SIN01 (Tree Individual Survey) file
#' @param path path to csv (TreeDataCSV2)
#' @param tidy logical. If *true* (default), the year variable is made independent,
#' and the items that are repeatedly observed are stored in the variable.
#' @details Version 201906. Unknown and irregular value are replace to *NA*.
#' @seealso [http://www.biodic.go.jp/moni1000/findings/data/index_file.html](http://www.biodic.go.jp/moni1000/findings/data/index_file.html)
#' @examples
#' file <-
#' system.file("extdata/dummy-TreeGbh-2004-2018-ver2.transf.csv",
#'             package = "monit1000")
#' read_sin01(file, tidy = TRUE)
#' @export
read_sin01 <- function(path, tidy = TRUE) {
  if (tidy == TRUE) {
    d <-
      suppressMessages(
        readr::read_csv(path,
                        comment = "#",
                        col_types = readr::cols(.default = readr::col_character())))
    d <-
      d %>%
      tidyr::pivot_longer(cols = tidyselect::matches("^(gbh|note|s_date|dl|rec|error)"),
                          names_to = c("type", "year"),
                          names_pattern = "^(gbh|note|s_date|dl|rec|error)([0-9]{2})",
                          values_to = "value",
                          names_prefix = "year") %>%
      tidyr::pivot_wider(
        names_from = "type",
        values_from = "value") %>%
      readr::type_convert(
        col_types = readr::cols(
          mesh_xcord = "c",
          mesh_ycord = "c",
          tag_no = "c",
          indv_no = "c",
          stem_xcord = "d",
          stem_ycord = "d",
          spc_japan = "c",
          # stem_id,indv_id,
          year = "c",
          gbh = "d",
          note = "c",
          s_date = readr::col_date(format = "%Y%m%d"),
          dl = "i",
          rec = "i",
          error = "i")) %>%
      dplyr::select(tidyselect::starts_with("mesh_"),
                    "tag_no",
                    "indv_no",
                    tidyselect::starts_with("stem_"),
                    "spc_japan",
                    "stem_id",
                    "indv_id",
                    "year",
                    "gbh",
                    "note",
                    "s_date",
                    "dl",
                    "rec",
                    "error",
                    tidyselect::everything())
  } else {
    d <-
      readr::read_csv(path,
                      comment = "#")
  }
  d
}
