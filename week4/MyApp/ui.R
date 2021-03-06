#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Teeth Growth"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderDose","Dose usage.",.5,2,value=1,step=.5),
       checkboxInput("showSup1","Show Supplement OJ",value=TRUE),
       checkboxInput("showSup2","Show Supplement VC",value=TRUE),
       p(),
       h3("Teeth Growth prediction."),
       p("This app allows to predict the teeth growth lenght for two different supplements, by adjusting the dose."),
       h3("How to use app:"),
       p("- use the slider to select the dose of supplements provided"),
       p("- use the checkboxes to view the prediction of only one supplement"),
       em("Disclaimer:"),
       p("In the model construction it was used the ToothGrowth dataset, which doesn't include data for doses of 1.5")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("teethPlot"),
       h3("Predicted Growth for Supp OJ"),
       textOutput("predOJ"),
       h3("Predicted Growth for Supp VC"),
       textOutput("predVC")
    )
  )
))
