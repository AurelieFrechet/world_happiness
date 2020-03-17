

sub_data <- reactive({
  validate(need(input$region_select != "", "Pick a region"))
  filter(current$data, region == current$region)
})

output$region_stakedbar <- 
  renderPlotly({
  stackedbar_wh(data = sub_data(),
                year = current$year)
})

output$region_lines <-
  renderPlotly({
    lines_wh(data = sub_data(),
             indicator = current$indicator)
  })