# minidown 0.4.0

* Fix `summary.results` chunk option not working as expected (#87)

* Changed querySelector in `highlightToC.js` so that ToC can be querried regardless of `--id-prefix` is given to Pandoc (#85).

* Introduce SASS to unify and minify CSS files. Current implementation do not include options for customizations.
  Also, the sakura and water CSS frameworks are updated to the latest versions.
  At the same time, the updated water CSS framework allows customizations via CSS variables.
  See files under `inst/frameworks/water` for available variables (#84).

* `mini_document` gains `"katex_serverside"` as a new oprion for the `katex` parameter.
  `"katex_serverside"` renders math well on shiny-based runtimes, too.
  Note that this feature may change in a later version in order to incorporate the generalized feature from [rstudio/rmarkdown#1940](https://github.com/rstudio/rmarkdown/pull/1940) (#81, #88). 

* Document how to use `_output.yml` in package vignettes (#80).

* Tabsets allow markups within tabmenus. The markups inherits from the content of corresponding headings (#78).

* Tabsets can activate nested tab of a selection on `hashChange` or `load` (#76, #77).

* Tabset determines initially active tab based on `location.hash` (#75).

* Fix tabset should not prevent rendering HTML widgets. This change let tabsets be built on load instead of DOMContentLoaded  (#74).

# minidown 0.3.0

* Fix TOC highlighting doesn't work with non-ASCII headings (#62)

* Support css framework-less minimalistic output with `minidown(framework = "none")` or `NULL`. Note that this style also omits the tooltip feature (#64, #65, #67).

# minidown 0.2.0

* The tabset feature of `mini_document` allows which tab is open by default.
  The syntax is same as the `rmarkdown::html_document`, i.e. add `.active` class to the header to be open by default (#52).

* The `code_folding` feature triggers a chunk hook by the chunk option `minidown_hook` instead of `source`. This avoids conflict with user settings (#57).

# minidown 0.1.1

* Fix `mini_document` should not run `cat()` in post processor (#51).

* Fix CRAN policy violation caused by intermediate files from rmarkdown::render (#53).

# minidown 0.1.0

## Breaking changes

* Removed accordion menu feature from `mini_document` in favor of the new tabset feature (#31).

## Major changes

* `mini_document` experimentally gains the `toc_highlight` argument with default value `FALSE`, which highlights the **floating** table of contents according to the browser's viewport. This feature requires `toc = TRUE` and `toc_float = TRUE` (#26).
* `mini_document` experimentally gains the `tabset` argument with default value `FALSE`, which converts the sections to tabs if they belong to the `tabset`-class section just like `rmarkdown::html_document`. The major difference from `rmarkdown::html_document` is that the names of tabs appear in table of contents, and are accessible by URL. (#27).
* Add the `section_divs` argument to the `mini_document` function. The default value is `TRUE`. It must be `TRUE` when enabling the tabset feature (#29).
* When switching tabs in `mini_document`'s tabset, browser's URL is updated so that users can easily share the URL of the tab with others (#30).
* Floating ToC sticks to the page in the better way. Previously, scroll moved the ToC slightly before sticking in the **sakura** framework (#36).
* Add **spcss** as a new CSS framework (#37).
* The ToC is more compact. Also, when the ToC floats, it stretches as high as viewport. Previous height was 85% of the viewport height (#40, #41).
* Added skeleton.Rmd, which means users can create `minidown::mini_document` from the menu of RStudio (**File** -> **New File** -> **R Markdown...** -> **From Template**) (#42).
* The floating ToC has better appearance. Its width remains 300px, but the main contents has changed. If viewport width is between 960px to 1260px, the main contents fills the rest of width (660px to 960px). If viewport width is larger than 1200px, the main content has the fixed width of 960px, and is centered. Previously, contents including the floating ToC are centered (#44).
* Added a vignette, "Writing Vignettes with the 'minidown' Package" (#46, #47, #48, #50).

## Bug fix

* `mini_document` no more generates invalid HTML by the `results_folding` feature, and removes the `results_folding` section when no output is made (#49).
* Fixed a conflict among the `toc_highlight` and `tabset` arguments of `mini_document` (#28).

## Internal changes

* Internal file structures have refactored (#26).

## <https://minidown.atusy.net>

* Available themes can be previewed without jumping pages. This is made possible by adding `mini_document(framework = "all")` as a choice. Note that this option is intended for internal use only. By setting this and `self_contained = FALSE`, the document adds all the stylesheets as its dependencies. Also, a `meta` element will be inserted to header, which tells the version of **minidown** package that builds the document (#35).
* Demo page adds functionality to set framework and theme via query parameter (e.g., <https://minidown.atusy.net/?framework=spcss&theme=spcss>) (#38)

# minidown 0.0.3

* The code folding feature is re-implemented. The previous implementation used five hooks on the chunk options: "class.source", "class.output", "class.message", "class.warning", "class.error". The new implementation uses a single hook on the "engine" chunk option. This allows the "class.*" chunk options be `NULL` as their default values, which is consistent with `rmarkdown::html_document()`. The previous implementation required the default values be blank string "" in order to trigger the hooks.
* The `collapse` option gains priority to the code folding feature for outputs, messages, warnings, and errors. In the future, the internal tricks will be removed by reflecting the upcoming knitr 1.31 (#22, #24).
* Layouts
  * Fixed css jitter by `a.button:hover` on the sakura framework (thanks, @jmbuhr, #20)
  * Removed the following classes from code blocks generated by chunks: `chunk-source`, `chunk-output`, `chunk-message`, `chunk-warning`, and `chunk-error`.
  * Removed a border from the floating ToC (#17)
* Bug fix
  * Internal `check_pandoc_version()` warned even if systems have Pandoc >= 2.7.2 (thanks, @eddelbuettel, #19).

# minidown 0.0.2

* New features
  * `mini_document()` adds `results_folding` option to fold entire results including figures and tables.
  * `mini_document()` adds `code_download` option
  * Add `download_rmd_button()` so that users can place a download button anywhere
    in the document.
  * `mini_document()` warns if Pandoc is older than expected. Especially, if Pandoc < 2.0, `--lua-filters` pandoc argument is omitted.
* Template and layouts
  * On template, Elements after `include-before` and `include-after` are wrapped by `<main>`
    element. Accordingly, `mini_document(toc_float = TRUE)` applies CSS Grid Layout on `<main>` element and its contents. In this way, users can safely include additional contents.
  * For the consistency with `mini_document(code_folding = TRUE)`, the max-width of body become 900px when `code_folding = FALSE`
* Bug fix
  * fix `self_contained: false` not working properly
  * exclude `toc_float`-related CSS if the `toc` option is `FALSE` (#15).

# minidown 0.0.1

* Initial release with the support of following frameworks:
  * mini.css
  * sakura
  * Water.css
