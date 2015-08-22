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
                #h5('You entered'),
                #verbatimTextOutput("inputWords"),
                #h1('TOP 3 predicted words'),
                #verbatimTextOutput("total"),
                #h5('TOP 3 2-gram prediction'),
                #verbatimTextOutput("top1"),
                #h5('TOP 3 3-gram prediction'),
                #verbatimTextOutput("top2"),
                #h5('TOP 3 4-gram prediction'),
                #verbatimTextOutput("top3")
                
     
                tabsetPanel( type = "tabs", 
                        tabPanel("The App",                 
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
                        ), 
                        tabPanel("Instructions", 
                                                h5("You only need to type your sentence"),
                                                br(),
                                                h5("As output the App shows:"),
                                                HTML("<ol>
                                                        <li>The words you typed in. The input text is cleaned. Are only accepted alphanumeric characters.</li>
                                                        <li><b>Top 3 predicted words</b></li>
                                                        <li>Top 3 predicted words only using 2-grams</li>
                                                        <li>Top 3 predicted words only using 3-grams</li>
                                                        <li>Top 3 predicted words only using 4-grams</li>
                                                      </ol>")
                                 ), 
                        tabPanel("About", 
                                           h5("This is the first version of the Coursera Capstone Project."),
                                           br(),
                                           h5("Here you can find the raw data:"), 
                                           a(href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip","Download Raw Data"),
                                           br(),
                                           br(),
                                           h5("The exploratory data analisys:"), 
                                           a(href="http://rpubs.com/dompan19/96162","Exploratory Data Analsys"),
                                           br(),
                                           br(),
                                           h5("The repository with the source code:"), 
                                           a(href="https://github.com/dompan/capstoneProject","Source Code")
                                 )
                        
                )
        )
))