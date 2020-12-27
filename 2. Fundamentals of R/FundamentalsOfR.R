# CREATE SOME VECTORS

MyFirstVector <- c(3,45,56,732)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector) #stores as double automically
is.double(MyFirstVector)

V2 <- c(3L, 12L, 243L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

v3 <- c("a","B23","Hello", 7)
V3
is.character(V3)
is.numeric(V3)

seq() #sequence - like ':'
rep() #replicate

seq(1,15)
1:15

seq(1,15,2)
z <- seq(1,15,4)
z

rep(3, 50)
d <- rep(3, 50)
rep("a",5)

x <- c(80, 20)
y <- rep(x, 10)
y

# -------------------------------------
# USING THE [] BRACKETS

x <- c(1,123,534,13,4) #combine
y <- seq(201, 250, 11) #sequence
z <- rep("Hi!", 3) #replicate

w <- c("a","b","c","d","e")
w

w[1]
w[2]
w[3]
w[-1]
v <- w[-3]

w[1:3]
w[3:5]
w[c(1,3,5)]
w[c(-2,-4)]
w[-3:-5]
w[1:2]

# ----------------
# THE POWER OF VECTORIZED OPERATIONS

x <- rnorm(5)
x
#R-specific programming loop
for (i in x){
  print(i)
}

print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

#conventional programming loop
for(j in 1:5){
  print(x[j])
}

# -------------

N <- 1000000
a <- rnorm(N)
b <- rnorm(N)

#Vectorized approach
c <- a * b

#De-vectorized approach
d <- rep(NA, N)
for (i in 1:N){
  d[i] <- a[i] * b[i]
}
#time is saved on delegations time

# ------------------
# FUNCTIONS IN R

#? 
?rnorm()
?seq()
x <- c("a","b","c")
seq(from=10, to=20, length.out = 100)
seq(from=10, to=20, along.with=x)
rep(5:6, each=10)

# ------------------
# PACKAGES IN R


