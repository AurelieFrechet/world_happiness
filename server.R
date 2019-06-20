function(input, output, session) {
  # Initialisation reactives values -------------------------------------------
  
  wh_data  <- reactive({
    switch(
      as.character(input$year),
      "2015" =  wh_2015,
      "2016" =  wh_2016,
      "2017" =  wh_2017
    )
  })

  
  # Carte globale -----------------------------------------------------------
  output$carte <- renderHighchart(
    hcmap(
      "custom/world-robinson-highres",
      data =   wh_data(),
      value = "score",
      joinBy = c("name", "country"),
      name = "Test",
      dataLabels = list(enabled = TRUE, format = "{point.name}"),
      borderColor = "#FAFAFA",
      borderWidth = 0.1
      
    )
  )
  
  output$test <- renderPrint(head(wh_data()))
  output$test2 <- renderPrint(class(input$year))
}