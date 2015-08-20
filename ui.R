shinyUI(pageWithSidebar(
        headerPanel("Data Science Capstone Project"),
        sidebarPanel(
                textInput(inputId="inText", label = "Type a sentence"),

                #submitButton('Submit'),
                
                p('Note: It only works with English text')
        ),
        mainPanel(
                
                #code('some code'),
                #p('some ordinary text'),
                h5('You entered'),
                verbatimTextOutput("inputWords"),
                h1('TOP 3 predicted words'),
                verbatimTextOutput("total"),
                h5('TOP 3 2-gram prediction'),
                verbatimTextOutput("top1"),
                h5('TOP 3 3-gram prediction'),
                verbatimTextOutput("top2"),
                h5('TOP 3 4-gram prediction'),
                verbatimTextOutput("top3")
                
     
              
        )
))