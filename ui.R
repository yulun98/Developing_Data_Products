library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    titlePanel("Predict duration of eruption based on waiting time to next eruption"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("Slider_waiting", "What is the waiting time to next eruption?", 43, 96, value=70.9),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE)
        ),
        # Show a plot of the generated distribution
        mainPanel(
            h3("Predicted eruption time in mins"),
            textOutput("pred1"),
            plotOutput("plot1")
        )

    )
))
    