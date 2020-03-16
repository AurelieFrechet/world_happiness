

current <- reactiveValues()

# Current year = min
current$year <- min(years)

# Current indicator = score
current$indicator <- "score"

current$data <- wh_data