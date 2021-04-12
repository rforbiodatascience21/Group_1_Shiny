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
library(devtools)
library(remotes)
library(usethis)
# get group 1 rpackage 
# loading require package usethis 
remotes::install_github("rforbiodatascience21/2021_group_1_rpackage", force = TRUE) #rforbiodatascience21/2021_group_1_rpackage
library("lab08aSimpleRpackage")

random_dna <- function(l){
  nucleotides <- sample(c("A", "T", "G", "C"), size = l, replace = TRUE)
  dna = paste0(nucleotides, collapse = "")
  return(dna)
}

# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  # theme = "cerulean",  # <--- To use a theme, uncomment this
                  "My first app",
                  tabPanel("Navbar 1",
                           sidebarPanel(
                             tags$h3("Input desired length for DNA seq:"),
                             numericInput("length", "DNA length:",11, 3, 100 ), # DNA length input 
                             #textInput("txt2", "Surname:", ""),
                             
                           ), # sidebarPanel
                           mainPanel(
                             h1("Header 1"),
                             
                             h4("Output 1"),
                             verbatimTextOutput("dna_ran"),
                             
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  tabPanel("Navbar 2", "This panel is intentionally left blank"),
                  tabPanel("Navbar 3", "This panel is intentionally left blank")
                  
                ) # navbarPage
) # fluidPage


# Define server function  
server <- function(input, output){
  dna_ran = random_dna(l=input$length)
  
  output$dna_ran <- renderText({
    dna_ran
  })
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)
