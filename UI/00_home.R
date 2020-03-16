body_content[[length(body_content) + 1]] <-
  tabItem(
    "home",
    h1("Welcome to World Happiness Shinyapp"),
    br(),
    column(
      width = 3,
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
      
      
      radioGroupButtons(
        inputId = "home_indicators",
        label = "Choose an indicator:",
        choices = c(
          `<i class='fa fa-star'></i>`                = "score", 
          `<i class='fa fa-sort-amount-up'></i>`      = "rank", 
          `<i class='fa fa-hand-holding-usd'></i>`    = "economy", 
          `<i class='fa fa-child'></i>`               = "family", 
          `<i class='fa fa-heartbeat'></i>`           = "health", 
          `<i class='fa fa-dove'></i>`                = "freedom", 
          `<i class='fa fa-handshake'></i>`           = "trust", 
          `<i class='fa fa-hand-holding-heart'></i>`  = "generosity"
        ),
        justified = TRUE
      ),
      
      sliderTextInput(
        inputId = "home_years",
        label = "Pick a year:",
        choices = years,
        width = "100%"
      )
      
      
      
    ),
    column(width = 9,
           highchartOutput("carte"))
    
    
    
  )