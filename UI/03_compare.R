body_content[[length(body_content) + 1]] <-
  tabItem(
  "compare",
  h1("Compare Happiness score between countries of your choice"),
  pickerInput(
    inputId = "Id082",
    label = "Options group", 
    choices = countries_list,
    multiple = TRUE,
    width = "100%"
  ),
  br(),
  column(width = 6,
         h3("Composition of score order by indicator"),
         sliderTextInput(
           inputId = "region_years",
           label = "Pick a year:",
           choices = years,
           width = "100%"
         )),
  column(width = 6,
         h3("Evolution of indicator by year"),
         radioGroupButtons(
           inputId = "region_indicators",
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