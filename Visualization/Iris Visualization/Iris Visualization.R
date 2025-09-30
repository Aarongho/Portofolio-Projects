# 1. put the library that we gonna use
library(dplyr)
library(ggplot2)
library(datasets) 

# 2. accessing and loading the iris datasets 
?iris # the information of iris datasets
data("iris") # access the iris data

# 3. checking the format, dim , structure and summary of the data 
head(iris)
str(iris)
summary(iris)
# we can take the head cause it can represent all the data so dont need to look one by one (sampling)

# 4. quick overview before manipulating the data
View(iris)

# 5. Data Manipulation
flowers <- iris$Petal.Length
flowers
normalized <- scale(flowers, center=F, scale = TRUE)
normalized
summary(normalized)
shapiro.test(normalized)

# a. check duplicates of the data and erase if there any
duplicated(flowers)
dups = which(duplicated(flowers))
dups
flowers = flowers[c(-dups),]
flowers

dups = which(duplicated(flowers))
dups

# b. check na / missing value from our dataset
na_count <- sum(is.na(flowers))
na_count

# c. choose any relevant columns and rename them as needed
flowers_subset <- flowers[, c("Sepal.Length","Sepal.Width", "Petal.Length", "Petal.Width","Species")]
names(flowers_subset)[names(flowers_subset) == "Sepal.Length"] <- "Sepal(L)"
names(flowers_subset)[names(flowers_subset) == "Sepal.Width"] <- "Sepal(W)"
names(flowers_subset)[names(flowers_subset) == "Petal.Length"] <- "Petal(L)"
names(flowers_subset)[names(flowers_subset) == "Petal.Width"] <- "Petal(W)"
View(flowers_subset)
# d. search and delete the outliers for each segment of the choosen column
# detect outliers using boxplot
# Sepal Length
boxplot(flowers_subset$`Sepal(L)`)
outlier_sepal_length = boxplot.stats(flowers_subset$`Sepal(L)`)$out
outlier_sepal_length
# Sepal Width
boxplot(flowers_subset$`Sepal(W)`)
outlier_sepal_width = boxplot.stats(flowers_subset$`Sepal(W)`)$out
outlier_sepal_width
# petal length
boxplot(flowers_subset$`Petal(L)`)
outlier_petal_length = boxplot.stats(flowers_subset$`Petal(L)`)$out
outlier_petal_length
# petal Width
boxplot(flowers_subset$`Petal(W)`)
outlier_petal_width = boxplot.stats(flowers_subset$`Petal(W)`)$out
outlier_petal_width
# erasing the outliers
Q1_sepal_width <- quantile(flowers_subset$`Sepal(W)`, 0.25)
Q1_sepal_width
Q3_sepal_width <- quantile(flowers_subset$`Sepal(W)`, 0.75)
Q3_sepal_width
IQR_sepalwidth = IQR(flowers_subset$`Sepal(W)`)
IQR_sepalwidth
final_flowers <- subset(flowers_subset,flowers_subset$`Sepal(W)`> (Q1_sepal_width - 1.5 * IQR_sepalwidth) & 
                          flowers_subset$`Sepal(W)` < (Q3_sepal_width + 1.5 * IQR_sepalwidth))
final_flowers

# 6. Data Exploration
# a. Descriptive Statics
summary(final_flowers)

