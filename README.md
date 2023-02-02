# R-Shiny-Workshop
*Created by Julia Barrow for Carolina Analytics and Data Science, Spring 2023*
Beginner workshop building a personal finance R Shiny app

## Getting Started
- R is required for the workshop, and RStudio is recommended to write and run the code in.
- Install the package "shiny" by running the following code in the console, and install any other packages needed for contents of your Shiny App, such as ggplot2
```
install.packages("shiny")
```
- Clone this repository to your computer to use and work with the demostrated code
  - This repository contains 2 folders with two different sets of code
    - intital_app_code contains the files for a template of the R Shiny app to initially start from
    - - final_app_code contains the files necessary to compile the final R Shiny app
- Ensure that the file organization is maintained:
  - ui.R, server.R, global.R, and any csv files used should all be contained in one folder where they are the only contents
  - If images are used in your Shiny app, as they are in this workshop, include in this folder an additional folder called 'www' and put any image pgn files in here
