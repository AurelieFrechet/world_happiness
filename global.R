


# 0 - Chargementdes packages ----------------------------------------------
library(shiny)
library(shinydashboard)
library(dplyr)
library(highcharter)
library(shinyWidgets)
library(data.table)

# 1 - Chargement des donnees ----------------------------------------------

wh_2015 <- readRDS("data/wh_2015.RDS") %>% as.data.table()
wh_2016 <- readRDS("data/wh_2016.RDS") %>% as.data.table()
wh_2017 <- readRDS("data/wh_2017.RDS") %>% as.data.table()

# 2 - Chargement de la carte ----------------------------------------------


