library(shiny)

#Define UI
ui <- fluidPage(
 
 titlePanel("Old Faithful Geyser Data"),

 #Sidebar
 sidebarLayout(
    sidebarPanel(
        sliderInput("bins",
        "Number of bins:",
        min = 1,
        max = 50,
        value = 30)
    ),

    #Show a plot of the generated distribution
    mainPanel(
        plotOutput("distPlot")
    )
 )

)

# Define server

server <- function(input, output) {

    output$distPlot <- renderPlot({
        #generate bins based on input$bins from ui
        x <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        #draw histogram
        hist(x, breaks = bins, col = "blue", border = "white",
        xlab = "Waiting time to next eruption (in mins)",
        main = "Histogram of waiting times")
    })
}

#Run the application
shinyApp(ui = ui, server = server)