# User Interface

library(shiny)

shinyUI(fluidPage(                                  #format of UI, always included
  theme = shinytheme(theme = "simplex"),            #pick a theme
  h1(),                                             #using h1 function to create empty space
  img(src = "CADS logo 2.png", height = 75, width = 275), #adding an image, must be kept in www folder
  h1("CADS Personal Finance R Shiny Workshop"),     #title shown above all tabs  
  tabsetPanel(                                      #layout selection
    tabPanel("Intro",
            h1(),                                   
            h4(strong('Helpful Links')),         #strong() makes text bold
            p("R Shiny Widget Gallery:", em("https://shiny.rstudio.com/gallery/widget-gallery.html")),   # em() makes text italic
            p("HTML Functions & Images:", em("https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/")),
            h1(),
            h4(strong("Other Notes")),
            p("- HTML and Java can be used within certain parts of R Shiny code to enhance elements"),
            p("- A R Shiny app can be directly connted to a database")
    ),
    tabPanel("Piechart",                            #tab title
             h1("Total Spend"),                     #heading within tab
             sidebarLayout(                         #layout selection within tab
               sidebarPanel(                        #layout element
                 selectInput(inputId = "in1",       #inputId, used in server file
                             label = "Choose Months",
                             choices = spring2022$Month,
                             multiple = TRUE,
                             selectize = TRUE),    #style for input choice
                 selectInput(inputId = "in2",
                             label = "Choose Categories",
                             choices = spring2022$Category,
                             multiple = TRUE,
                             selectize = TRUE)
               ),
               mainPanel(                           #layout element
                 plotOutput(outputId = "piechart")  #outputId, saves space in interface for output
               )
             )
    ),
    tabPanel("Table",
             h1("All Data"),
             selectInput(inputId = 'in3',          
                         label = "Sort Table",
                         choices = colnames(spring2022)),
             tableOutput(outputId = "table1")
      
    ),
    tabPanel("Line Graph",
             h1("Spend Over Time"),
             h1(),
             h4(checkboxInput("in4", label = "Show Daily Average", value = T)),  #default will show line
             plotOutput(outputId = "linechart")
      
    )
  )
   
))
