setwd("/home/leone/rwd/capstone")
library(shiny)
dfBigrams<-read.csv("bigrams.csv",header=TRUE)
dfTrigrams<-read.csv("trigrams.csv",header=TRUE)
dfQuadrigrams<-read.csv("quadrigrams.csv",header=TRUE)

# Il codice inserito prima di shinyServer viene eseguito una sola volta
shinyServer(
        function(input, output) {
                # Il codice inserito in questa funzione anonima, ma non in 
                # un 'reactive statement' viene eseguito una volta per ogni
                # nuovo utente o un refresh della pagina
                
                # Il codice inserito nelle 'reactive functions' vengono 
                # eseguite ripetutamente ogni volta che vengono inseriti
                # nuovi ioutput. Reactive function sono quelle render*
                
                onlyAlpNum <- reactive({  tolower(gsub("[^[:alnum:]]"," ",input$inText))  })
                split <- reactive({  strsplit(onlyAlpNum(),split=" +")   })
              
                output$inputWords <- renderPrint({  t1<-as.vector(split())
                                                    t1[[1]]
                                                })
                #output$prediction <- renderPrint({diabetesRisk(input$glucose)})
                
                #tail(list[[1]],1) # l'ultima 
                #tail(list[[1]],2) # le ultime due
                #tail(list[[1]],3) # le ultime tre
                
                bipred<-reactive({list<-split();
                                  l<-length(list[[1]])
                                  # Vado a cercare nei bigrammi 
                                  res<-dfBigrams[dfBigrams$w1==list[[1]][l],]
                                  # Li ordino
                                  res[order(res$freq),]
                                  })
 
                tripred<-reactive({list<-split();        
                                  l<-length(list[[1]])
                                  # Vado a cercare nei trigrammi 
                                  res<-dfTrigrams[dfTrigrams$w1==list[[1]][l-1] & dfTrigrams$w2==list[[1]][l],]
                                  # Li ordino
                                  res[order(res$freq),]
                })                
      
                quadripred<-reactive({list<-split();        
                                   l<-length(list[[1]])
                                   # Vado a cercare nei trigrammi 
                                   res<-dfQuadrigrams[dfQuadrigrams$w1==list[[1]][l-2] & dfQuadrigrams$w2==list[[1]][l-1] & dfQuadrigrams$w3==list[[1]][l],]
                                   # Li ordino
                                   res[order(res$freq),]
                })                   
                
                total <- reactive({ Blist<-bipred()
                                    Tlist<-tripred()
                                    Qlist<-quadripred()
                                    
                                    list<-rbind(Blist[,2:3],Tlist[,3:4],Qlist[,4:5])
                                    list})
                
                output$total <- renderPrint({ t1<-total()
                                              if(nrow(t1)>0){
                                                  t2<-as.vector(t1[,1])    
                                                  t3<-unique(t2,fromLast = TRUE)
                                                  tail(t3,3)
                                               }
                                           })
                
        
                
                output$top1 <- renderPrint({  t1<-bipred()
                                              if(nrow(t1)>0){
                                                 t2<-as.vector(t1[,2])
                                                 tail(t2,3)
                                              }
                                          })
                output$top2 <- renderPrint({  t1<-tripred()
                                              if(nrow(t1)>0){
                                                      t2<-as.vector(t1[,3])
                                                      tail(t2,3)
                                              }
                                          })
                output$top3 <- renderPrint({ t1<-quadripred()
                                             if(nrow(t1)>0){
                                                     t2<-as.vector(t1[,4])
                                                     tail(t2,3)
                                             }
                                          })
                
                
                ###############################################################
                #      R E A C T I V E   C O N D U C T O R
                # x è 'reactive' anche se non è in una render* function
                # Serve per riutilizzare il codice e non scrivere render*
                # functions lunghissime
                #x <- reactive({as.numeric(input$text1)+100})
                #output$text1 <- renderText({x()})
                #output$text2 <- renderText({x() + as.numeric(input$text2)})
                ###############################################################
                
                ###############################################################
                #                 S U B M I T    B U T T O N 
                #output$text1 <- renderText({input$text1})
                #output$text2 <- renderText({input$text2})
                #output$text3 <- renderText({
                      
                        #input$goButton
                        #isolate(paste(input$text1, input$text2))
                        
                #        if (input$goButton == 0) "You have not pressed the button"
                #        else if (input$goButton == 1) "you pressed it once"
                #        else "OK quit pressing it"
                        
                #})
                ###############################################################
               
        }
)
