
areachart_wh <- function(data){
data %>%
  plot_ly(
    x = ~ year,
    y = ~ economy,
    name = 'Economy',
    hovertemplate  = '%{x}',
    type = 'scatter',
    mode = 'none',
    stackgroup = 'one',
    fillcolor = colors_wh$economy
  ) %>% 
  add_trace(
    y = ~ family,
    hovertemplate  = '%{x}',
    name = 'Family',
    fillcolor = colors_wh$family
  )  %>%
  add_trace(
    y = ~ health,
    hovertemplate  = '%{x}',
    name = 'Health',
    fillcolor = colors_wh$health
  ) %>%
  add_trace(
    y = ~ freedom,
    hovertemplate  = '%{x}',
    name = 'Freedom',
    fillcolor = colors_wh$freedom
  ) %>%
  add_trace(
    y = ~ trust,
    hovertemplate  = '%{x}',
    name = 'Trust',
    fillcolor = colors_wh$trust
  ) %>%
  add_trace(
    y = ~ generosity,
    hovertemplate  = '%{x}',
    name = 'Generosity',
    fillcolor = colors_wh$generosity
  ) %>%
  add_trace(
    y = ~ dystopia,
    hovertemplate  = '%{x}',
    name = 'Dystopia',
    fillcolor = colors_wh$dystopia
  ) %>%
  layout(
    showlegend = FALSE,
    xaxis = list(title = "",
                 showgrid = FALSE),
    yaxis = list(title = "",
                 showgrid = FALSE)
  )
}
