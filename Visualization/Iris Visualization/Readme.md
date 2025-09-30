# 🌸📊📐 Iris Dataset Visualization and Analysis

## 📂 Project Overview
This project uses the famous **Iris dataset** to demonstrate **data visualization and statistical analysis with R**.  
The workflow covers data cleaning, outlier detection, visualization, correlation analysis, regression modeling, and hypothesis testing.

---

## 📊 Workflow & Features
1. **Data Preparation**
   - Loaded `iris` dataset from R
   - Checked structure, duplicates, and missing values
   - Normalized features and removed outliers

2. **Exploratory Data Analysis**
   - Histograms of Sepal & Petal dimensions
   - Scatterplots of multiple variables, split by species
   - Pair plots for Virginica, Versicolor, and Setosa

3. **Correlation & Regression**
   - Shapiro–Wilk tests for normality
   - Pearson correlation between Petal Length & Petal Width
   - Linear regression: Sepal Length ~ Petal Length + Petal Width

4. **Hypothesis Testing**
   - Regression-based t-tests to test null hypothesis of independence between features

---

## 🎯 What I Learned
- 🌸 Handling duplicates, missing values, and outliers in R  
- 📊 Creating clear and meaningful visualizations with `ggplot2`  
- 📐 Using correlation and regression to test relationships between features  
- ⚡ Applying hypothesis testing to validate assumptions  

---

## 🛠 Tech Stack
- **R**
- **dplyr**
- **ggplot2**
- **datasets (Iris)**

---

## 📌 Evaluation / Next Step
- ✅ Visualizations show clear separation between species (Setosa, Versicolor, Virginica).  
- ✅ Regression models confirm linear relationships between Petal and Sepal dimensions.  
- ⚠️ Limitation: Iris dataset is small and well-structured.  
- 🔍 Next Step: apply same workflow on larger biological datasets or real-world flower classification tasks.  

---

## 🚀 How to Run
1. Open R or RStudio  
2. Install packages:  
   ```r
   install.packages(c("dplyr","ggplot2"))
