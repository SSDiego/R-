# Module 5: Vectors Arithmetics

# Vectorized Operations

# Assign city names to `city` 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# Store temperature values in `temp`
temp <- c(35, 88, 42, 84, 81, 30)

# Convert temperature into Celsius and overwrite the original values of 'temp' with these Celsius values
temp <- (temp - 32)*5/9
# Create a data frame `city_temps` 
city_temps <- data.frame (name = city, temp = temp)

# Define an object `x` with the numbers 1 through 100
x <- seq(1,100)
# Compute the sum 
sum(1/x^2)


# Load the data
library(dslabs)
data(murders)

# Store the per 100,000 murder rate for each state in murder_rate
murder_rate <- murders$total/murders$population*100000
# Calculate the average murder rate in the US 
mean(murder_rate)


