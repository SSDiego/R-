# Calculate the quintiles of co2_emission
quantile(food_consumption$co2_emission, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1))

# Calculate the deciles of co2_emission
quantile(food_consumption$co2_emission, probs = seq(0, 1, 0.1))

# Calculate variance and sd of co2_emission for each food_category
food_consumption %>% 
  group_by(food_category) %>% 
  summarize(var_co2 = var(co2_emission),
           sd_co2 = sd(co2_emission))

# Create subgraphs for each food_category: histogram of co2_emission
ggplot(food_consumption, aes(co2_emission)) +
  # Create a histogram
  geom_histogram() +
  # Create a separate sub-graph for each food_category
  facet_wrap(~ food_category)


# Calculate total co2_emission per country: emissions_by_country
emissions_by_country <- food_consumption %>%
  group_by(country) %>%
  summarize(total_emission = sum(co2_emission))

# Compute the first and third quantiles and IQR of total_emission
q1 <- quantile(emissions_by_country$total_emission, 0.25)
q3 <- quantile(emissions_by_country$total_emission, 0.75)
iqr <- q3 - q1

# Calculate the lower and upper cutoffs for outliers
lower <- q1 - 1.5 * iqr
upper <- q3 + 1.5 * iqr

# Filter emissions_by_country to find outliers
emissions_by_country %>%
  filter(total_emission < lower | total_emission > upper)

# Calculate probability of picking a deal with each product
amir_deals %>%
  count(product) %>%
  mutate(prob = n/sum(n))

# Set random seed to 31
set.seed(31)

# Sample 5 deals without replacement
amir_deals %>%
  sample_n(5)

# Set random seed to 31
set.seed(31)

# Sample 5 deals with replacement
amir_deals %>%
  sample_n(5, replace = TRUE)

# Create probability distribution
size_distribution <- restaurant_groups %>%
  # Count number of each group size
  count(group_size) %>%
  # Calculate probability
  mutate(probability = n / sum(n))

size_distribution

# Create probability distribution
size_distribution <- restaurant_groups %>%
  count(group_size) %>%
  mutate(probability = n / sum(n))

# Calculate probability of picking group of 4 or more
size_distribution %>%
  # Filter for groups of 4 or larger
  filter(group_size >= 4) %>%
  # Calculate prob_4_or_more by taking sum of probabilities
  summarize(prob_4_or_more = sum(probability))


#The sales software used at your company is set to automatically 
#back itself up, but no one knows exactly what time the back-ups 
#happen. It is known, however, that back-ups happen exactly every 
#30 minutes. Amir comes back from sales meetings at random times 
#to update the data on the client he just met with. He wants to 
#know how long he'll have to wait for his newly-entered data to 
#get backed up. Use your new knowledge of continuous uniform 
#distributions to model this situation and answer Amir's questions.  

# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting less than 5 mins
prob_less_than_5 <- punif(5, min, max)
prob_less_than_5

# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting more than 5 mins
prob_greater_than_5 <- punif(5, min, max, lower.tail = FALSE)
prob_greater_than_5

# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting 10-20 mins
prob_between_10_and_20 <- punif(20, min, max) - punif(10, min, max)
prob_between_10_and_20


# Set random seed to 334
set.seed(334)

# Generate 1000 wait times between 0 and 30 mins, save in time column
wait_times %>%
  mutate(time = runif(1000, min = 0, max = 30)) %>%
  # Create a histogram of simulated times
  ggplot(aes(time)) +
  geom_histogram(bins = 30)





#Assume that Amir usually works on 3 deals per week, and overall, 
#he wins 30% of deals he works on. Each deal has a binary outcome: 
#it's either lost, or won, so you can model his sales deals with 
#a binomial distribution. In this exercise, you'll help Amir 
#simulate a year's worth of his deals so he can better understand 
#his performance.


# Set random seed to 10
set.seed(10)

# Simulate a single deal
rbinom(1, 1, 0.3)

# Set random seed to 10
set.seed(10)

# Simulate 1 week of 3 deals
rbinom(1, 3, 0.3)

# Set random seed to 10
set.seed(10)

# Simulate 52 weeks of 3 deals
deals <- rbinom(52, 3, 0.3)

