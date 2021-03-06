% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGeneric.R, R/basisfns.R
\docType{methods}
\name{stiffness_matrix}
\alias{stiffness_matrix}
\alias{stiffness_matrix,FEBasis-method}
\title{Get stiffness matrix}
\usage{
stiffness_matrix(B)

\S4method{stiffness_matrix}{FEBasis}(B)
}
\arguments{
\item{B}{an object of class \code{FEBasis}}
}
\description{
returns the stiffness matrix of a finite element basis
}
\examples{
data(surf_fe)
Mesh <- initFEbasis(p=surf_fe$p, t = surf_fe$t, M = surf_fe$M, K = surf_fe$K)
M <- stiffness_matrix(Mesh)
}
