# Filter on country -------------------------------------------------------

sub_data_country <- reactive({
  validate(need(input$country_select != "", "Pick a country"))
  dplyr::filter(current$data, country == current$country)
})

sub_data_region <- reactive({
  validate(need(input$country_select != "", "Pick a country"))
  dplyr::filter(current$data, region == current$region)
})

best_year <- reactive({
  paste(filter(sub_data_country(), rank == min(sub_data_country()$rank))$year,
        collapse = ", ")
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
    subtitle = paste("Best Rank", best_year(), sep = " : "),
    icon = icon("medal"),
    color = "maroon"
  )
})

output$country_1st_score <- renderValueBox({
  valueBox(
    value = round(max(sub_data_country()$score), 3),
    subtitle =  paste("Best Score", best_year(), sep = " : "),
    icon = icon("star"),
    color = "maroon"
  )
})

output$country_mean_score <- renderValueBox({
  valueBox(
    value = round(mean(sub_data_region()$score), 3),
    subtitle = paste("Mean Score of", current$mean_region),
    icon = icon("star-half-alt"),
    color = "maroon"
  )
})