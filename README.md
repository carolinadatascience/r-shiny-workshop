# R-Shiny-Workshop
*Created by [Julia Barrow](https://github.com/Juliabarrow) for Carolina Analytics and Data Science, Spring 2023*

R Shiny is a tool within R that allows users to make an interactive application that can be deployed as a webpage and used as a tool for those without programming kowledge. Shiny is a great tool specifically for those who don't know other langauges typcially used to make websites and apps and is also great to easily incorporate visualizations and data created with R code. There is also an alpha version of [Shiny for Python](https://shiny.rstudio.com/py/) avaliable, for those more comfortable with Python. 

This workshop demonstrates the basics of creating an interactive R Shiny App, including inputs, outputs, reactive functions, and images, specifically a personal finanace app to create a custom visualization of one's bank data.

## Getting Started
- R is required for the workshop, and RStudio is recommended to write and run the code in.
- Install the package `shiny` by running the following code in the console, and install any other packages needed for contents of your Shiny App, such as ggplot2
```
install.packages("shiny")
```
- Clone this repository to your computer to use and work with the demostrated code
  - This repository contains 2 folders with two different sets of code
    - `intital_app_code` contains the files for a template of the R Shiny app to initially start from
    - `final_app_code` contains the files necessary to compile the final R Shiny app
- Ensure that the file organization is maintained:
  - `ui.R`, `server.R`, `global.R`, and any csv files used should all be contained in one folder where they are the only contents
  - If images are used in your Shiny app, as they are in this workshop, include in this folder an additional folder called `www` and put any image png files in here

### Helpful Resource Links:
- [R Shiny Widget Gallery](https://shiny.rstudio.com/gallery/widget-gallery.html)
- [HTML Functions and Images](https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/)
- [Deployment Guide](https://shiny.rstudio.com/deploy/)
