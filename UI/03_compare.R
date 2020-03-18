body_content[[length(body_content) + 1]] <-
  tabItem(
  "compare",
  pickerInput(
    inputId = "compare_select",
    label = "", 
    choices = countries_list,
    multiple = TRUE,
    width = "100%",
    options = list(
      title = "Select multiple countries",
      `live-search` = TRUE)
  ),
  br(),
  column(width = 6,
         h2("Composition of score order by indicator"),
         plotlyOutput("compare_stakedbar"),
         sliderTextInput(
           inputId = "compare_years",
           label = "Pick a year:",
           choices = years,
           width = "100%"
         )),
  column(width = 6,
         htmlOutput("compare_lines_title"),
         plotlyOutput("compare_lines"),
         switchbuttons_indicator(
           inputId = "compare_indicators"))
  
  
  
)