function(input, output, session) {
  # Initialisation reactives values -------------------------------------------
  
  input.RV <- reactiveValues()
  input.RV$current_year    <- "2015"
  input.RV$current_var     <- "score"
  input.RV$current_country <- "all"
  
  input.RV$current_data    <- wh_2015[, .(country, score)]
  
  
  
  
  # Update reactive values --------------------------------------------------
  
  # observe({
  #   input.RV$current_year    <- input$year
  # })
  # 
  # observe({
  #   input.RV$current_data <- switch(
  #     input.RV$current_year,
  #     "2015" =  {
  #       wh_2015[, c("country", input.RV$current_var)]
  #     },
  #     "2016" =   {
  #       wh_2016[, c("country", input.RV$current_var)]
  #     },
  #     "2017" =   {
  #       wh_2017[, c("country", input.RV$current_var)]
  #     }
  #   )
  # })
  
  
  # Carte globale -----------------------------------------------------------
  output$carte <- renderHighchart(
    hcmap(
      "custom/world-robinson-highres",
      data = input.RV$current_data,
      value = "score",
      joinBy = c("name", "country"),
      name = "Test",
      dataLabels = list(enabled = TRUE, format = "{point.name}"),
      borderColor = "#FAFAFA",
      borderWidth = 0.1
      
    )
  )
  
  output$test <- renderPrint(head(input.RV$current_data))
  
}