side_content[[length(side_content) + 1]] <-
  sidebarMenu(
  menuItem(
    text    = "World Map",
    tabName = "home",
    startExpanded = TRUE),
  menuItem(text    = "Region",
           tabName = "region"),
  menuItem(text    = "Country",
           tabName = "country"),
  menuItem(text    = "Compare",
           tabName = "compare"),
  menuItem(text    = "Informations",
           tabName = "info")
)