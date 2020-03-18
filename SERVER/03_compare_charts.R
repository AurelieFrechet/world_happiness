

compare_filter <- reactive({
  validate(need(input$compare_select != "", "Choose countries"))
  dplyr::filter(current$data, country %in% current$compare)
})

output$compare_stakedbar <- 
  renderPlotly({
  stackedbar_wh(data = compare_filter(),
                year = current$year)
})

output$compare_lines <-
  renderPlotly({
    lines_wh(data = compare_filter(),
             indicator = current$indicator)
  })


# Titles ------------------------------------------------------------------

output$compare_lines_title <-
  renderUI({HTML(paste(
    "<h2>Evolution of", current$indicator, "by year</h2>"
  ))})
