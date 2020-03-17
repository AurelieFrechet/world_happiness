body_content[[length(body_content) + 1]] <-
  tabItem("region",
          pickerInput(
            inputId = "region_select",
            label = "", 
            choices = regions,
            width = "100%",
            options = list(
              title = "Pick a region")
          ),
          fluidRow(
            # A static infoBox
            valueBox(
              subtitle = "1st Rank",
              value = 12,
              icon = icon("medal"),
              color = "yellow"
            ),
            # Dynamic infoBoxes
            valueBox(
              subtitle = "1st Score",
              value = 7.84,
              icon = icon("star-half-alt"),
              color = "blue"
            ),
            valueBox(
              subtitle = "Mean Score",
              value = 6.32,
              icon = icon("globe-europe"),
              color = "navy"
            )
          ),
          br(),
          column(width = 6,
                 h3("Composition of score order by indicator"),
                 plotlyOutput("region_stakedbar"),
                 sliderTextInput(
                   inputId = "region_years",
                   label = "Pick a year:",
                   choices = years,
                   width = "100%"
                 )),
          column(width = 6,
                 h3("Evolution of indicator by year"),
                 plotlyOutput("region_lines"),
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
