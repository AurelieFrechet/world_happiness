
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



# Mise en une seule table -------------------------------------------------

wh_data <- rbindlist(list(wh_2015[, year := 2015],
                          wh_2016[, year := 2016],
                          wh_2017[, year := 2017],
                          wh_2018[, year := 2018],
                          wh_2019[, year := 2019]))

countries <- fread(file = file.path("data", "2015.csv"))[, .(Country, Region)]
colnames(countries) <- tolower(colnames(countries))

wh_data <- merge(x = wh_data,
                 y = countries)


# 3 - Jointure avec une carte ---------------------------------------------
mapdata <-
  get_data_from_map(download_map_data("custom/world-robinson-highres"))
str(mapdata)
mapdata <- as.data.table(mapdata)


pays_manquants<-
  unique(wh_data[!which(wh_data$country %in% mapdata$name)]$country)


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
# "Hong Kong"  & "Palestinian Territories" & North Macedonia

lapply(1:length(exception_pays), function(x) {
  wh_data <-
    wh_data[country == exception_pays[[x]], country := names(exception_pays)[x]]
})

# jointure code
wh_data <-
  wh_data %>% left_join(mapdata, 
                        by = c("country"="name"))


# 4 - Sauvegarde des tables -----------------------------------------------

# saveRDS(wh_2015, "data/wh_2015.RDS")
# saveRDS(wh_2016, "data/wh_2016.RDS")
# saveRDS(wh_2017, "data/wh_2017.RDS")

saveRDS(wh_data, "data/wh_data.RDS")

