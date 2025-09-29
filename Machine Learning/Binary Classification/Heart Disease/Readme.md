# 🫀 Heart Disease Classification

## 📂 Project Overview
This project focuses on **classifying heart disease** using clinical datasets.  
The workflow includes **EDA (Exploratory Data Analysis)**, **data preprocessing**, **model training**, and **evaluation** to assess prediction performance.

---

## 🤖 Model & Comparison
- **Baseline Model (Logistic Regression / Sklearn)**
  - Gave a quick benchmark accuracy
  - Easy to interpret with coefficients, but limited in handling complex non-linear feature interactions

- **Neural Network Model (Keras Sequential)**
  - Trained for 100 epochs with scaled data
  - Outperformed Logistic Regression in terms of accuracy and ROC-AUC
  - Captured more subtle relationships between features and target

- **Tuning**
  - **MinMaxScaler** improved training stability and convergence  
  - Increasing training epochs improved performance, but risk of overfitting remained  
  - Future tuning could include adjusting hidden layer size, dropout, and optimizers (Adam, RMSprop)

---

## 🎯 What I Learned
- 📊 Performed EDA to uncover correlations and medical data insights  
- 🔎 Detected and mitigated multicollinearity using statistical methods  
- 🛠 The importance of feature scaling for neural networks  
- 🚀 Comparison between classical ML and deep learning models for medical classification  

---

## 🛠 Tech Stack
- **Python**
- **Pandas, NumPy**
- **Matplotlib, Seaborn, Plotly**
- **Statsmodels**
- **Scikit-learn**
- **Keras (TensorFlow backend)**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline Understanding:** Logistic Regression gave a reasonable benchmark but struggled with non-linear decision boundaries.  
- ✅ **Model Performance:** The tuned Neural Network showed higher **accuracy** and better **ROC-AUC**, meaning it captured more variance in predicting patients with and without heart disease. Scaling with MinMaxScaler was crucial for stable learning.  
- ⚠️ **Limitations:** While accuracy improved, the model may still misclassify edge cases due to class imbalance and limited feature interactions.  
- 🔍 **Next Step:** Apply **hyperparameter tuning** (neurons, hidden layers, learning rates), add **regularization/dropout**, and test **ensemble models** (RandomForest, XGBoost) for robustness.

---

## 🔗 View Notebook
- [Jupyter Notebook](notebook.ipynb)  
- [PDF Report](report.pdf)  

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/heart-disease-classification
