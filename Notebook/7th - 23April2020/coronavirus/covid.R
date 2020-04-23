# This area will be run only once
# Pre-definition area : defining local alignment

library(shiny)
library(coronavirus)
library(ggplot2)
library(tidyverse)

# Change variable here
coronavirus %>%
  filter(Province.State == "") -> coronavirus.filter

countries <- unique(coronavirus.filter$Country.Region)

# User Interface

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Coronavirus Tracking App"),

    # Select the country
    sidebarLayout(
        sidebarPanel(
          selectInput(inputId = "userCountry", 
                      label = "Choose country to plot",
                      choices = countries, selected = "Belgium",
                      multiple = T), # Default value is Belgium
          dateRangeInput(inputId = "userDate",
                         label = "Select the time range to view",
                         start = min(coronavirus.filter$date),
                         end = max(coronavirus.filter$date),
                         min = min(coronavirus.filter$date),
                         max = max(coronavirus.filter$date))
        ),
        

        # Show a plot 
        mainPanel(
           plotOutput("trendPlot"),
           textOutput(outputId = "dateSelected")
        )
    )
)

# Define server logic required to plot the trend
server <- function(input, output) {
  
  output$trendPlot <- renderPlot({
    ## Make a ggplot with the trends for case
    coronavirus.filter %>% 
     # filter(Country.Region == input$userCountry) -> coronavirus.selected # Compare one element only
      # For multiple selection
      filter(Country.Region %in% input$userCountry) %>% 
      filter(date > input$userDate[1]) %>% 
      filter(date < input$userDate[2]) -> coronavirus.selected 

    ## User defined the correct range
    if(input$userDate[1] > input$userDate[2]) {
      start.date <- input$userDate[2]
      end.date <- input$userDate[1]
    }
    else {
      start.date <- input$userDate[1]
      end.date <- input$userDate[2]
    }
    
    ## Initiate ggplot
    p <- ggplot(data = coronavirus.selected, 
                mapping = aes(x = date, y = cases))
    
    p.trend <- p + 
      geom_smooth(mapping = aes(color = Country.Region)) + 
      facet_grid(~type) + 
      theme(legend.position = "bottom")
  
    return(p.trend)
  })
  
  output$dateSelected <- renderText({

    return(paste("Date selected", input$userDate[1], "to", input$userDate[2]))
  })


}

# Run the application 
shinyApp(ui = ui, server = server)
