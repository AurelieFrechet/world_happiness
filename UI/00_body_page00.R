body_content[[length(body_content) + 1]] <-
  tabItem("carte_monde",
        highchartOutput(outputId = "carte"))