## Setup the Shiny Environment

library(shiny)
library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(coronavirus)

coronavirus %>% 
  filter(Province.State == "") ->
  coronavirus.subset

countries <- unique(coronavirus.subset$Country.Region)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Coronavirus Tracker"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "userCountry", 
                        label = "Select a country:", 
                        choices = countries, 
                        selected = "Belgium", 
                        multiple = TRUE,
                        ),
            dateRangeInput(inputId = "userDates", label = "Select Date Range", 
                           min = min(coronavirus.subset$date), 
                           max = max(coronavirus.subset$date), 
                           start = min(coronavirus.subset$date), 
                           end = max(coronavirus.subset$date)
                          )
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput(outputId = "TrendPlot")
           # ,
           # textOutput(outputId = "DateChosen")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$TrendPlot <- renderPlot({
        
        coronavirus.subset %>%
        filter(Country.Region %in% input$userCountry) %>%
        filter(date > input$userDates[1]) %>%
        filter(date < input$userDates[2]) %>%
        ggplot(mapping = aes(x = date, y = cases)) ->
        p.plot
        
      p.final <- p.plot + 
        geom_smooth(mapping = aes(color = Country.Region, fill = Country.Region)) + 
        facet_grid(~type) + theme(legend.position = "bottom")
        
      return(p.final)
    })
    
    # output$DateChosen <- renderText({
    #   return(paste(input$userDates[1], input$userDates[2]))
    # })
}

# Run the application 
shinyApp(ui = ui, server = server)
