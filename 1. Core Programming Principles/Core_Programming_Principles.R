#TYPES OF VARIABLES

#integer 
x <- 2L
typeof(x)

#double
y <- 2.5
typeof(y)

#complex 
z <- 3 + 2i
typeof(z)

#character
a <- "h"
typeof(a)

#logical
q <- T
typeof(q)

#---------------
#USING VARIABLES
A <- 10
B <- 5

C <- A+B

var1 <- 2.5
var2 <- 4

result <- var1 / var2
result

answer <- sqrt(var2)
answer

greeting <- "Hello"
name <- "Bob"
message <- paste(greeting, name)
message


#-------------------------------
#LOGICAL VARIABLES AND OPERATORS

#Logical
#TRUE T
#FALSE F

4 < 5
10 > 100 
4 == 5

# ==
# !=
# <
# >
# <=
# >=
# !
# /
# &
# isTRUE(x)

result <- 4<5
result
typeof(result)

result2 <- !TRUE
result2

result | result2
result & result2

isTRUE(result)

#-----------------
#THE "WHILE" LOOP

counter <- 1
while(counter < 12){
  print(counter)
  counter <- counter+1
}

#------------------
#USING THE CONSOLE

#------------------
#THE "FOR" LOOP

for (i in 5:10){
  print("Hello R")
}

#------------------
#THE "IF" STATEMENT
#-- -2 -- -1 -- 0 -- 1 -- 2

x <- rnorm(1)

if(x>1){
  answer <- "Greater than 1"
} else if (x >= -1) {
  answer <- "Less than 1 and greater than -1"
} else {
  answer <- "Less than -1"
}