

#' Create an equal weight portfolio
#' 
#' This function calculates objective measures for an equal weight portfolio.
#' 
#' @details
#' This function is simply a wrapper around \code{\link{constrained_objective}}
#' to calculate the objective measures in the given \code{portfolio} object of
#' an equal weight portfolio. The portfolio object should include all objectives
#' to be calculated.
#' 
#' @param R an xts, vector, matrix, data frame, timeSeries or zoo object of asset returns
#' @param portfolio an object of type "portfolio" specifying the constraints and objectives for the optimization
#' @param \dots any other passthru parameters to \code{constrained_objective}
#' @return a list containing the returns, weights, objective measures, call, and portfolio object
#' @author Ross Bennett
#' @export
equal.weight <- function(R, portfolio, ...){
  # Check for portfolio object passed in
  if(!is.portfolio(portfolio)) stop("portfolio object passed in must be of class 'portfolio'")
  
  # get asset information for equal weight portfolio
  assets <- portfolio$assets
  nassets <- length(assets)
  weights <- rep(1 / nassets, nassets)
  names(weights) <- names(assets)
  
  # make sure the number of columns in R matches the number of assets
  if(ncol(R) != nassets){
    if(ncol(R) > nassets){
      R <- R[, 1:nassets]
      warning("number of assets is less than number of columns in returns object, subsetting returns object.")
    } else {
      stop("number of assets is greater than number of columns in returns object")
    }
  }
  
  out <- constrained_objective(w=weights, R=R, portfolio=portfolio, trace=TRUE, ...)$objective_measures
  return(structure(list(
    R=R,
    weights=weights,
    objective_measures=out,
    call=match.call(),
    portfolio=portfolio),
                   class=c("optimize.portfolio.eqwt", "optimize.portfolio"))
  )
}

