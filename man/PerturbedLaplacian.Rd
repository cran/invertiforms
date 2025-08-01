% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PerturbedLaplacian.R
\name{PerturbedLaplacian}
\alias{PerturbedLaplacian}
\alias{transform,PerturbedLaplacian,sparseMatrix-method}
\alias{inverse_transform,PerturbedLaplacian,sparseLRMatrix-method}
\title{Construct and use the Perturbed Laplacian}
\usage{
PerturbedLaplacian(A, tau = NULL)

\S4method{transform}{PerturbedLaplacian,sparseMatrix}(iform, A)

\S4method{inverse_transform}{PerturbedLaplacian,sparseLRMatrix}(iform, A)
}
\arguments{
\item{A}{A matrix to transform.}

\item{tau}{Additive regularizer for row and column sums of \code{abs(A)}.
Typically this corresponds to inflating the (absolute) out-degree
and the (absolute) in-degree of each node by \code{tau}. Defaults to
\code{NULL}, in which case we set \code{tau} to the mean value of \code{abs(A)}.}

\item{iform}{An \linkS4class{Invertiform} object describing the transformation.}
}
\value{
\itemize{
\item \code{PerturbedLaplacian()} creates a \linkS4class{PerturbedLaplacian} object.
\item \code{transform()} returns the transformed matrix,
typically as a \link[Matrix:Matrix-class]{Matrix::Matrix}.
\item \code{inverse_transform()} returns the inverse transformed matrix,
typically as a \link[Matrix:Matrix-class]{Matrix::Matrix}.
}
}
\description{
Construct and use the Perturbed Laplacian
}
\details{
We define the \emph{perturbed Laplacian} \eqn{L^\tau(A)}{L_tau(A)} of an
\eqn{n \times n}{n by n} graph adjacency matrix \eqn{A} as

\deqn{
  L^\tau(A)_{ij} = \frac{A_{ij} + \frac{\tau}{n}}{\sqrt{d^{out}_i + \tau}
  \sqrt{d^{in}_j + \tau}}
}{
  L[ij] = (A[ij] + \tau / n) / (sqrt(d^out[i] + \tau)  sqrt(d^in[j] + \tau))
}

where

\deqn{
  d^{out}_i = \sum_{j=1}^n \|A_{ij} \|
}{
  d^out[i] = sum_j abs(A[ij])
}

and

\deqn{
  d^{in}_j = \sum_{i=1}^n \|A_{ij} \|.
}{
  d^in[j] = sum_i abs(A[ij]).
}

When \eqn{A_{ij}}{A[ij]} denotes the present of an edge \emph{from} node \eqn{i}
\emph{to} node \eqn{j}, which is fairly standard notation,
\eqn{d^{out}_i}{d^out[i]} denotes the (absolute) out-degree of node
\eqn{i} and \eqn{d^{in}_j}{d^in[j]} denotes the (absolute) in-degree
of node \eqn{j}.

Note that this documentation renders more clearly at
\url{https://rohelab.github.io/invertiforms/}.
}
\examples{

library(igraph)
library(igraphdata)

data("karate", package = "igraphdata")

A <- get.adjacency(karate)

iform <- PerturbedLaplacian(A)

L <- transform(iform, A)
L

\dontrun{
A_recovered <- inverse_transform(iform, L)
all.equal(A, A_recovered)
}

}
