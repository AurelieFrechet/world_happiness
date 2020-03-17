

# Initialisation ----------------------------------------------------------

side_content <- list()
body_content <- list()

files_UI <- list.files("UI/")
for(f in file.path(getwd(), "UI", files_UI)){
  source(f, local = TRUE)
}


# Header ------------------------------------------------------------------
header <- dashboardHeader(title = "World Happiness")


# Sidebar -----------------------------------------------------------------
side <- dashboardSidebar(
  side_content
)

# Body --------------------------------------------------------------------
body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  tags$div(body_content, class = "tab-content" )
)

# Page --------------------------------------------------------------------
dashboardPage(header, side, body)



# La carte met du temps à s'afficher