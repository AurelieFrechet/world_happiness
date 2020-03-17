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
         h3("Composition of score order by indicator"),
         plotlyOutput("compare_stakedbar"),
         sliderTextInput(
           inputId = "compare_years",
           label = "Pick a year:",
           choices = years,
           width = "100%"
         )),
  column(width = 6,
         h3("Evolution of indicator by year"),
         plotlyOutput("compare_lines"),
         radioGroupButtons(
           inputId = "compare_indicators",
           label = "Choose an indicator:",
           choices = c(
             `<i class='fa fa-hand-holding-usd'></i>`    = "economy", 
             `<i class='fa fa-child'></i>`               = "family", 
             `<i class='fa fa-heartbeat'></i>`           = "health", 
             `<i class='fa fa-dove'></i>`                = "freedom", 
             `<i class='fa fa-handshake'></i>`           = "trust", 
             `<i class='fa fa-hand-holding-heart'></i>`  = "generosity"
           ),
           justified = TRUE
         ))
  
  
  
)