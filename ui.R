fluidPage(
  titlePanel("World Happiness"),
  fluidRow(align = "center",
           highchartOutput("carte")),
  fluidRow(align = "center", 
    sliderTextInput(
      inputId = "year",
      label = "Année",
      grid = TRUE,
      choices = c("2015", "2016", "2017")
    )
  ),
  fluidRow(column(width = 4,
                  textOutput("test")),
           column(width = 7, offset = 1))

)

# La carte met du temps à s'afficher