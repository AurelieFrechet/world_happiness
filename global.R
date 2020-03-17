


# 0 - Chargementdes packages ----------------------------------------------
library(shiny)
library(shinydashboard)
library(dplyr)
library(tidyr)
library(highcharter)
library(shinyWidgets)
library(data.table)
library(stringr)
library(plotly)

# 1 - Chargement des donnees ----------------------------------------------

files_functions <- list.files("functions/")
for(f in file.path(getwd(), "functions", files_functions)){
  source(f, local = TRUE)
}

wh_data <- readRDS("data/wh_data.RDS")



# 3 - Parametres ----------------------------------------------------------
# Years for slider
years <- sort(unique(wh_data$year))

# Country for picker input
countries<- wh_data %>% 
  filter(year == min(years)) %>% 
  select(country, region) 
regions <- unique(countries$region)

countries_list <- lapply(regions, function(region){
  countries[which(countries$region == region), "country"]
})
names(countries_list) <- regions



# 2 - Couleurs ------------------------------------------------------------

colors_wh <- list(
  economy    = "#A9FF96",
  family     = "#FFBC75",
  health     = "#999EFF",
  freedom    = "#FF7599",
  trust      = "#FDEC6D",
  generosity = "#95CEFF",
  dystopia   = "#5C5C61"
)
