# Load required libraries
library(geoR)
library(rjags)
library(coda)
library(loo)
# Load the dataset
data <- read.csv("/Users/aaron/Downloads/Obesity_data.csv")

# Check the column names to identify the relevant ones
colnames(data)

# Prepare data
data$Gender <- as.numeric(as.factor(data$Gender))
data$MTRANS <- as.numeric(as.factor(data$MTRANS))
data$family_history_with_overweight <- as.numeric(as.factor(data$family_history_with_overweight))
data$FAVC <- as.numeric(as.factor(data$FAVC))
data$FCVC <- as.numeric(as.factor(data$FCVC))
data$NCP <- as.numeric(as.factor(data$NCP))
data$CAEC <- as.numeric(as.factor(data$CAEC))
data$SMOKE <- as.numeric(as.factor(data$SMOKE))
data$CH2O <- as.numeric(as.factor(data$CH2O))
data$SCC <- as.numeric(as.factor(data$SCC))
data$FAF <- as.numeric(as.factor(data$FAF))
data$TUE <- as.numeric(as.factor(data$TUE))
data$CALC <- as.numeric(as.factor(data$CALC))

# Assuming 'NObeyesdad' is the binary target variable (1 = Yes, 0 = No)
Y <- ifelse(data$NObeyesdad %in% c("Overweight_Level_I", "Overweight_Level_II","Obesity_Type_I","Obesity_Type_II","Obesity_Type_III"), 1, 0) # Convert 'NObeyesdad' to a binary numeric variable
unique_values <- unique(data$Y)

# Define a smaller set of predictors (e.g., Age, Height, Weight, and Family History)
X <- cbind(data$Age, data$Height, data$Weight, data$family_history_with_overweight)

# Scale the features (standardize to mean 0, sd 1)
X <- scale(X)

# Define model with informative prior (using only 4 predictors)
mod2 <- textConnection("model{
  for (i in 1:n) {
    Y[i] ~ dbern(pi[i])  # Binary outcome with Bernoulli distribution
    logit(pi[i]) <- beta[1] + beta[2] * X[i,1] + beta[3] * X[i,2] + 
                     beta[4] * X[i,3] + beta[5] * X[i,4]  # Use only 4 predictors
  }

  # Informative priors for coefficients based on prior knowledge
  beta[1] ~ dnorm(-10, 0.01)   # Intercept: Assume a value close to -10 (based on prior knowledge)
  beta[2] ~ dnorm(0.5, 0.5)    # Age: Expect a positive association, mean around 0.5
  beta[3] ~ dnorm(0, 0.5)      # Height: Expect weak effect, centered at 0
  beta[4] ~ dnorm(2, 1)        # Weight: Expect a strong positive effect, mean around 2
  beta[5] ~ dnorm(1, 0.5)      # Family History: Expect a positive effect with a mean of 1
}")

# Prepare data for JAGS model
n <- length(Y)  # Define number of observations
data_test2 <- list(Y = Y, X = X, n = n)  # Pass the entire scaled matrix X to JAGS

# Define initial values for two chains (small random numbers)
inits <- list(list(beta = rep(0, 5)), list(beta = rep(0.1, 5)))  # Different initial values for each chain

# Fit the informative model
model2 <- jags.model(mod2, data = data_test2, n.chains = 2, inits = inits)
update(model2, 500, progress.bar = "none")  # Burn-in phase

# Sample from the posterior distribution
samps2 <- coda.samples(model2, variable.names = c("beta"), n.iter = 2000, thin = 2)

# Trace plot for convergence diagnostics
summary(samps2)
traceplot(samps2)

# Convergence diagnostics: Gelman-Rubin, Effective Size, Autocorrelation
gelman.diag(samps2)
effectiveSize(samps2)
autocorr.plot(samps2)

# Compute DIC for Informative Model
DIC_informative <- dic.samples(model2, n.iter = 2000, n.thin = 5)
DIC_informative



Y <- as.numeric(Y)  # Convert Y to numeric if needed
samps2 <- as.matrix(samps2)  # Ensure samps2 is a matrix

# Get dimensions
n <- length(Y)  # Number of observations
n_iter <- nrow(samps2)  # Number of posterior samples

# Initialize log-likelihood matrix
log_lik <- matrix(NA, nrow = n_iter, ncol = n)

# Compute log-likelihood for each posterior sample
for (i in 1:n_iter) {
  beta <- samps2[i, ]  # Extract beta values at iteration i
  eta <- beta[1] + beta[2] * X[, 1] + beta[3] * X[, 2] + 
    beta[4] * X[, 3] + beta[5] * X[, 4]
  p <- plogis(eta)  # Convert to probabilities
  
  # Compute log-likelihood for each observation
  log_lik[i, ] <- dbinom(Y, size = 1, prob = p, log = TRUE)
}

# Compute WAIC
waic_result <- waic(log_lik)

# Print the WAIC results
print(waic_result)

# Convert posterior samples into a matrix
D <- as.matrix(samps2)

# Compute the test statistic for the observed data (mean of Y)
D0 <- mean(Y)  # Observed mean
Dname <- "Mean of Y"  # Statistic name

# Initialize an empty vector for p-value
pval <- 0

# Simulate test statistics from the posterior
D_model <- sapply(1:nrow(D), function(i) {
  beta <- D[i, ]  # Extract posterior sample for iteration i
  eta <- beta[1] + beta[2] * X[, 1] + beta[3] * X[, 2] + 
    beta[4] * X[, 3] + beta[5] * X[, 4]
  Y_sim <- rbinom(length(Y), size = 1, prob = plogis(eta))
  mean(Y_sim)  # Mean of simulated Y
})

# Plot the posterior distribution of the test statistic
plot(density(D_model), xlim = range(c(D0, D_model)), 
     xlab = "D", ylab = "Posterior Probability", main = Dname)

# Add the observed test statistic (red line)
abline(v = D0, col = 2)

# Add legend
legend("topleft", c("Model", "Data"), lty = 1, col = 1:2, bty = "n")

# Compute the p-value
pval <- mean(D_model > D0)

# Print the p-value
print(paste("P-value for", Dname, ":", pval))

D0 <- median(Y)  # Mengganti mean(Y) dengan median(Y)
Dname <- "Median of Y"  # Mengubah nama statistik

# Simulate test statistics from the posterior
D_model <- sapply(1:nrow(D), function(i) {
  beta <- D[i, ]  # Extract posterior sample for iteration i
  eta <- beta[1] + beta[2] * X[, 1] + beta[3] * X[, 2] + 
    beta[4] * X[, 3] + beta[5] * X[, 4]
  Y_sim <- rbinom(length(Y), size = 1, prob = plogis(eta))
  median(Y_sim)  # Median dari Y_sim yang disimulasikan
})

# Plot the posterior distribution of the test statistic
plot(density(D_model), xlim = range(c(D0, D_model)), 
     xlab = "D", ylab = "Posterior Probability", main = Dname)

# Add the observed test statistic (red line)
abline(v = D0, col = 2)

# Add legend
legend("topleft", c("Model", "Data"), lty = 1, col = 1:2, bty = "n")

# Compute the p-value
pval <- mean(D_model > D0)

# Print the p-value
print(paste("P-value for", Dname, ":", pval))