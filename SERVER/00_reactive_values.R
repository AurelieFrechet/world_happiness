

# Initialisation ---------------------------------------------------------

current <- reactiveValues()

current$data <- wh_data

# Current year = min
current$year <- min(years)

# Current indicator = score
current$indicator <- "score"

# Current region
current$region <- ""

# Current country
current$country <- ""

# Current compare
current$compare <- ""



# Observers ---------------------------------------------------------------

# Home page
observeEvent(input$home_years,
             current$year <- input$home_years)

observeEvent(input$home_indicators,
             current$indicator <- input$home_indicators)

# Region Page
observeEvent(input$region_select,{
             current$region <- input$region_select
             
             current$country <- filter(current$data, score == max(sub_data()$score)) })

observeEvent(input$region_years,
             current$year <- input$region_years)

observeEvent(input$region_indicators,
             current$indicator <- input$region_indicators)

# Country page
observeEvent(input$country_select,{
             current$country <- input$country_select
             
             current$region <- unique(filter(current$data, country == current$country)$region)
             })

# Compare page
observeEvent(input$compare_select,
             current$compare <- input$compare_select)

observeEvent(input$compare_years,
             current$year <- input$compare_years)

observeEvent(input$compare_indicators,
             current$indicator <- input$compare_indicators)


# Update inputs -----------------------------------------------------------

# Region
observeEvent(current$region,{
  # Home page           
  updatePickerInput(
    session = session,
    inputId = "region_select",
    selected = current$region
  )
})

# Country
observeEvent(current$country,{
  # Home page           
  updatePickerInput(
    session = session,
    inputId = "country_select",
    selected = current$country
  )
})

# Year
observeEvent(current$year,{
  # Home page           
  updateSliderTextInput(
    session = session,
    inputId = "home_years",
    selected = current$year
  )
  # Region Page
  updateSliderTextInput(
    session = session,
    inputId = "region_years",
    selected = current$year
  )
  # Compare page
  updateSliderTextInput(
    session = session,
    inputId = "compare_years",
    selected = current$year
  )
})

# Indicator

observeEvent(current$year,{
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
