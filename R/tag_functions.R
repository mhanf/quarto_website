#' Create an accordion element
#'
#' This function generates an accordion element using HTML markup and the Bootstrap
#' classes. The function creates a button element with the given \code{title} as the button
#' text, which when clicked, toggles the visibility of the \code{body} element. The \code{id}
#' argument is used to ensure that the button and collapsible content are associated correctly.
#'
#' @param title a character string representing the title of the accordion element.
#' @param body the content to be displayed when the accordion element is expanded.
#' @param id a character string representing a unique identifier for the accordion element.
#' @param show a logical value indicating whether the accordion element should be initially expanded.
#'
#' @return an HTML element representing the accordion element.
#'
#' @examples
#' library(htmltools)
#' accordeon_code(
#'   title = "Accordion Element",
#'   body = "This is the content that will be displayed when the accordion element is expanded.",
#'   id = "example-accordion"
#' )
#' @importFrom htmltools div tags
#' @export
#
accordeon_code <- function(title, body, id, show = TRUE) {
  if (show == TRUE) {
    collapse <- "show"
    button_collapse <- ""
  } else {
    collapse <- "hide"
    button_collapse <- "collapsed"
  }
  div(
    class = "accordion bg-white text-primary border-primary border border-1 accordion-flush",
    id = sprintf("accordeon-adapt-%s", id),
    div(
      class = "accordion-item",
      div(
        id = sprintf("%s-headingOne", id),
        tags$button(
          class = sprintf("accordion-button bg-white text-primary p-2 %s", button_collapse),
          type = "button",
          "data-bs-toggle" = "collapse",
          "data-bs-target" = sprintf("#%s-collapseOne", id),
          "aria-expanded" = "true",
          "aria-controls" = sprintf("%s-collapseOne", id),
          div(
            class = "fw-bold text-primary",
            title
          )
        ),
        div(
          id = sprintf("%s-collapseOne", id),
          class = sprintf("accordion-collapse collapse %s", collapse),
          "aria-labelledby" = sprintf("%s-headingOne", id),
          div(
            class = "accordion-body border-top border-primary",
            body
          )
        )
      )
    )
  )
}


#' Create a resume body tag
#'
#' @description This function creates a resume body tag
#' @param title Title of the resume body tag
#' @param subtitle Subtitle of the resume body tag
#' @param text Text of the resume body tag
#' @param place Place of the resume body tag
#' @param date Date of the resume body tag
#'
#' @return A resume body tag
#' @export
#' @examples
#' resume_code("Title", "Subtitle", "Text", "Place", "Date")
#' @importFrom htmltools div p

resume_code <- function(title, subtitle, text = NULL, place, date) {
  div(
    class = "grid",
    style = "--bs-gap: 0rem;",
    div(
      class = "g-col-12 g-col-md-8 align-self-start g-start-1",
      div(
        p(class = "m-1 fw-bold", title),
        p(class = "m-1", subtitle),
        if (is.null(subtitle) == FALSE) {
          p(class = "m-1", text)
        }
      )
    ),
    div(
      class = "g-col-12 g-col-md-4 align-self-end g-start-1 g-start-md-9",
      div(
        p(class = "m-1 text-start text-md-end", place),
        p(class = "m-1 text-start text-md-end", date)
      )
    )
  )
}

#' Create a progress bar
#' @description Create a progress bar with a title and a percentage
#' Roxygen2 the function progress_bar
#' @param id id of the progress bar
#' @param title title of the progress bar
#' @param pct percentage of the progress bar
#' @return a progress bar
#' @export
#' @examples
#' progress_bar(id = "progress1", title = "Progress 1", pct = 50)
#' @importFrom htmltools div tags

progress_bar <- function(id, title, pct) {
  div(
    class = "m-2",
    div(
      title
    ),
    div(
      id = id,
      class = "progress border-1 border border-primary bg-primary",
      role = "progressbar",
      style = "height: 12px",
      "aria-label" = "Success example",
      "aria-valuenow" = pct,
      "aria-valuemin" = "0",
      "aria-valuemax" = "100",
      tags$div(
        class = "progress-bar bg-white progress-bar-striped progress-bar-animated",
        style = paste0("width: ", pct, "%")
      )
    )
  )
}

#' Create an accordion body for package description
#'
#' This function takes in an image path, a describing text, a logical parameter
#' for open source, as well as a link and creates a package accordion
#'
#' @param img_path a character string specifying the image path
#' @param text an HTML  for the describing text
#' @param open a logical parameter for whether or not the package is open source
#' @param link a character string for the web link
#'
#' @return A tagList object representing the package body for accordion
#'

