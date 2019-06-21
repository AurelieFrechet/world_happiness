dashboardPage(
  dashboardHeader(title = "World Happiness"),
  dashboardSidebar(
    sidebarMenu(
      menuItem(text    = "Carte",
               tabName = "carte_monde"),
      menuItem(text    = "Comparaison inter pays",
               tabName = "comparaison")
    ),
    sliderTextInput(
      inputId  = "year",
      label    = "Année",
      grid     = TRUE,
      choices  = c("2015", "2016", "2017"),
      selected = "2015"
    )
  ),
  dashboardBody(tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "www/css/custom.css")
  ),
  tabItems(tabItem(
    "carte_monde",
      highchartOutput(
        outputId = "carte",
        width    = "100%",
        height   = "100%"
    )
  )))
)

# La carte met du temps à s'afficher