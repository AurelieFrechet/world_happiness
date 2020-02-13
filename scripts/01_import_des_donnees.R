
# 0 - Chargement des packages ---------------------------------------------
if (!require(data.table))
  install.packages("data.table")
if (!require(maps))
  install.packages("maps")
if (!require(mapdata))
  install.packages("mapdata")
if (!require(dplyr))
  install.packages("dplyr")
if (!require(highcharter))
  install.packages("highcharter")

library(data.table)
library(dplyr)
library(highcharter)
library(stringr)


# 0 - Chargement des fonctions --------------------------------------------

source("functions/rename_variables_wh.R")


# 1 - Chargement des données ----------------------------------------------
# source : https://www.kaggle.com/unsdsn/world-happiness/downloads/

files_data <- list.files(file.path(getwd(), "data")) %>%
  str_extract(pattern = "(\\w+).csv") %>%  # seulement les fichiers mot.csv
  {
    .[!is.na(.)]
  }                           # retire les NAs

for (f in files_data) {
  assign(x = paste(
    "wh",
    str_replace(f, pattern = "(\\w+).csv", replace = "\\1"),
    sep = "_"
  ),
  value = rename_variables_wh(fread(file.path(getwd(), "data", f))))
}



# 2 - Jointure avec une carte ---------------------------------------------
mapdata <-
  get_data_from_map(download_map_data("custom/world-robinson-highres"))
str(mapdata)
mapdata <- as.data.table(mapdata)


pays_manquants_2015 <-
  wh_2015[!which(wh_2015$country %in% mapdata$name)]$country # 9 manquants
pays_manquants_2016 <-
  wh_2016[!which(wh_2016$country %in% mapdata$name)]$country # 9 manquants
pays_manquants_2017 <-
  wh_2017[!which(wh_2017$country %in% mapdata$name)]$country # 9 manquants


# Recherche avec mapdata$name[grepl(nom_pays, mapdata$name)]
exception_pays <- list(
  "United States of America"          = "United States",
  "Republic of Serbia"                = "Serbia",
  "United Republic of Tanzania"       = "Tanzania",
  "Taiwan"                            = "Taiwan Province of China",
  "Northern Cyprus"                   = "North Cyprus",
  "Democratic Republic of the Congo"  = "Congo (Kinshasa)" ,
  "Republic of Congo"                 = "Congo (Brazzaville)",
  "Somaliland"                        = "Somaliland Region",
  "Somaliland"                        = "Somaliland region"
)
# "Hong Kong"  & "Palestinian Territories"

lapply(1:length(exception_pays), function(x) {
  wh_2015 <-
    wh_2015[country == exception_pays[[x]], country := names(exception_pays)[x]]
  wh_2016 <-
    wh_2016[country == exception_pays[[x]], country := names(exception_pays)[x]]
  wh_2017 <-
    wh_2017[country == exception_pays[[x]], country := names(exception_pays)[x]]
})



# 3 - Sauvegarde des tables -----------------------------------------------

saveRDS(wh_2015, "data/wh_2015.RDS")
saveRDS(wh_2015, "data/wh_2016.RDS")
saveRDS(wh_2015, "data/wh_2017.RDS")