body_package <- function(img_path,
                         text,
                         open,
                         link) {
  # set parameters depending on open parameter
  if (open) {
    lock_icon <- "lock-open"
    lock_text <- "Open"
    link_icon <- "github"
  } else {
    lock_icon <- "lock"
    lock_text <- "Private"
    link_icon <- "globe"
  }
  # create body package tagList
  tagList(
    div(
      class = "grid",
      style = "--bs-gap: 1rem;",
      # image
      div(
        class = "g-col-12 g-col-md-4 align-self-center g-start-1",
        div(
          class = "text-center",
          tags$img(
            src = img_path,
            class = "img-fluid w-75",
            style = "max-width:20vh;"
          )
        )
      ),
      # text
      div(
        class = "g-col-12 g-col-md-8 align-self-center g-start-1 g-start-md-5",
        p(
          class = "m-1 mt-2 text-left",
          text
        ),
        # icon
        div(
          class = "m-1 d-flex justify-content-between align-items-center",
          div(
            fontawesome::fa(lock_icon),
            lock_text,
            class = "fw-bold text-primary"
          ),
          tags$a(
            href = link,
            class = "btn m-0 p-0 text-primary",
            fontawesome::fa("arrow-up-right-from-square"),
            fontawesome::fa(link_icon)
          )
        )
      )
    )
  )
}


# box function
box_publi <- function(data) {
  tagList(
    tags$span(
      class = "text-primary",
      "> ",
      data$title[1]
    ),
    tags$span(
      class = "text-primary fw-bold",
      data$journal[1]
    ),
    div(
      class = "d-flex justify-content-between mt-2",
      div(
        class = "text-primary",
        data$author_place[1],
        tags$a(
          href = data$url[1],
          role = "button",
          fa("globe")
        )
      ),
      div(
        if (data$tag_infectious[1] == 1) {
          fontawesome::fa("virus")
        },
        if (data$tag_child[1] == 1) {
          fontawesome::fa("child")
        },
        if (data$tag_women[1] == 1) {
          fontawesome::fa("female")
        },
        if (data$tag_method[1] == 1) {
          fontawesome::fa("wrench")
        }
      )
    )
  )
}





selected_year_item <- function(data, selected_year, id, collapse) {
  data_selected_year <- data[data$year == selected_year, ]
  tag_year <- NULL

  for (i in 1:dim(data_selected_year)[1]) {
    tag <- div(
      id = sprintf(
        "%s-collapse%s",
        id,
        data_selected_year$year[i]
      ),
      class = sprintf(
        "accordion-collapse collapse %s",
        collapse
      ),
      "aria-labelledby" = sprintf(
        "%s-heading%s",
        id,
        data_selected_year$year[i]
      ),
      div(
        class = "accordion-body border-top border-primary",
        box_publi(data_selected_year[i, ])
      )
    )
    tag_year <- tagList(tag_year, tag)
  }
  return(tag_year)
}

# accordeon function
accordeon_mult_code <- function(data,
                                id,
                                show = TRUE) {
  if (show == TRUE) {
    collapse <- "show"
    button_collapse <- ""
  } else {
    collapse <- "hide"
    button_collapse <- "collapsed"
  }

  final_tag <- NULL
  unique_year <- unique(data$year)

  for (selected_year in unique_year) {
    tag <-
      div(
        class = "g-col-12 align-self-center g-start-1",
        div(
          class = "accordion accordion-flush bg-white text-primary border-primary border border-1 accordion-flush",
          id = sprintf("accordeon-adapt-%s", id),
          div(
            class = "accordion-item",
            div(
              id = sprintf("%s-heading%s", id, selected_year),
              tags$button(
                class = sprintf("accordion-button bg-white text-primary p-2 %s", button_collapse),
                type = "button",
                "data-bs-toggle" = "collapse",
                "data-bs-target" = sprintf("#%s-collapse%s", id, selected_year),
                "aria-expanded" = "true",
                "aria-controls" = sprintf("%s-collapse%s", id, selected_year),
                div(class = "fw-bold text-primary", selected_year)
              ),
              selected_year_item(data = data, selected_year = selected_year, id = id, collapse = collapse)
            )
          )
        )
      )
    final_tag <- tagList(final_tag, tag)
  }
  final_tag
}


js_anim <- function(){
  js_dep <- tagList(
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.min.js"),
    tags$script(src = "https://cdn.jsdelivr.net/npm/vanta@latest/dist/vanta.trunk.min.js")
  )
  return(js_dep)
}

footer_code <- function(){
  tags$footer(
    " 2023 | ",
    tags$strong("Matthieu Hanf"),
    " | ",
    tags$a("MIT License",href = "https://opensource.org/license/mit-0/"),
    class="text-center w-100 p-2", style = "position: absolute; left:0; bottom:0; background-color: transparent !important"
    )
}

