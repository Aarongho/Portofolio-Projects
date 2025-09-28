# 🫀 Heart Disease Classification

## 📂 Project Overview
This project focuses on **classifying heart disease** using clinical datasets.  
The workflow includes **EDA (Exploratory Data Analysis)**, **data preprocessing**, **model training**, and **evaluation** to assess prediction performance.

---

## 🤖 Model & Comparison
- **Baseline Model (Logistic Regression / Sklearn)**
  - Provided a quick benchmark accuracy
  - Simple and interpretable but limited for non-linear patterns

- **Neural Network Model (Keras Sequential)**
  - Trained for 100 epochs with scaled data
  - Outperformed the baseline model on accuracy and ROC-AUC
  - Captured more complex feature interactions

- **Tuning**
  - Applied **MinMaxScaler** for feature scaling → improved stability of ANN
  - Epochs set to 100, but further tuning (early stopping, dropout, optimizer change) could boost generalization
  - Next improvements: experiment with ensemble models (RandomForest, XGBoost) and hyperparameter tuning

---

## 🎯 What I Learned
- 🔑 Performed EDA to uncover correlations and data insights  
- 📌 Handled multicollinearity and scaling features before training  
- 🚀 Built and evaluated both baseline models and neural networks  

---

## 🛠 Tech Stack
- **Python**
- **Pandas**, **NumPy**
- **Matplotlib**, **Seaborn**, **Plotly**
- **Statsmodels**
- **Scikit-learn**
- **Keras (TensorFlow backend)**

---

## 📌 Evaluation / Next Step
- ✅ Neural Network improved results over the baseline Logistic Regression  
- 🔍 Next step: implement **hyperparameter tuning**, **dropout layers**, and test **ensemble methods** for better generalization  

---

## 🔗 View Notebook
- [Jupyter Notebook](Classifying Heart Diseases.ipynb)  

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/heart-disease-classification
