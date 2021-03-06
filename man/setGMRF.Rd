% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGeneric.R, R/graph.R
\docType{methods}
\name{setGMRF}
\alias{setGMRF}
\alias{setGMRF,Graph_2nodes,GMRF-method}
\alias{setGMRF,Graph_2nodes-method}
\title{Set GMRF}
\usage{
setGMRF(Graph, obj)

\S4method{setGMRF}{Graph_2nodes,GMRF}(Graph, obj)
}
\arguments{
\item{Graph}{object of class \code{Graph_2nodes}.}

\item{obj}{object of class \code{GMRF}.}
}
\value{
Object of class \code{Graph_2nodes}.
}
\description{
This function takes an object of class \code{Graph_2nodes} and changes the GMRF (process) component accordingly. This can be used to
change the mean in of the process component, or the precision matrix when chaining Gaussian updates.
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

mu2 <- matrix(1,nrow(Mesh),1)
my_GMRF2 <- GMRF(mu = mu2, Q = Q,name="SURF",t_axis = 0:6)

G_reduced <- setGMRF(G_reduced, obj = my_GMRF2)

}
}
\keyword{Graph,}
\keyword{nodes}
\keyword{two}
