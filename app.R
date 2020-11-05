#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Function for pickin' winners

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Student Funding Picker"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("awards",
                        "Number of Awards:",
                        min = 1,
                        max = 20,
                        value = 5),
            textInput("students",
                        "comma separated list of students")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           textOutput("winners")
        )
    )
)

# Define server logic 
server <- function(input, output) {

    output$winners <- renderText({
        student_list <- unlist(strsplit(input$students,","))
        sample(student_list, input$awards)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
