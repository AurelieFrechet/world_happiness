

# Header ------------------------------------------------------------------
header <- dashboardHeader(title = "World Happiness")


# Sidebar -----------------------------------------------------------------
side <- dashboardSidebar(
  sidebarMenu(
    menuItem(text    = "World Map",
             tabName = "home",
             startExpanded = TRUE,
             menuSubItem("Map", 
                         tabName = "carte_monde"),
             sliderTextInput(
               inputId  = "year",
               label    = "Année",
               grid     = TRUE,
               choices  = c("2015", "2016", "2017"),
               selected = "2015"
             ),
             radioButtons(
               inputId = "indicateur",
               label   = "Valeur à afficher",
               choices = c("Score", "Rank", "Economy", "Family", "Health", "Freedom", "Trust", "Generosity", "Dystopia"),
               selected = "Score"
             )
    ),
    menuItem(text    = "Countries comparaison",
             tabName = "comparaison"),
    menuItem(text    = "Informations",
             tabName = "info")
  )

)

# Body --------------------------------------------------------------------
body <- dashboardBody(
  tags$style(
    type = "text/css",
    "#carte{
    width : 100%;
    height : calc(100vh - 80px) !important;
    }"
),
tabItems(
  tabItem(
  "carte_monde",
  highchartOutput(outputId = "carte")
))
  )

# Page --------------------------------------------------------------------
dashboardPage(header, side, body)



# La carte met du temps à s'afficher