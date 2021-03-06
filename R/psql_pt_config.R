psql_pt_config <- function(con = NULL){

  if (is.null(con)){
    stop("Você deve fornecer uma conexão válida")

  }

  q1 <- glue::glue_sql("CREATE EXTENSION unaccent",.con= con)
  DBI::dbExecute(con,q1)

  q2 <- glue::glue_sql("CREATE EXTENSION pg_trgm",.con = con)

  DBI::dbExecute(con,q2)

  q3 <- glue::glue_sql("CREATE TEXT SEARCH CONFIGURATION pt (COPY = pg_catalog.portuguese)",.con=con)

  DBI::dbExecute(con,q3)

  q4 <- glue::glue_sql("ALTER TEXT SEARCH CONFIGURATION pt
ALTER MAPPING FOR hword, hword_part, word with unaccent, portuguese_stem",.con = con)

  DBI::dbExecute(con,q4)

  q5 <- glue::glue_sql("CREATE TEXT SEARCH DICTIONARY public.portuguese_dic (
TEMPLATE = ispell,
DictFile = pt_br,
AffFile = pt_br,
stopwords = portuguese)",.con = con)

  DBI::dbExecute(con,q5)

  q6 <- glue::glue_sql("ALTER TEXT SEARCH CONFIGURATION pt
     ALTER MAPPING FOR hword, hword_part, word
      WITH public.portuguese_dic",.con = con)

  DBI::dbExecute(con,q6)

}
