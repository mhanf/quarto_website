
# accordeon function
accordeon_code <- function(title,body,id,show = TRUE){
  
  collapse <- "show"
  if (show == TRUE){collapse <- "show"} else {collapse <- "hide"}
  
  div(
    class="accordion bg-white border-primary border border-1 accordion-flush",
    id = sprintf("accordeon-adapt-%s", id),
    div(
      class="accordion-item",
      div(
        id=sprintf("%s-headingOne",id),
        tags$button(
          class="accordion-button bg-white p-2",
          type="button",
          'data-bs-toggle'="collapse",
          'data-bs-target'=sprintf("#%s-collapseOne",id),
          'aria-expanded'="true",
          'aria-controls'=sprintf("%s-collapseOne",id),
          div(class="fw-bold",title)
        ),
        div(
          id=sprintf("%s-collapseOne", id),
          class=sprintf("accordion-collapse collapse %s",collapse),
          'aria-labelledby'=sprintf("%s-headingOne",id),
          div(
            class="accordion-body border-top border-primary",
            body
          )
        )
      )
    )
  )
}

resume_code <- function(title, subtitle, text = NULL, place, date){
    div(
    class = "d-flex justify-content-between",
    div(
    p(class = "m-1 fw-bold",title),
    p(class = "m-1",subtitle),
    if (is.null(subtitle) == FALSE){
    p(class = "m-1",text)
    }
    ),
    div(
      p(class = "m-1 text-end", place),
      p(class = "m-1 text-end",date)
    ))
}




progress_bar <- function(title,pct){
  div(
    class="m-2",
    div(
      title
      ),
    div(
      class='progress border-1 border border-primary bg-primary',
      role='progressbar',
      style="height: 12px",
      'aria-label'='Success example',
      'aria-valuenow'= pct,
      'aria-valuemin'='0',
      'aria-valuemax'='100',
      tags$div(
        class='progress-bar bg-white progress-bar-striped progress-bar-animated',
        style=paste0("width: ",pct,"%")
        )
      )
      )
}

