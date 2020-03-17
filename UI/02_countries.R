body_content[[length(body_content) + 1]] <-
  tabItem("country",
          pickerInput(
            inputId = "country_select",
            label = "", 
            choices = countries_list,
            width = "100%",
            options = list(
              title = "Pick a country")
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
          h3("Evolution of score composition"),
          plotlyOutput("country_area")
  )