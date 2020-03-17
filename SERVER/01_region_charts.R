

# Filter on regions -------------------------------------------------------

sub_data <- reactive({
  validate(need(input$region_select != "", "Pick a region"))
  filter(current$data, region == current$region)
})


# Charts ------------------------------------------------------------------

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


# Valueboxes --------------------------------------------------------------

output$region_1st_rank <- renderValueBox({
  valueBox(
    value = min(sub_data()$rank), 
    subtitle = "1st Rank", 
    icon = icon("medal"),
    color = "yellow"
  )
})

output$region_1st_score <- renderValueBox({
  valueBox(
    value = round(max(sub_data()$score), 3), 
    subtitle = "1st Score", 
    icon = icon("star"),
    color = "yellow"
  )
})

output$region_mean_score <- renderValueBox({
  valueBox(
    value = round(mean(sub_data()$score), 3), 
    subtitle = "Mean Score", 
    icon = icon("star-half-alt"),
    color = "yellow"
  )
})