# Calculate mean deals won per week
mean(deals)# Set random seed to 10
set.seed(10)

# Simulate 52 weeks of 3 deals
deals <- rbinom(52, 3, 0.3)

# Calculate mean deals won per week
mean(deals)

# Just as in the last exercise, assume that Amir wins 30% of deals. 
# He wants to get an idea of how likely he is to close a certain number 
# of deals each week. In this exercise, you'll calculate what the chances 
# are of him closing different numbers of deals using the binomial distribution.

# Probability of closing 3 out of 3 deals
dbinom(3, 3, 0.3)

# Probability of closing <= 1 deal out of 3 deals
pbinom(1, 3, 0.3)

# Probability of closing > 1 deal out of 3 deals
pbinom(1, 3, 0.3, lower.tail = FALSE)

#Now Amir wants to know how many deals he can expect to close each week 
#if his win rate changes. Luckily, you can use your binomial distribution 
#knowledge to help him calculate the expected value in different situations. 
#Recall from the video that the expected value of a binomial distribution 
#can be calculated by nxp .

# Expected number won with 30% win rate
won_30pct <- 3 * 0.3
won_30pct

# Expected number won with 25% win rate
won_25pct <- 3 * 0.25
won_25pct

# Expected number won with 35% win rate
won_35pct <- 3 * 0.35
won_35pct

#Since each deal Amir worked on (both won and lost) was different, 
#each was worth a different amount of money. These values are stored 
#in the amount column of amir_deals As part of Amir's performance review, 
#you want to be able to estimate the probability of him selling different
#amounts, but before you can do this, you'll need to determine what kind
#of distribution the amount variable follows.

# Histogram of amount with 10 bins
ggplot(amir_deals, aes(amount)) +
  geom_histogram(bins = 10)

#Since each deal Amir worked on (both won and lost) was different, each was 
#worth a different amount of money. These values are stored in the amount 
#column of amir_deals and follow a normal distribution with a mean of 5000 
#dollars and a standard deviation of 2000 dollars. As part of his performance 
#metrics, you want to calculate the probability of Amir closing a deal worth 
#various amounts.  

# Probability of deal < 7500
pnorm(7500, mean = 5000, sd = 2000)

# Probability of deal > 1000
pnorm(1000, mean = 5000, sd = 2000, lower.tail = FALSE)

# Probability of deal between 3000 and 7000
pnorm(7000, mean = 5000, sd = 2000) - pnorm(3000, mean = 5000, sd = 2000)

# Calculate amount that 75% of deals will be more than
qnorm(0.75, mean = 5000, sd = 2000, lower.tail = FALSE)


#Simulating sales under new market conditions
#The company's financial analyst is predicting that next quarter, 
#the worth of each sale will increase by 20% and the volatility, 
#or standard deviation, of each sale's worth will increase by 30%. 
#To see what Amir's sales might look like next quarter under these 
#new market conditions, you'll simulate new sales amounts using the 
#normal distribution and store these in the new_sales data frame, 
#which has already been created for you.

#Currently, Amir's average sale amount is $5000. Calculate what 
#his new average amount will be if it increases by 20% and store 
#this in new_mean.

#Amir's current standard deviation is $2000. Calculate what his new 
#standard deviation will be if it increases by 30% and store this in new_sd.

#Add a new column called amount to the data frame new_sales, which contains 
#36 simulated amounts from a normal distribution with a mean of new_mean 
#and a standard deviation of new_sd.

#Plot the distribution of the new_sales amounts using a histogram with 10 bins.

# Calculate new average amount
new_mean <- 5000 * 1.2

# Calculate new standard deviation
new_sd <- 2000 * 1.3

# Simulate 36 sales
new_sales <- new_sales %>% 
  mutate(amount = rnorm(36, mean = new_mean, sd = new_sd))

# Create histogram with 10 bins
ggplot(new_sales, aes(amount)) +
  geom_histogram(bins = 10)

#Which market is better?
#The key metric that the company uses to evaluate salespeople is the percent 
#of sales they make over $1000 since the time put into each sale is usually 
#worth a bit more than that, so the higher this metric, the better the 
#salesperson is performing.

