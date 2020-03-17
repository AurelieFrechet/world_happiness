body_content[[length(body_content) + 1]] <-
  tabItem("country",
          pickerInput(
            inputId = "country_select",
            label = "", 
            choices = countries_list,
            width = "100%",
            options = list(
              title = "Pick a country",
              `live-search` = TRUE)
          ),
          fluidRow(
            valueBoxOutput("country_1st_rank"),
            valueBoxOutput("country_1st_score"),
            valueBoxOutput("country_mean_score")
          ),
          br(),
          h3("Evolution of score composition"),
          plotlyOutput("country_area")
  )