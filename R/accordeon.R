#' Create a Bootstrap 5 accordion element 
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
#' accordeon_code(title = "Accordion Element",
#'                body = "This is the content that will be displayed when the accordion element is expanded.",
#'                id = "example-accordion")
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
          class = sprintf("accordion-button bg-white text-primary p-2 %s",button_collapse),
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

resume_code <- function(title, subtitle, text = NULL, place, date) {
  div(
    class = "grid",
    style="--bs-gap: 0rem;",
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
                         link
                         ){
  # set parameters depending on open parameter
  if (open){
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






