#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#### This app has been modified during the course!!

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "myBins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            textInput(inputId = "userText", 
                      label = "Type the title of the plot",
                      value = "Old Faithful Histogram"),
            radioButtons(inputId="userColor",
                         label = "Choose a color",
                         choices = c("red", "blue", "green"),
                         selected = "red")
           # checkboxGroupInput(inputId = "userColor", 
            #                   label="Choose a color",
             #                  choices = c("red", "blue", "green"), 
              #                 selected = "red") # Default select
        ),

        # Show a plot of the generated distribution
        mainPanel(
          textOutput(outputId = "typeText"),
           plotOutput(outputId = "distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2] ## Taking second column : waiting time
        bins <- seq(min(x), max(x), length.out = input$myBins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = input$userColor, border = 'white',
             main = input$userText)
    })
    
    output$typeText <- renderText({
      return(paste("Number of bins equals", input$myBins))
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)
