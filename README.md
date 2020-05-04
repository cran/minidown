
# minidown

<!-- badges: start -->
[![R build status](https://github.com/atusy/minidown/workflows/R-CMD-check/badge.svg)](https://github.com/atusy/minidown/actions)
<!-- badges: end -->

Create simple yet powerful html documents with lightweight CSS frameworks.

## Installation

``` r
remotes::install_github("atusy/minidown")
```

## Features

* Light weight CSS frameworks
    * [sakura](https://oxal.org/projects/sakura/) (default)
    * [water](https://kognise.github.io/water.css/)
    * [mini](https://minicss.org/) (archived)
    * and more in the future based on the list in
      [Awesome CSS Frameworks](https://github.com/troxler/awesome-css-frameworks)
* Code folding
  * for source, output, message, warning, and error
* Accordions
* Tooltip
* Floating TOC
* Math with KaTeX
* HTML5
  * The Pandoc's HTML5 template is minimally modified by
    * removing math section to support KaTeX CDN even if self contained
    * wrapping body paragraphs by the `<article>` tag.
  * Output format is HTML4 as an exception if `framework = "bootstrap"`.

## Philosophy

In the order of priority.

1. Simple and extensible developments
    * Use less external dependencies such as JavaScript.
    * Let Pandoc do things as much as possible
        * Not to reinvent the wheel
2. Light weight output results

