#LAW OF LARGE NUMBERS
M <- 10
N <- 0
E <- rep(0, M)
for (j in 1:M){
  N <- N + 1000
  for (i in rnorm(N)){
    if ( abs(i) <= 1){
      E[j] <- E[j] + 1
    }
  }
  E[j] <- E[j]/N*100
}

E