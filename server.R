function(input, output, session) {
  output$carte <- renderHighchart(
    hcmap(
      "custom/world-robinson-highres",
      data = wh_2015,
      value = "score",
      joinBy = c("name", "country"),
      name = "Test",
      dataLabels = list(enabled = TRUE, format = "{point.name}"),
      borderColor = "#FAFAFA",
      borderWidth = 0.1
      
    )
  )
}