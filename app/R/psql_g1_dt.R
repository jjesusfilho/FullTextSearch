psql_dt_g1 <-  function(df){

  DT::datatable(df,
                extensions = 'Responsive',
                rownames=FALSE,
                filter="top",
                escape= FALSE,
                selection = 'none',
                options=list(lengthChange=FALSE,
                             dom = 'Bfrtip',
                             buttons = c("txt"),
                             responsive=TRUE,
                             buttons=TRUE,
                             language=list(search="Busca",
                                           info="Mostrando de _START_ a _END_ de _TOTAL_ decisões",
                                           lengthMenu="Mostre _MENU_ notícias",
                                           paginate=list(previous="anterior",
                                                         'next'="próximo")),
                             columnDefs = list(list(className = 'dt-justify',
                                                    targets = "corpo")))
  )

}
