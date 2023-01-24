#Code to start from

# Server, background

library(shiny)


shinyServer(function(input, output) {                            
  
 #creating a new dataset based on user inputs
 #using if-then statements to ensure errors are not encountered if user doesn't select all elements
 #using inputIds to use user inputs to filter data
  
 dataset <- reactive({
    
  })

 #creating output plot
 #using reactive data frame (dataset) that was created in previous step
 #normal ggplot functions and additions can be used
  # output$piechart <- renderPlot({
  #   dataset() %>%
  #     
  # })
 
 
  
  # Option 1: Create simple output table
  # output$table1 <- renderTable({
  #   spring2022 %>%
  #     arrange(.data[[input$in3]])
  # })
  
  # Option 2: Create a nicer table with kableExtra
  # output$table1 <- function(){
  #   spring2022 %>%
  #     arrange(.data[[input$in3]]) %>%            #This format is needed for some dplyr functions combined with reactive inputs
  #     kbl() %>%
  #     kable_styling(bootstrap_options = "striped",fixed_thead = T, position = "l") %>%
  #     scroll_box(width = "850px", height = "425px")
  # }
  
 
 
  #creating output line chart
  output$linechart <- renderPlot({
    
  })
})

