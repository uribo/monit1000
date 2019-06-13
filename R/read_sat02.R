read_sat02_site <- function(path) {

  readxl::read_excel(path,
                     sheet = 1,
                     col_types = c("skip", "text", "text",
                                   "text", "text", "text", "text", "text", "text",
                                   "skip", "text", "skip", "numeric", "skip",
                                   "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "skip",
                                   "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "skip",
                                   "text"),
                     col_names = c("サイトID", "サイト名",
                                   "都道府県", "住所", "緯度", "経度", "緯度詳細", "経度詳細",
                                   "現地調査主体", "調査ルート長(m)",
                                   paste0("調査回数(繁殖期)_",
                                          seq.int(2006, 2012),
                                          "年度"),
                                   paste0("調査回数(越冬期)_",
                                          seq.int(2006, 2012),
                                          "年度"),
                                   "在来鳥類のデータの公開状況"),
                     na = c("", "-"),
                     skip = 4) %>%
    readr::type_convert()

}

read_sat02 <- function(path) {
  d <-
    readr::read_csv(path,
                  col_types = "icciicccccicccccccc",
                  locale = readr::locale(encoding = "cp932"))

  d <-
    d %>%
    purrr::set_names(
      names(d) %>%
        stringi::stri_trans_general(id = "nfkc"))

  d

}
