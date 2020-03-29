####################################
# 森林・草原調査
# 毎木調査
# TreeDataEXCEL, TreeDataCSV1, TreeDataCSV2と同様のファイルが3種類ある
# TreeDataEXCEL: 毎木データ、調査記録、調査区の情報
# TreeDataCSV1: 毎木データのみ
# TreeDataCSV2: TreeDataCSV1を変形
####################################
pkgload::load_all()
library(dplyr)
library(tidyr)
library(assertr)
library(ensurer)
library(readr)
library(readxl)
# library(drake)
files <-
  list.files("data-raw/SIN01/",
             full.names = TRUE) %>%
  ensure(length(.) == 6L)

df_update_info <-
  files %>%
  grep("更新履歴.xls", x = .,  value = TRUE) %>%
  read_xls(skip = 2) %>%
  verify(dim(.) == c(7, 3))

# PlotList ----------------------------------------------------------------
df_sin01_site <-
  files %>%
  grep("PlotList", x = .,  value = TRUE) %>%
  read_xlsx(skip = 3) %>%
  verify(dim(.) == c(73, 24))


# TreeDataEXCEL -----------------------------------------------------------
# TreeDataCSV1 ------------------------------------------------------------
# TreeDataCSV2...  ------------------------------------------------------------
files_treedata <-
  files %>%
  grep("TreeDataCSV2", x = .,  value = TRUE) %>%
  list.files(recursive = TRUE,
             full.names = TRUE)

d <-
  read_sin01(files_treedata[5], tidy = TRUE)
read_sin01(files_treedata[5], tidy = FALSE)
