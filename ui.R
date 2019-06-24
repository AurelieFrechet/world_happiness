


# Header ------------------------------------------------------------------
header <- dashboardHeader(title = "World Happiness")


# Sidebar -----------------------------------------------------------------
side <- dashboardSidebar(sidebarMenu(
  menuItem(
    text    = "World Map",
    tabName = "home",
    startExpanded = TRUE,
    menuSubItem("Map",
                tabName = "carte_monde"),
    sliderTextInput(
      inputId  = "year",
      label    = "Year",
      grid     = TRUE,
      choices  = c("2015", "2016", "2017"),
      selected = "2015"
    ),
    radioButtons(
      inputId = "indicateur",
      label   = "Value",
      choices = c(
        "Score",
        "Rank",
        "Economy",
        "Family",
        "Health",
        "Freedom",
        "Trust",
        "Generosity",
        "Dystopia"
      ),
      selected = "Score"
    )
  ),
  menuItem(text    = "Countries comparaison",
           tabName = "comparaison"),
  menuItem(text    = "Informations",
           tabName = "info")
))

# Body --------------------------------------------------------------------
body <- dashboardBody(
  # Pour avoir les graphiques remplissant tout l'espace qui leur a été attribué
  tags$style(
    type = "text/css",
    ".highchart {
    width : 100%;
    height : calc(100vh - 80px) !important;
    }"
),
tabItems(
  tabItem("carte_monde",
          highchartOutput(outputId = "carte")),
  tabItem(
    "comparaison",
    box(
      width = 6,
      selectInput(
        inputId  = "pays1",
        label    = "Pays 1 :",
        choices  = sort(wh_2015$country),
        selected = "France"
      ),
      highchartOutput(outputId = "donut1")
    ),
    box(
      width = 6,
      selectInput(
        inputId  = "pays2",
        label    = "Pays 2 :",
        choices  = sort(wh_2015$country),
        selected = "Iceland"
      ),
      highchartOutput(outputId = "donut2")
    )
    
  )
  
)
  )

# Page --------------------------------------------------------------------
dashboardPage(header, side, body)



# La carte met du temps à s'afficher