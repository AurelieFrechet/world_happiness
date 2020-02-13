side_content[[length(side_content) + 1]] <-
  sidebarMenu(
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
)