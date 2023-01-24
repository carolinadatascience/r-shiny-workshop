# Server, background

library(shiny)


shinyServer(function(input, output) {                            #format for Server, always included
  
 #creating a new dataset based on user inputs
 #using if-then statements to ensure errors are not encountered if user doesn't select all elements
 #using inputIds to use user inputs to filter data
 dataset <- reactive({
    if (!is.null(input$in1) & !is.null(input$in2)){
    filter(spring2022, Month %in% input$in1 & Category %in% input$in2)
    }
  else if(!is.null(input$in1)){
    filter(spring2022, Month %in% input$in1)
    }
  else if(!is.null(input$in2)){
    filter(spring2022, Category %in% input$in2)
  }
   else if(is.null(input$in1) & is.null(input$in2)){
     spring2022
   }
  })

 #creating output plot
 #using reactive data frame (dataset) that was created in previous step
 #normal ggplot functions and additions are be used
  output$piechart <- renderPlot({
    dataset() %>%
      ggplot(aes(x="", y=Debit, fill=Category)) +
          geom_bar(stat="identity", width=1, color="white") +
          scale_fill_manual(values = c("#f38444","#1c3464","#dedde0","#8c9cb4", "#6d6b7c", "#445c84")) +
          coord_polar("y", start=0) +
          theme_void()
  })
  
  # Option 1: Create simple output table
  # output$table1 <- renderTable({
  #   spring2022 %>%
  #     arrange(.data[[input$in3]])
  # })
  
  # Option 2: Create a nicer table with kableExtra
  output$table1 <- function(){
    spring2022 %>%
      arrange(.data[[input$in3]]) %>%            #This format is needed for some dplyr functions combined with reactive inputs
      kbl() %>%
      kable_styling(bootstrap_options = "striped",fixed_thead = T, position = "l") %>%
      scroll_box(width = "850px", height = "425px")
  }
  
  #creating output line chart
  output$linechart <- renderPlot({
    if (input$in4 == T){            #choosing between 2 already created line graphs
      spend_chart_avg
    }
    else if (input$in4 == F){
      spend_chart
    }
  })
})

