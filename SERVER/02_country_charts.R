
output$country_area <- 
  renderPlotly({
    validate(need(input$country_select != "", "Pick a country"))
    areachart_wh(data = filter(current$data, country == current$country))
})
