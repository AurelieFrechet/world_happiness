# Filter on country -------------------------------------------------------

sub_data_country <- reactive({
  validate(need(input$country_select != "", "Pick a country"))
  filter(current$data, country == current$country)
})

sub_data_region <- reactive({
  filter(current$data, region == unique(sub_data_country()$region))
})


# Charts ------------------------------------------------------------------

output$country_area <- 
  renderPlotly({
    areachart_wh(data = sub_data_country())
})



# Valueboxes --------------------------------------------------------------

output$country_1st_rank <- renderValueBox({
  valueBox(
    value = min(sub_data_country()$rank), 
    subtitle = "Best Rank", 
    icon = icon("medal"),
    color = "yellow"
  )
})

output$country_1st_score <- renderValueBox({
  valueBox(
    value = round(max(sub_data_country()$score), 3), 
    subtitle = "Best Score", 
    icon = icon("star"),
    color = "yellow"
  )
})

output$country_mean_score <- renderValueBox({
  valueBox(
    value = round(mean(sub_data_region()$score), 3), 
    subtitle = "Mean Score of Region", 
    icon = icon("star-half-alt"),
    color = "yellow"
  )
})