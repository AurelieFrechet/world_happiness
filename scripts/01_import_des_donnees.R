


# 0 - Chargement des packages ---------------------------------------------

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


# 4 - Sauvegarde des tables -----------------------------------------------

saveRDS(wh_2015, "data/wh_2015.RDS")
saveRDS(wh_2015, "data/wh_2016.RDS")
saveRDS(wh_2015, "data/wh_2017.RDS")
