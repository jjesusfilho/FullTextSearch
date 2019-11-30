
ui <- fluidPage(

                titlePanel("Busca de notícias do G1"),



                sidebarLayout(
                  sidebarPanel(
                    textInput("busca",
                              "Digite sua busca"),


                    actionButton("botao","Pesquisar")
                    # uiOutput("botoes")

                  ),

                  # Show a plot of the generated distribution
                  mainPanel(
                    fluidRow(column(12,DTOutput("mydt"))))
                ))


