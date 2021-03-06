% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllConstructor.R
\name{GMRF_RW}
\alias{GMRF_RW}
\title{Random walk GMRF}
\usage{
GMRF_RW(n = 10, order = 1, precinc = 1, df = data.frame(),
  name = "none")
}
\arguments{
\item{n}{number of vertices}

\item{order}{1 or 2, depending on the order of the random walk}

\item{precinc}{precision constant (multiples the template precision matrix)}

\item{df}{data frame of length \code{n} with more details (for example axis, covariate information)}

\item{name}{name of GMRF}
}
\value{
Object of class GMRF with zero mean
}
\description{
This function initialises a random walk and represents it as a Gaussian Markov Random Field with mean \code{mu} and precision matrix \code{Q}. Only random walks along the real line, first-order and second-order variants are implemented for now. As with other GMRFs, the user can specify a name. Also a data frame can be specified with more details on the GMRF.
}
\examples{

require(Matrix)
# Createa a first-order random walk GMRF
my_RW <- GMRF_RW(n=10, order=1, precinc =2, name="my_first_RW")
print(getPrecision(my_RW))
print(getMean(my_RW))
print(getDf(my_RW))
}
\keyword{GMRF,}
\keyword{random}
\keyword{walk}
