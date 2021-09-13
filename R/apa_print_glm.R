#' Add odds ratios and model fit statistics to a glm object
#'
#' Default functions for logistic regressions do not output all commonly required
#' statistics for reporting. This function adds odds ratios and associated
#' confidence intervals and relevant model fit statistics.
#'
#' Qualtrics exports data with bloat, this function is an opinionated wrapper of
#' readr::read_csv() which does some initial cleaning.
#'
#' @param model a glm() object generated from a binomial logistic regression
#'
#' @return A papaja apa_print object
#' @export

apa_print_glm <- function(model) {
  output <- papaja::apa_print(model)

  glmtab <- output$table

  glmtab <-
    cbind(glmtab, exp(cbind(
      "odds_ratio" = coef(model), confint.default(model, level = 0.95)
    )))
  glmtab$OR_cis <-
    paste0("$[",
           round(glmtab$`2.5 %`, 2),
           "$, $",
           round(glmtab$`97.5 %`, 2),
           "]$")
  glmtab <-
    dplyr::select(glmtab,
                  predictor,
                  estimate,
                  ci,
                  odds_ratio,
                  OR_cis,
                  statistic,
                  p.value)

  names(glmtab) <-
    c("Predictor",
      "b",
      "ci",
      "Odds Ratio",
      "95% CI",
      "statistic",
      "p.value")

  output$table <- glmtab
  output$table$odds_ratio <- output$table$odds_ratio

  lrm_out <- rms::lrm(model$formula, data = model$data)

  output$estimate$modelfit$rsqaured <-
    paste0(
      "Nagelkerke pseduo-$R^2$ = ",
      round((lrm_out$stats[10] * 100), 2),
      "%, $\\chi^2$~(" ,
      lrm_out$stats[4],
      ")~ = ",
      round(lrm_out$stats[3], 2),
      ", $p$ = ",
      papaja::printp(lrm_out$stats[5])
    )

  output$full_result_or <-
    as.list(paste0(
      "OR = ",
      round(exp(as.numeric(output$table$b)), 2),
      ", ",
      "95% CI",
      " ",
      glmtab$`95% CI`,
      ", ",
      output$statistic
    ))

  names(output$full_result_or) <- names(output$full_result)
  return(output)
}
