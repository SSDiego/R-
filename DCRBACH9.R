# Module 9 

# Programming basics

# ifelse

# Assign the state abbreviation when the state name is longer than 8 characters 
new_names <- ifelse(nchar(murders$state)>8, murders$abb, murders$state)

# function

# Create function called `sum_n`
sum_n <- function(n){
  x <- 1:n
  sum(x)
}
# Use the function to determine the sum of integers from 1 to 5000
sum_n(5000)


# Create `altman_plot` 
altman_plot <- function(x, y){
  plot(x + y, y - x)
}

# Run this code 
x <- 3
my_func <- function(y){
  x <- 5
  y+5
}

# Print value of x 

# For loops

# Here is a function that adds numbers from 1 to n
example_func <- function(n){
  x <- 1:n
  sum(x)
}

# Here is the sum of the first 100 numbers
example_func(100)

# Write the function with argument n, with the above mentioned specifications and store it in `compute_s_n` 
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Report the value of the sum when n=10
compute_s_n(10)

# Define a function and store it in `compute_s_n`
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Create a vector for storing results
s_n <- vector("numeric", 25)

# Assign values to `n` and `s_n`
for(i in 1:25){
  s_n[i] <- compute_s_n(i)
}


# Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

#  Create the plot 
plot(n, s_n)

# Define the function
compute_s_n <- function(n){
  x <- 1:n
  sum(x^2)
}

# Define the vector of n
n <- 1:25

# Define the vector to store data
s_n <- vector("numeric", 25)
for(i in n){
  s_n[i] <- compute_s_n(i)
}

# Check that s_n is identical to the formula given in the instructions.
identical(s_n, n*(n+1)*(2*n+1)/6)


