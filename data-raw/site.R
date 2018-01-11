####################################
# サイトの位置
####################################
library(rvest)
library(dplyr)
library(sf)

x <- read_html("http://www.biodic.go.jp/moni1000/list.html")
x %>% html_nodes(css = 'body > div > div > div > table > tbody > tr > td.main_style > div > div > table')
#  html_table(1)
d <- x %>% html_nodes(xpath = '/html/body/div/div/div/table//div/div/table') %>%
  html_table(1) %>%
  .[[1]] %>%
  #slice(-1L) %>%
  rlang::set_names(c("ecosystem", "subject", "type", "name", "latitude", "longitude", "city_name")) %>%
  filter(ecosystem != "生態系",
         !ecosystem %in% jpndistrict::jpnprefs$prefecture) %>%
  mutate_all(na_if, y = "－") %>%
  readr::type_convert()

monit1000_sites <- d

devtools::use_data(monit1000_sites, overwrite = TRUE)


sf_d <- d %>%
  filter(!is.na(latitude)) %>%
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326)

library(leaflet)
leaflet() %>% addTiles() %>% addCircleMarkers(data = sf_d %>%
                                                filter(subject == "高山帯調査"))

d %>%
  filter(subject == "高山帯調査")
