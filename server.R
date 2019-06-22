function(input, output, session) {
  # Initialisation reactives values -------------------------------------------
  chosen_value <- reactive({
    switch(
      input$indicateur,
      "Score"      = "score", 
      "Rank"       = "rank", 
      "Economy"    = "economy", 
      "Family"     = "family", 
      "Health"     = "health", 
      "Freedom"    = "freedom", 
      "Trust"      = "trust", 
      "Generosity" = "generosity", 
      "Dystopia"   = "dystopia"
    )
  })
  
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
      data        = wh_data(),
      value       = chosen_value(),
      joinBy      = c("name", "country"),
      name        = "Score",
      borderColor = "#FAFAFA",
      borderWidth = 0.1
    ) %>% 
      hc_colorAxis(
        minColor = "#fffcdf", 
        maxColor = "#ffe700"
      ) %>%
      hc_chart(backgroundColor = "#303030")
  )
  
  

# Compareur Pays 2 à 2 ----------------------------------------------------

  
  
  output$test <- renderPrint(head(wh_data()))
  output$test2 <- renderPrint(class(input$year))
}