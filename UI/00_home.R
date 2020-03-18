body_content[[length(body_content) + 1]] <-
  tabItem(
    "home",
    h1("Welcome to World Happiness Shinyapp"),
    br(),
    column(
      width = 4,
      p(
        "The app allows you to observe and compare the happiness
            score indicators by region or countries and from 2015 to 2019"
      ),
      p(
        HTML(
          "<i>You'll find all informations about the dataset in the Information tab</i>"
        )
      ),
      
      h3("Map is not relevant"),
      p(
        "The projection of all data on a map is time-consuming and most
        important, geographical distance, surface of countries, etc
            insert a biais in your visual interpretation."
      ),
      br(),
      p("See by yourself"),
      
      
      switchbuttons_indicator(
        inputId = "home_indicators"),
      
      sliderTextInput(
        inputId = "home_years",
        label = "Pick a year:",
        choices = years,
        width = "100%"
      )
      
    ),
    column(width = 8,
           plotlyOutput("home_map")
    )
    
  )