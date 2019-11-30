server <- function(input, output,session) {

  observeEvent(input$botao,{

    pool <- pool::dbPool(drv = RPostgres::Postgres(),
                         dbname=noticias,
                         host="localhost",
                         user= Sys.getenv("USER"),
                         password=Sys.getenv("PASSWD"))

    onStop(function() {
      poolClose(pool)
    }) # important!




    base <- eventReactive(input$botao,{

            psql_query(pool,
                         tbl = "g1",
                         query = input$busca)

    })




    observeEvent(base(),{

      output$mydt <-  renderDataTable(


)
    })

  })
}







