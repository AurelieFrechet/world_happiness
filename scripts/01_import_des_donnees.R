


# 0 - Chargement des packages ---------------------------------------------
if(!require(data.table)) install.packages("data.table")
library(data.table)


# 1 - Chargement des données ----------------------------------------------
# source : https://www.kaggle.com/unsdsn/world-happiness/downloads/world-happiness-report.zip/2

wh_2015 <- fread("data/2015.csv")
wh_2015[, c("Standard Error") := NULL]


wh_2016 <- fread("data/2016.csv")
wh_2016[, c("Lower Confidence Interval",
            "Upper Confidence Interval") := NULL]

wh_2017 <- fread("data/2017.csv")
wh_2017[, c("Whisker.high",
            "Whisker.low") := NULL]


# 2 - Renommage des variables ---------------------------------------------

new_colnames <- c(
  "country",
  "region",
  "rank",
  "score",
  "economy",
  "family",
  "health",
  "freedom",
  "trust",
  "generosity",
  "dystopia"
)

setnames(x = wh_2015,
         old = colnames(wh_2015),
         new = new_colnames
         )



setnames(x = wh_2016,
         old = colnames(wh_2016),
         new = new_colnames
)


setnames(x = wh_2017,
         old = colnames(wh_2017),
         new = new_colnames[-2]
)


# 3 - Creation d'indice relatif au score ----------------------------------

wh_2015[, c("economy_pct",
            "family_pct",
            "health_pct",
            "freedom_pct",
            "trust_pct",
            "generosity_pct",
            "dystopia_pct") := .(economy/score,
                                 family/score,
                                 health/score,
                                 freedom/score,
                                 trust/score,
                                 generosity/score,
                                 dystopia/score)]

wh_2016[, c("economy_pct",
            "family_pct",
            "health_pct",
            "freedom_pct",
            "trust_pct",
            "generosity_pct",
            "dystopia_pct") := .(economy/score,
                                 family/score,
                                 health/score,
                                 freedom/score,
                                 trust/score,
                                 generosity/score,
                                 dystopia/score)]

wh_2017[, c("economy_pct",
            "family_pct",
            "health_pct",
            "freedom_pct",
            "trust_pct",
            "generosity_pct",
            "dystopia_pct") := .(economy/score,
                                 family/score,
                                 health/score,
                                 freedom/score,
                                 trust/score,
                                 generosity/score,
                                 dystopia/score)]



# 4 - Jointure avec une carte ---------------------------------------------
mapdata <- get_data_from_map(download_map_data("custom/world-robinson-highres"))
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

lapply(1:length(exception_pays), function(x){
  wh_2015 <- wh_2015[country == exception_pays[[x]], country := names(exception_pays)[x]]
  wh_2016 <- wh_2016[country == exception_pays[[x]], country := names(exception_pays)[x]]
  wh_2017 <- wh_2017[country == exception_pays[[x]], country := names(exception_pays)[x]]
})



# 5 - Sauvegarde des tables -----------------------------------------------

saveRDS(wh_2015, "data/wh_2015.RDS")
saveRDS(wh_2015, "data/wh_2016.RDS")
saveRDS(wh_2015, "data/wh_2017.RDS")
