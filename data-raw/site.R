####################################
# サイトの位置
####################################
if (file.exists("data/monit1000_sites.rda") == FALSE) {
  library(rvest)
  library(dplyr)
  library(sf)

  monit1000_sites <-
    read_html("http://www.biodic.go.jp/moni1000/list.html") %>%
    html_nodes(css = "body > div > div > div:nth-child(2) > table:nth-child(2) > tr > td.main_style > div > div:nth-child(2) > table") %>%
    html_table(1) %>%
    purrr::pluck(1) %>%
    # #slice(-1L) %>%
    rlang::set_names(c("ecosystem", "subject", "type", "name", "latitude", "longitude", "city_name")) %>%
    filter(ecosystem != "生態系",
           !ecosystem %in% jpndistrict::jpnprefs$prefecture) %>%
    mutate_all(na_if, y = "－") %>%
    readr::type_convert() %>%
    tibble::as_tibble() %>%
    sf::st_as_sf(coords = c("longitude", "latitude"), na.fail = FALSE, crs = 4326)

  usethis::use_data(monit1000_sites, overwrite = TRUE)
}
