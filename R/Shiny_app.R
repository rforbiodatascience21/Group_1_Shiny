####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from Winston Chang, 
# https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
# install.packages("shiny")
# install.packages("shinythemes")
library(shiny)
library(shinythemes)
library(usethis)
library(devtools)

#library(remotes)
#library(usethis)

library(remotes)

# get group 1 rpackage 
# loading require package usethis 
remotes::install_github("rforbiodatascience21/2021_group_1_rpackage", force = TRUE) #rforbiodatascience21/2021_group_1_rpackage
library("lab08aSimpleRpackage")

# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  # theme = "cerulean",  # <--- To use a theme, uncomment this
                  "My first app",
                  tabPanel("Generate DNA seq",
                           sidebarPanel(
                             tags$h3("Input desired length for DNA seq:"),
                             numericInput("size", "DNA length:",11, 3, 100 ), # DNA length input 
                             
                             
                           ), # sidebarPanel
                           mainPanel(
                             h1("Header 1"),
                             
                             h4("random DNA seq:"),
                             verbatimTextOutput("dna_ran"),
                             
                           ) # mainPanel
                           
                  ), # Navbar 2, tabPanel
                  tabPanel("Generate RNA seq:",
                           sidebarPanel(
                             tags$h3("Input desired length for RNA seq:"),
                             numericInput("size_RNA", "RNA length:",11, 3, 100 ), # RNA length input 
                             
                           ), # sidebarPanel
                           mainPanel(
                             h1("Header 1"),
                             
                             h4("random RNA seq:"),
                             verbatimTextOutput("rna_ran"),
                             
                           ) # mainPanel
                           )
                  
                ) # navbarPage
) # fluidPage
  

# Define server function  
server <- function(input, output){
  
  
  output$dna_ran <- renderText({
    random_dna(l=input$size)
  })
  
  output$rna_ran <- renderText({
    random_rna(l=input$size_RNA)
  })
  
  
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)
