


# 0 - Chargementdes packages ----------------------------------------------
if(!require(maps))        install.packages("maps")
if(!require(mapdata))     install.packages("mapdata")
if(!require(dplyr))       install.packages("dplyr")
if(!require(highcharter)) install.packages("highcharter")
if(!require(shinyWidgets)) install.packages("shinyWidgets")

library(dplyr)
library(highcharter)
library(shinyWidgets)

# 1 - Chargement des donnees ----------------------------------------------

wh_2015 <- readRDS("data/wh_2015.RDS")
wh_2016 <- readRDS("data/wh_2016.RDS")
wh_2017 <- readRDS("data/wh_2017.RDS")

# 2 - Chargement de la carte ----------------------------------------------


