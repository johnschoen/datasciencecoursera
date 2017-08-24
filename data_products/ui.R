
library(shiny)
shinyUI(fluidPage(
  titlePanel("Body Mass Index (BMI) Calculator"),
    h4("The BMI is rough estimtate of the your tissue mass, which allows for a rough calculation of whether you are underweight, normal weight, overweight, or obese."),
    h4("A more precise estimate requires additional tests."
    ),
  sidebarLayout(sidebarPanel(
    helpText("To calculate your body mass index, use the sliders to enter your weight and height."),
    sliderInput(
        inputId = "height",
        label = h3("Set the slider to your height in inches:"),
        min = 50,
        max = 90,
        value = 65
    ), #User height input slider
    sliderInput(
      inputId = "weight",
      label = h3("Set the slider to your weight in pounds:"),
      min = 100,
      max = 350,
      value = 174
    ), #User mass input slider
    h5("The BMI is rough estimtate of the your tissue mass, which allows for a rough calculation of whether you are underweight, normal weight, overweight, or obese."),
    h5("A more precise estimate requires additional tests.")
    ),
                
    mainPanel(
      h3(uiOutput("user_data")), #Text with the user data
      plotOutput("plot", height = "275px", width = "100%"), #Colorful plot of the user BMI
      h3(uiOutput("results")) #Text results
    ))
))
