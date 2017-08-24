Weight Tracker: Data Products Week 4
========================================================
author: John Schoen
date: August 21, 2017
autosize: true

Overview
========================================================

This presentation is part of the final project for Coursera's Data Products course. It accompanies a Shiny App desiged to help users track their Body Mass Index, a measure of obesity.

The application can be accessed at: https://johnschoen.shinyapps.io/Weight_Tracker/

The code can be accessed at: https://github.com/johnschoen/data_products.git




The Weight Tracker
========================================================

The BMI is a rough measure of whether a person is overweight or underweight, based only on the ratio of their height to weight. 

The Weight Tracker:

 - Asks the user to input these two values using sliders for height and weight

 - Displays the results graphically.  




Code Sample
========================================================

This section of the code displays the results in a horizontal bar graph:



```r
   dat<-matrix(c(15, 1, 2.5 ,6.5 , 5, 5, 5), ncol = 1, nrow = 7)

    bmi = round(29, 1)
    if (bmi>40) {bmi=40}
    barplot(dat, horiz = TRUE, yaxt="n", xlab = "Your BMI", main="Underweight   Healthy  Overweight", col=c("orangered", "orange", "gold", "green", "gold", "orange", "orangered", "brown"))
    lines(x=c(bmi, bmi), y=c(0,1.2), col="blue", lwd=12)
```

![plot of chunk unnamed-chunk-1](Weight_Tracker_presentation-figure/unnamed-chunk-1-1.png)

Further information
========================================================

Thought the BMI is a quick, easy measure of health weight, many critics believe is too simplistic and outdated.

For more information, see these articles on the subject:

https://fivethirtyeight.com/features/bmi-is-a-terrible-measure-of-health/

http://www.slate.com/articles/health_and_science/science/2009/07/beyond_bmi.html

http://www.npr.org/templates/story/story.php?storyId=106268439

