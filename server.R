library(shiny)
data("faithful")

shinyServer(function(input, output) {
    model <- lm(eruptions~waiting, data=faithful)
    modelpred <- reactive ({
        waitingInput <- input$Slider_waiting
        predict(model, newdata= data.frame(waiting = waitingInput))
    })
    output$pred1 <- renderText({
        modelpred()
    })
    output$plot1 <- renderPlot({
        waitingInput <- input$Slider_waiting
        
        plot(faithful$waiting, faithful$eruptions,
             xlab = "Waiting time to next eruption (in mins)", 
             ylab = "Eruption time", xlim = c(43,96), ylim = c(1.3,5.4))
        
        if(input$showModel){
            abline(model, col="purple", lwd=2)
        }
        
        points(waitingInput, modelpred(), col = "pink", pch = 16, cex = 2)
    })

})
