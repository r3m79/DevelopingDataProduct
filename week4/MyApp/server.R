#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    dataSetOJ<-ToothGrowth[ToothGrowth$supp=="OJ",]
    dataSetVC<-ToothGrowth[ToothGrowth$supp=="VC",]
    modelOJ<-lm(len~dose,data=dataSetOJ)
    modelVC<-lm(len~dose,data=dataSetVC)
    modelOJpred<-reactive({
        doseInput<-input$sliderDose
        predict(modelOJ,newdata=data.frame(dose=doseInput))
    })
    modelVCpred<-reactive({
        doseInput<-input$sliderDose
        predict(modelVC,newdata=data.frame(dose=doseInput))
    })
   
  output$teethPlot <- renderPlot({
      
    doseInput<-input$sliderDose
    
    plot(ToothGrowth$dose,ToothGrowth$len,xlab="Dose",ylab="Teeth Growth",main="Teeth Growht per Dose")
      
    if(input$showSup1){
        abline(modelOJ,col="red",lwd=2)
    }
      
    if(input$showSup2){
        abline(modelVC,col="blue",lwd=2)
    }
    legend(x="topleft",legend=c("OJ Supp Prediction","VC Supp Prediction"),pch=16,col=c("red","blue"))
    points(doseInput,modelOJpred(),col="red",pch=16,cex=3)
    points(doseInput,modelVCpred(),col="blue",pch=16,cex=3)
    
  })
  
  output$predOJ<-renderText({
      modelOJpred()
  })
  output$predVC<-renderText({
      modelVCpred()
  })
})
