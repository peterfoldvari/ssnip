\name{ssnip: hyptohetical monopoly test}
\alias{ssnip}
\title{Hypothetical monopoly test}
\author{Peter Foldvari, Unversity of Amsterdam. email: p.foldvari@uva.nl}

\usage{
  ssnip(P,Q,M,elast,z,R)
  sel_ssnip(P,Q,M,elast,z)
}

\description{
  SSNIP stands for the Small but \emph{Significant, Non-transitory Increase in Price}
  method to find a set of goods that constitute a market. It is often used to
  asses the impact of mergers and acquisitions.

  \emph{ssnip} tests for a predefined subset of k goods,
  \emph{sel_ssnip} tests for al possible combination of all k goods.

  \emph{sel_ssnip} returns a matrix, with rows sorted in an increasing order of the \emph{critalpha} value.
  \emph{critalpha} is an estmate of the maximum price increase that a hypothetical
  monopolist could introduce and still have a profit increase. That is, \emph{critalpha} indirectly measures the
  possible market power of the monopoly.
  It is advisable to choose the smallest subset of goods, where \emph{critalpha}
  exceeds the predefined limit set by the researcher.

  This code is based on a 2002 online manuscript and a 2003 published paper
  by Ian M. Dobbs (Professor (Emeritus) of Business Economics and Finance, Newcastle University Business School)}

\arguments{
\item{P:}{kx1 column vector of unit price}
\item{Q:}{kx1 column vector of  quantity sold}
\item{M:}{kx1 column vector of the percentage markup of price above marginal cost(C)
 \deqn{ M=\frac{P-C}{P}}}
\item{elast:}{kxk matrix of price elasticites}
\item{z:}{scalar, the assumed increase in price (eg: 0.05 stand for 5\%)}
\item{R:}{kx1 vector of restrictions selecting a subset of goods}
}

\value{
\item{\emph{D_0}:}{Change of profit after an infinitesimaly small price increase.}
\item{\emph{D_profit_z}:}{Change of profit after z*100\% increase in prices}
\item{\emph{critalpha}:}{The maximum rate of change of prices that results in an increase in profit (eg: 1.05 stand for 105\%)}
}

\examples{
 ##Define the input vectors and matrix
 P <- c(1.5,1,1.2)
 Q <- c(18,20,5)
 M <- c(0.2, 0.4, 0.6)
 elast <- cbind(c(-3,1,1.1),c(1.1,-4,2.1),c(0.9,0.9,-1.5))
 z <- 0.05

 ##Testing for the 1st and 2nd goods:
 R <- c(1,1,0)
 ssnip(P, Q,M,elast,z,R)

 ##Testing for alll possible combinations:
 sel_ssnip(P, Q,M,elast,z)

}

\references{

Dobbs, Ian M. (2002) \emph{The assessment of market power and market boundaries using the hypothetical monopoly test}, manuscript: (http://www.staff.ncl.ac.uk/i.m.dobbs/Files/market\%20definition\%20ijbe\%20n.pdf)

Dobbs, Ian. M. (2003) \emph{Demand, Cost Elasticities and Pricing Benchmarks in the Hypothetical Monopoly Test: The Consequences of a Simple SSNIP.} Applied Economics Letters 10.9: 545–548.
}
