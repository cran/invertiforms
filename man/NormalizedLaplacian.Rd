% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NormalizedLaplacian.R
\name{NormalizedLaplacian}
\alias{NormalizedLaplacian}
\alias{transform,NormalizedLaplacian,sparseMatrix-method}
\alias{inverse_transform,NormalizedLaplacian,sparseMatrix-method}
\title{Construct and use the Normalized Laplacian}
\usage{
NormalizedLaplacian(A)

\S4method{transform}{NormalizedLaplacian,sparseMatrix}(iform, A)

\S4method{inverse_transform}{NormalizedLaplacian,sparseMatrix}(iform, A)
}
\arguments{
\item{A}{A matrix to transform.}

\item{iform}{An \linkS4class{Invertiform} object describing the transformation.}
}
\value{
\itemize{
\item \code{NormalizedLaplacian()} creates a \linkS4class{NormalizedLaplacian} object.
\item \code{transform()} returns the transformed matrix,
typically as a \link[Matrix:Matrix-class]{Matrix::Matrix}.
\item \code{inverse_transform()} returns the inverse transformed matrix,
typically as a \link[Matrix:Matrix-class]{Matrix::Matrix}.
}
}
\description{
A convenience function to create \linkS4class{NormalizedLaplacian} S4 objects,
which are useful for finding the normalized Laplacian of the
adjacency matrix of a graph.
}
\details{
We define the \emph{normalized Laplacian} \eqn{L(A)} of an
\eqn{n \times n}{n by n} graph adjacency matrix \eqn{A} as

\deqn{
  L(A)_{ij} = \frac{A_{ij}}{\sqrt{d^{out}_i} \sqrt{d^{in}_j}}
}{
  L[ij] = A[ij] / sqrt(d^out[i] d^in[j])
}

where

\deqn{
  d^{out}_i = \sum_{j=1}^n \| A_{ij} \|
}{
  d^out[i] = sum_j abs(A[ij])
}

and

\deqn{
  d^{in}_j = \sum_{i=1}^n \| A_{ij} \|.
}{
  d^in[j] = sum_i abs(A[ij]).
}

When \eqn{A_{ij}}{A[ij]} denotes the present of an edge \emph{from} node \eqn{i}
\emph{to} node \eqn{j}, which is fairly standard notation,
\eqn{d^{out}_i}{d^out[i]} denotes the (absolute) out-degree of node
\eqn{i} and \eqn{d^{in}_j}{d^in[j]} denotes the (absolute) in-degree
of node \eqn{j}.

Note that this documentation renders most clearly at
\url{https://rohelab.github.io/invertiforms/}.
}
\examples{

library(igraph)
library(igraphdata)

data("karate", package = "igraphdata")

A <- get.adjacency(karate)

iform <- NormalizedLaplacian(A)

L <- transform(iform, A)
A_recovered <- inverse_transform(iform, L)

all.equal(A, A_recovered)

}
