body_content[[length(body_content) + 1]] <-
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