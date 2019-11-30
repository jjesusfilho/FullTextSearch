psql_query <-
  function (con,
            tbl,
            query = "")
  {
    target <- "document_tokens"
    q <-
      glue::glue_sql(
        "SELECT * FROM {`tbl`}  WHERE {`tbl`}.{`target`} @@ websearch_to_tsquery('pt',{query})",
        .con = con
      )
    DBI::dbGetQuery(con, q)
  }
