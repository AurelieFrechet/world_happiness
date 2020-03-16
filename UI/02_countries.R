body_content[[length(body_content) + 1]] <-
  tabItem("country",
          h1("Country"),
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
          h3("Evolution of score composition")
  )