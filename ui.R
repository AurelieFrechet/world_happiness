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
  dashboardBody(
    tags$style(
      type = "text/css",
      "#carte{
          width : 100%;
          height : calc(100vh - 80px) !important;
      }"
),

  tabItems(tabItem(
    "carte_monde",
      highchartOutput(
        outputId = "carte"
    )
  )))
)

# La carte met du temps à s'afficher