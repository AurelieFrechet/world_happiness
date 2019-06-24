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
        minColor = "#ffffff", 
        maxColor = "#ffe700"
      ) %>%
      hc_chart(backgroundColor = "#303030")
  )
  
  

# Compareur Pays 2 à 2 ----------------------------------------------------
  stat_pays <- function(pays) {
    # Calcul de la table
    table_score <- dcast(melt(wh_data()[country == pays,
                                      .(country,
                                        economy,
                                        family,
                                        health,
                                        freedom,
                                        trust,
                                        generosity,
                                        dystopia)], id.vars = "country"), variable ~ country)
    colnames(table_score) <- c("label", "value")
    
    # Tracé du graph
    donut_score <- highchart() %>%
      hc_chart(type = "pie") %>%
      hc_add_series_labels_values(
        label =  c(
          "Economy",
          "Family",
          "Health",
          "Freedom",
          "Trust",
          "Generosity",
          "Dystopia"
        ),
        value = table_score$value,
        size = "100%",
        innerSize = "60%"
      ) %>%
      hc_tooltip(
        formatter = JS(
          "function(){
        return (this.point.name + ':<br/>' +
        Highcharts.numberFormat(this.y, 3))
        }"
        )
      )%>%
      hc_plotOptions(
        pie = list(dataLabels = 
                     list(distance = -50))
      )
    return(donut_score)
  }

  output$donut1  <- renderHighchart(stat_pays(input$pays1))
  output$donut2 <-  renderHighchart(stat_pays(input$pays2))
}