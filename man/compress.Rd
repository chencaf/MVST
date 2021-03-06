% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGeneric.R, R/graph.R
\docType{methods}
\name{compress}
\alias{compress}
\alias{compress,Graph-method}
\title{Compress graph}
\usage{
compress(Graph)

\S4method{compress}{Graph}(Graph)
}
\arguments{
\item{Graph}{object of class \code{Graph}.}
}
\value{
Object of class \code{Graph_2nodes}.
}
\description{
This function takes am object of class \code{Graph} and compresses it into a one-layer network of class \code{Graph_2nodes}. 
The latter object can be then passed to \code{Infer} for a standard Gaussian update.
}
\examples{
\dontrun{
require(Matrix)
data(icesat)
data(surf_fe)

## First create observation object
icesat_obs <- Obs(df=icesat,
                 abs_lim = 5,
                 avr_method = "median",
                 box_size=100,
                 name="icesat")

## Now create GMRF defined over some FE basis
Mesh <- initFEbasis(p=surf_fe$p,
                    t=surf_fe$t,
                    M=surf_fe$M,
                    K=surf_fe$K)

mu <- matrix(0,nrow(Mesh),1)
Q <- sparseMatrix(i=1:nrow(surf_fe$p), j = 1:nrow(surf_fe$p), x = 1)

my_GMRF <- GMRF(mu = mu, Q = Q,name="SURF",t_axis = 0:6)
SURF <-GMRF_basis(G = my_GMRF, Basis = Mesh)

L1 <- link(SURF,icesat_obs)
e <- link_list(list(L1))
v <- block_list(list(O = icesat_obs, G = SURF))
G <- new("Graph",e=e,v=v)
G_reduced <- compress(G)
}
}
\keyword{Graph,}
\keyword{compress}
