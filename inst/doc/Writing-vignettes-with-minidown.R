params <-
list(eval_render = TRUE)

## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----render-size, echo=FALSE, results.folding="none", eval=exists("params") && params$eval_render && rmarkdown::pandoc_available("2.7.2")----
render_size <- function(output_format = rmarkdown::html_vignette()) {
  this_rmd <- knitr::current_input()
  temp_html <- tempfile(fileext = ".html")
  callr::r_safe(function(...) rmarkdown::render(...),
                args = list(input = this_rmd,
                            output_format = output_format,
                            output_file = temp_html,
                            params = list(eval_render = FALSE),
                            quiet = TRUE))
  file.size(temp_html)
}

formats <- list(
  html_vignette = rmarkdown::html_vignette(),
  'mini_document(framework = "spcss")' = minidown::mini_document(framework = "spcss"),
  "mini_document() # default" = minidown::mini_document(),
  "mini_document with full features" = minidown::mini_document(
    toc = TRUE,
    toc_float = TRUE,
    toc_highlight = TRUE,
    code_folding = "hide",
    tabset = TRUE,
    code_download = TRUE,
    math = "katex_serverside"
  ),
  html_document = rmarkdown::html_document()
)

knitr::kable(tibble::enframe(
  purrr::map_dbl(formats, render_size) / 1000,
  name = "format",
  value = "size (KB)"
))

## ----ref.label="render-size", eval=FALSE--------------------------------------
#  render_size <- function(output_format = rmarkdown::html_vignette()) {
#    this_rmd <- knitr::current_input()
#    temp_html <- tempfile(fileext = ".html")
#    callr::r_safe(function(...) rmarkdown::render(...),
#                  args = list(input = this_rmd,
#                              output_format = output_format,
#                              output_file = temp_html,
#                              params = list(eval_render = FALSE),
#                              quiet = TRUE))
#    file.size(temp_html)
#  }
#  
#  formats <- list(
#    html_vignette = rmarkdown::html_vignette(),
#    'mini_document(framework = "spcss")' = minidown::mini_document(framework = "spcss"),
#    "mini_document() # default" = minidown::mini_document(),
#    "mini_document with full features" = minidown::mini_document(
#      toc = TRUE,
#      toc_float = TRUE,
#      toc_highlight = TRUE,
#      code_folding = "hide",
#      tabset = TRUE,
#      code_download = TRUE,
#      math = "katex_serverside"
#    ),
#    html_document = rmarkdown::html_document()
#  )
#  
#  knitr::kable(tibble::enframe(
#    purrr::map_dbl(formats, render_size) / 1000,
#    name = "format",
#    value = "size (KB)"
#  ))

