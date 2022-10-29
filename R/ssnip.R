
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

sel_ssnip <- function(P,Q,M,elast,z) {

  k <- length(P)
  l <- expand.grid(rep(list(0:1), k));
  R <- matrix(, nrow = 2^length(l)-1, ncol = k)
  res <-matrix(, nrow = 2^length(l)-1, ncol = 3)
  for (i in 2:(2^length(l))){
    R[i-1,]=t(l[i,])
    SNIP<-ssnip(P,Q,M,elast,z,R[i-1,])
    res[i-1,]=t(c(SNIP$D_0,SNIP$D_profit_z,SNIP$critalpha))}

  colnames(res)=c("D_0","D_Profit_z","critalpha")
  output <- cbind(R,res)
  return(output[order(output[,k+3],decreasing=FALSE),])

}

ssnip <- function(P,Q,M,elast,z,R) {
  S=diag(R)
  k = length(R)
  p = (R)*P
  q = (R)*Q
  m = (R)*M
  E= t(S)%*%elast%*%(S)
  D_0 = (p*q)%*%(1+E%*%m)
  Phi =  t(p)%*%E%*%q
  Dprofit_z = D_0*z + Phi*z^2

  alpha = D_0/-Phi
  my_list = list("D_0"=D_0,"D_profit_z"=Dprofit_z,"critalpha"=alpha)
  return(my_list)

}

