#Code to start from

# User Interface


library(shiny)

shinyUI(fluidPage(                                 
  theme = shinytheme(theme = "simplex"),           
  h1(),                                             
  img(), 
  h1(""),    
  tabsetPanel(                                
    tabPanel("Intro",
            h1(),                                   
            h4(strong('Helpful Links')),        
            p("R Shiny Widget Gallery:", em("https://shiny.rstudio.com/gallery/widget-gallery.html")),  
            p("HTML Functions & Images:", em("https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/")),
            h1(),
            h4(strong("Other Notes")),
            p("- HTML and Java can be used within certain parts of R Shiny code to enhance elements"),
            p("- A R Shiny app can be directly connted to a database"),
            p("- Shiny for Python just launched")
    ),
    
    tabPanel("Piechart",                           
             sidebarLayout(                      
               sidebarPanel(                       
                 
               ),
               mainPanel(                  
                 
               )
             )
    ),
    
    tabPanel("Table"
      
    ),
    
    tabPanel("Line Graph"
      
    )
  )
   
))
