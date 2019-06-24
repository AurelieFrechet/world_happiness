


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


# 2 - Couleurs ------------------------------------------------------------

colors_wh <- list(
  economy_pct    = "#A9FF96",
  family_pct     = "#FFBC75",
  health_pct     = "#999EFF",
  freedom_pct    = "#FF7599",
  trust_pct      = "#FDEC6D",
  generosity_pct = "#95CEFF",
  dystopia_pct   = "#5C5C61"
)
