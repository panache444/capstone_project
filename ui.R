#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Smart Keyboard - Next word predictor tool"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      p("Typing on mobile devices can be a serious pain. Aim of smart keyboard is to predict the next word when you are typing on your phone"),
      textInput("caption", 
                "Enter part of a sentence in the input box provided below:", 
                "Enter here"),
      p("*This app takes as input a phrase (multiple words)"),
      p("**If the sentence entered is longer than 4 words, then it takes the last 4 words for prediction"),
      h5("Author - Shilpa Sinha")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4(textOutput("result1")),
      h5(textOutput("result2"),style="color:green"),
      verbatimTextOutput("value"),
      p("*NA means that there is no matching word prediction for the phrase you have typed in the corpus that I am using for this project.",style="color:grey"),
      p("Thanks for using this tool!",style="color:blue")
    )
  )
))
