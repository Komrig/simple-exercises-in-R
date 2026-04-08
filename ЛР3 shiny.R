library(shiny)
library(ggplot2)
library(gapminder)
library(colourpicker)

ui<- fluidPage(
  titlePanel("График стран и их ожидаемая продолжительность жизни при рождении"),
  
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("year", "Год",
                  min = min(gapminder$year), max = max(gapminder$year),step = 5,value = c(1952,2007)),
      
      
      radioButtons("continent","Выборка по континенту",
                   choices = unique(gapminder$continent),
                   selected = gapminder$continent[1]),
      
      colourInput(
        inputId = "low", 
        label = "Минимальное",
        value = "yellow"
      ),
      colourInput(
        inputId = "high", 
        label = "Максимальное",
        value = "red"
      )
      
    ),
    

    mainPanel(
      plotOutput("table")
    )
  )
)

server <- function(input, output) {
  output$table <- renderPlot({
    ggplot( subset(gapminder, continent == input$continent & year <= input$year[2] & year >= input$year[1]),aes(x = lifeExp, y = country, fill = year)) +
      geom_col()+ scale_fill_gradient(low = input$low, high = input$high, na.value = NA) + labs( y = "Страна", x = "Ожидаемая продолжительность жизни при рождении",fill = "Года")
  })
  
}

shinyApp(ui, server)

