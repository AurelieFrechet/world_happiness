


# Initialisation ---------------------------------------------------------

current <- reactiveValues()

current$data <- wh_data

# Current year = min
current$year <- min(years)

# Current indicator = score
current$indicator <- "score"

# Current region
current$region <- ""
current$mean_region <- ""

# Current country
current$country <- ""
current$best_country <- ""

# Current compare
current$compare <- ""



# Observers ---------------------------------------------------------------

# Home page
observe({
  input$home_years
  current$year <- input$home_years
})

observe({
  input$home_indicators
  current$indicator <- input$home_indicators
})

# Region Page
observeEvent(input$region_select, {
  current$region <- input$region_select
  current$best_country <-
    dplyr::filter(sub_data(), score == max(sub_data()$score))$country
})

observe({
  input$region_years
  current$year <- input$region_years
})

observe({
  input$region_indicators
  current$indicator <- input$region_indicators
})

# Country page
observeEvent(input$country_select, {
  current$country <- input$country_select
  current$mean_region <-
    unique(dplyr::filter(current$data, country == current$country)$region)
})

# Compare page
observe({
  input$compare_select
  current$compare <- input$compare_select
})

observe({
  input$compare_years
  current$year <- input$compare_years
})

observe({
  input$compare_indicators
  current$indicator <- input$compare_indicators
})


# Update inputs -----------------------------------------------------------

# Year
observeEvent(current$year, {
  # Home page
  updateSliderTextInput(session = session,
                        inputId = "home_years",
                        selected = current$year)
  # Region Page
  updateSliderTextInput(session = session,
                        inputId = "region_years",
                        selected = current$year)
  # Compare page
  updateSliderTextInput(session = session,
                        inputId = "compare_years",
                        selected = current$year)
})

# Indicator

observeEvent(current$indicator, {
  # Home page
  updateRadioGroupButtons(
    session = session,
    inputId = "home_indicators",
    selected = current$indicator
  )
  # Region Page
  updateRadioGroupButtons(
    session = session,
    inputId = "region_indicators",
    selected = current$indicator
  )
  # Compare page
  updateRadioGroupButtons(
    session = session,
    inputId = "compare_indicators",
    selected = current$indicator
  )
})
