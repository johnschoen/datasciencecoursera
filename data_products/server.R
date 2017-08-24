
library(shiny)

dat<-matrix(c(15, 1, 2.5 ,6.5 , 5, 5, 5), ncol = 1, nrow = 7)

shinyServer(function(input, output) {
  output$user_data <- renderText({
    
    paste0("<strong>","Your weight is ", input$weight, " pounds and your height is ", input$height, " inches", "</strong>")
  })
  
  output$results <- renderText({
    bmi = round((input$weight/(input$height)^2)*703, 1)
    if      (bmi <  15.0) cond = "<span style='color: orangered'>Very severely underweight</span>"
    else if (bmi <= 16.0) cond = "<span style='color: orange'>Severely underweight</span>"
    else if (bmi <= 18.5) cond = "<span style='color: gold'>Underweight</span>"
    else if (bmi <= 25.0) cond = "<span style='color: green'>Heathy</span>"
    else if (bmi <= 30.0) cond = "<span style='color: gold'>Overweight</span>"
    else if (bmi <= 35.0) cond = "<span style='color: orange'>Moderately obese</span>"
    else if (bmi <= 40.0) cond = "<span style='color: red'>Severely obese</span>"
    else                  cond = "<span style='color: red'>Very severely obese</span>"
    paste0("<strong>","Your BMI is ", "<strong>", bmi, "</strong>",", a level that's considered ", cond,"</strong>"
    )
  })
  
  output$plot <- renderPlot({
    bmi = round((input$weight /(input$height)^2)*703, 1)
    if (bmi>40) {bmi=40}
    else if (bmi<10) {bmi=10}
    barplot(dat, horiz = TRUE, yaxt="n", xlab = "Your BMI", main="Underweight                                             Healthy                        Overweight", col=c("orangered", "orange", "gold", "green", "gold", "orange", "orangered", "brown"))
    lines(x=c(bmi, bmi), y=c(0,1.2), col="blue", lwd=12)
  })
  
  
})
