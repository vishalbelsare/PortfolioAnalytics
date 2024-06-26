% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/constraints.R
\name{constraint_v1}
\alias{constraint_v1}
\alias{constraint}
\alias{constraint_v2}
\title{constructors for class constraint}
\usage{
constraint_v1(
  assets = NULL,
  ...,
  min,
  max,
  min_mult,
  max_mult,
  min_sum = 0.99,
  max_sum = 1.01,
  weight_seq = NULL
)

constraint(type, enabled = TRUE, ..., constrclass = "v2_constraint")
}
\arguments{
\item{assets}{number of assets, or optionally a named vector of assets specifying initial weights}

\item{\dots}{any other passthru parameters}

\item{min}{numeric or named vector specifying minimum weight box constraints}

\item{max}{numeric or named vector specifying minimum weight box constraints}

\item{min_mult}{numeric or named vector specifying minimum multiplier box constraint from initial weight in \code{assets}}

\item{max_mult}{numeric or named vector specifying maximum multiplier box constraint from initial weight in \code{assets}}

\item{min_sum}{minimum sum of all asset weights, default .99}

\item{max_sum}{maximum sum of all asset weights, default 1.01}

\item{weight_seq}{seed sequence of weights, see \code{\link{generatesequence}}}

\item{type}{character type of the constraint to add or update}

\item{enabled}{TRUE/FALSE to enabled the constraint}

\item{constrclass}{name of class for the constraint}
}
\description{
See main documentation entry in \code{\link{add.constraint}}.
}
\details{
This includes the deprecated constructor for the \code{v1_constraint} object for backwards compatibility.
}
\seealso{
\code{\link{add.constraint}}
}
\author{
Peter Carl, Brian G. Peterson, Ross Bennett
}