#Recall that Amir's current sales amounts have a mean of $5000 and a standard 
#deviation of $2000, and Amir's predicted amounts in next quarter's market 
#have a mean of $6000 and a standard deviation of $2600.

#Based only on the metric of percent of sales over $1000, does Amir perform 
#better in the current market or the predicted market?  



# --- CLT --- #

# Create a histogram of num_users
ggplot(amir_deals, aes(num_users)) +
  geom_histogram(bins = 10)

# Set seed to 104
set.seed(104)

# Sample 20 num_users with replacement from amir_deals
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  # Take mean
  mean()

# Set seed to 104
set.seed(104)

# Sample 20 num_users from amir_deals and take mean
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  mean()

# Repeat the above 100 times
sample_means <- replicate(100, sample(amir_deals$num_users, size = 20, replace = TRUE) %>% mean())

# Create data frame for plotting
samples <- data.frame(mean = sample_means)

# Histogram of sample means
ggplot(samples, aes(mean)) +
  geom_histogram(bins = 10)


# Set seed to 321
set.seed(321)

# Take 30 samples of 20 values of num_users, take mean of each sample
sample_means <- replicate(30, sample(all_deals$num_users, 20) %>% mean())

# Calculate mean of sample_means
mean(sample_means)

# Calculate mean of num_users in amir_deals
mean(amir_deals$num_users)

#Poisson

#Your company uses sales software to keep track of new sales leads. It organizes 
#them into a queue so that anyone can follow up on one when they have a bit of 
#free time. Since the number of lead responses is a countable outcome over a 
#period of time, this scenario corresponds to a Poisson distribution. On average, 
#Amir responds to 4 leads each day. In this exercise, you'll calculate probabilities 
#of Amir responding to different numbers of leads.

# Probability of 5 responses
dpois(5, lambda = 4)

# Probability of 5 responses from coworker
dpois(5, lambda = 5.5)

# Probability of 2 or fewer responses
ppois(2, lambda = 4)

# Probability of > 10 responses
ppois(10, lambda = 4, lower.tail = FALSE)


#To further evaluate Amir's performance, you want to know how much time 
#it takes him to respond to a lead after he opens it. On average, it takes 
#2.5 hours for him to respond. In this exercise, you'll calculate probabilities 
#of different amounts of time passing between Amir receiving a lead and sending a response.

# Probability response takes < 1 hour
pexp(1, rate = 1/2.5)

# Probability response takes > 4 hours
pexp(4, rate = 1/2.5, lower.tail = FALSE)

# Probability response takes 3-4 hours
pexp(4, rate = 1/2.5) - pexp(3, rate = 1/2.5)

#Correlation

# Create a scatterplot of happiness_score vs. life_exp
ggplot(world_happiness, aes(life_exp, happiness_score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Correlation between life_exp and happiness_score
cor(world_happiness$life_exp, world_happiness$happiness_score)  

# Scatterplot of gdp_per_cap and life_exp
ggplot(world_happiness, aes(gdp_per_cap, life_exp)) +
  geom_point()

# Correlation between gdp_per_cap and life_exp
cor(world_happiness$gdp_per_cap, world_happiness$life_exp)

# Scatterplot of happiness_score vs. gdp_per_cap
ggplot(world_happiness, aes(gdp_per_cap, happiness_score)) +
  geom_point()

# Calculate correlation
cor(world_happiness$gdp_per_cap, world_happiness$happiness_score)

# Create log_gdp_per_cap column
world_happiness <- world_happiness %>%
  mutate(log_gdp_per_cap = log(gdp_per_cap))

# Scatterplot of log_gdp_per_cap vs. happiness_score
ggplot(world_happiness, aes(log_gdp_per_cap, happiness_score)) +
  geom_point()

# Calculate correlation
cor(world_happiness$log_gdp_per_cap, world_happiness$happiness_score)

# Scatterplot of grams_sugar_per_day and happiness_score
ggplot(world_happiness, aes(grams_sugar_per_day, happiness_score)) +
  geom_point()

# Correlation between grams_sugar_per_day and happiness_score
cor(world_happiness$grams_sugar_per_day, world_happiness$happiness_score)

