#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#

library(shiny)
load("capstone.RData")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$result1 <- renderText({
    paste("Based on the sentence entered, the keyboard presents three options for what the next word might be.")
  })
  output$result2 <- renderText({
    paste("For example, if you entered 'I went to the', the three words might be gym, store, restaurant.")
  })
  output$value <- renderText({
    if (input$caption == ''|input$caption == 'Enter here') {
      t="Please enter your sentence in the input box provided on the left"
    }
    else{
      text_trim<-gsub("^\\s+|\\s+$", "", input$caption)
      text_trim<-sapply(text_trim, tolower)
      text_trim<-gsub("[^[:alnum:][:space:]']", "",text_trim)
      
      text_length<-sapply(strsplit(text_trim, " "), length)
      
      
      dirname<-"/Users/shilpasinha/Documents/Coursera John Hopkins Assignments/Capstone Project/Final Submission/Next_Word_Predictor"
      
      library(RCurl)
      library(stringr)
      
      if (text_length>=3){
          if(text_length>3){
            text<-word(text_trim,-3,-1)
            text<-paste("^",text," ",sep ='')
          }else{
            text<-text_trim
            text<-paste("^",text," ",sep ='')
          }
        
          subset<-subset(quad,grepl(text,quad$ngrams))
          HTML(paste(word(subset[1,2],-2,-1), word(subset[2,2],-2,-1), word(subset[3,2],-2,-1), sep=" "))
        }
      else if(text_length==2){
          text<-text_trim
          text<-paste("^",text," ",sep ='')
          subset<-subset(tri,grepl(text,tri$ngrams))
          HTML(paste(word(subset[1,2],-2,-1), word(subset[2,2],-2,-1), word(subset[3,2],-2,-1), sep=" "))
      }
      else{
          text<-text_trim
          text<-paste("^",text," ",sep ='')
          subset<-subset(bi,grepl(text,bi$ngrams))
          HTML(paste(word(subset[1,2],-2,-1), word(subset[2,2],-2,-1), word(subset[3,2],-2,-1), sep=" "))
      }
    }
    })

})