# b. Histograms
hist(final_flowers$`Sepal(L)`, col = "darkgreen",main = "Sepal L Histogram", xlab = "Sepal Length", ylab = "Frequency")
hist(final_flowers$`Sepal(W)`, col = "lightgreen",main = "Sepal W Histogram", xlab = "Sepal Width", ylab = "Frequency")
hist(final_flowers$`Petal(L)`, col = "green",main = "Petal L Histogram", xlab = "Petal Length", ylab = "Frequency")
hist(final_flowers$`Petal(W)`, col = "navy",main = "Petal W Histogram", xlab = "Petal Width", ylab = "Frequency")
# lets try to normalize the graph into two diffrent graph for petal L and Petal W
hist(final_flowers$`Petal(L)`[final_flowers$Species=="setosa"], col = "green",main = "Petal Length Setosa Species Histogram", xlab = "Petal Length Setosa", ylab = "Frequency")
hist(final_flowers$`Petal(L)`[final_flowers$Species!="setosa"], col = "green",main = "Petal Length Virginica & Versicolor Species Histogram", xlab = "Petal Length Viriginica & Versicolor", ylab = "Frequency")
hist(final_flowers$`Petal(W)`[final_flowers$Species=="setosa"], col = "green",main = "Petal Width Setosa Species Histogram", xlab = "Petal Width Setosa", ylab = "Frequency")
hist(final_flowers$`Petal(W)`[final_flowers$Species!="setosa"], col = "green",main = "Petal Width Virginica & Versicolor Species Histogram", xlab = "Petal Width Viriginica & Versicolor", ylab = "Frequency")

# c. scatterplot
Petal_Length <- final_flowers$`Petal(L)`
Petal_Width <- final_flowers$`Petal(W)`
Sepal_Length <- final_flowers$`Sepal(L)`
Sepal_Width <- final_flowers$`Sepal(W)`

# Scatterplot between multi variable (Petal-Length,Petal-Width,Sepal-Length,Sepal-Width)
pairs(~final_flowers$`Petal(L)` + final_flowers$`Sepal(L)` + final_flowers$`Sepal(W)` + final_flowers$`Petal(W)`, data = final_flowers)


# lets try to split it up for the setosa 
pairs(~ Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data = final_flowers, subset = Species == "setosa")
# lets try to split it up for versicolor & virginica
pairs(~ Petal_Length + Petal_Width + Sepal_Length + Sepal_Width, data = final_flowers, subset = Species == "virginica" | Species =="versicolor")

# 7. Data Correlation
# checking if its linear or not
Petal_Length_virginica <- (final_flowers$`Petal(L)`)[final_flowers$Species== "virginica"]
Petal_Width_virginica <- (final_flowers$`Petal(W)`)[final_flowers$Species== "virginica"]

pairs(~ Petal_Length + Petal_Width, data = final_flowers, subset = Species == "virginica")

Petal_length_normal <- normalized


# checking if its normal distributed
shapiro.test(Petal_Width_virginica)
shapiro.test(Petal_Length_virginica)

# Finding the Pear Correlation between two variable
cor(Petal_Length_virginica,Petal_Width_virginica, method = "pearson")



# 8. Linear Regression
# the model
regression <- lm(Sepal_Length ~ Petal_Length + Petal_Width, data = final_flowers)
summary(regression)
Petal_Length <- final_flowers$`Petal(L)`
Petal_Width <- final_flowers$`Petal(W)`
Sepal_Length <- final_flowers$`Sepal(L)`
Sepal_Width <- final_flowers$`Sepal(W)`
ggplot(final_flowers, aes(x = Petal_Length + Petal_Width, y = Sepal_Length)) + geom_point() + 
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "Linear Regression: Petal Length + Petal Width vs. Sepal Length",
       x = "Petal Length + Petal Width", y = "Sepal Length")

Petal_Length <- final_flowers$`Petal(L)`
ggplot(final_flowers,aes(y=Sepal_Length,x=Petal_Length+Petal_Width)) + geom_point() 
+ geom_smooth(method = "lm", se = FALSE,color = "red")
?geom_smooth













ggplot(final_flowers, aes(x = Petal_Length + Petal_Width, y = Sepal_Length)) + geom_point() + 
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Linear Regression: Petal Length + Petal Width vs. Sepal Length",
       x = "Petal Length + Petal Width", y = "Sepal Length")


# 9. Hypotesting Test
# The linear regression
hypo <- lm(Petal_Length ~ Sepal_Length, data = final_flowers)
summary_regression <- summary(hypo)
# Performing the t-test with alternative and null hypotesis
# X = Petal Length
# H0 = coefficient for X != 0 
# H1 = coefficient for X == 0 
summary_regression <- summary(hypo)
summary_regression