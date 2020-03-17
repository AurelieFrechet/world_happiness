


map_wh <- function(data, indicator, year){
cmd <- glue("data %>%
  filter(year == {year}) %>%
  plot_ly() %>%
  add_trace(
    type = 'choropleth',
    z = ~ {indicator},
    color = ~ {indicator},
    colors = 'Blues',
    showscale = FALSE,
    text = ~ country,
    locations = ~ `iso-a3`,
    marker = list(line = list(
      color = toRGB('white'), width = 0.5
    ))
  ) %>%
  layout(
    geo = list(
      showframe = FALSE,
      showcoastlines = FALSE,
      projection = list(type = 'natural earth')
    ),
    margin = list(
      autoexpand = FALSE,
      r = 10,
      l = 10,
      t = 10,
      b = 10
    )
  )")
eval(parse(text = cmd))
}


