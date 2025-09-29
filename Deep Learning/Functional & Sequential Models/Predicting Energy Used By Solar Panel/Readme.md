# ☀️🔋📊 Solar Panel Energy Prediction

## 📂 Project Overview
This project predicts **energy usage from solar panels** using machine learning and deep learning models.  
It involves exploratory data analysis, preprocessing (handling outliers and distributions), and training neural networks with hyperparameter tuning.

---

## 🤖 Model & Approach
- **Exploratory Data Analysis**
  - Visualized energy patterns with Plotly and Seaborn
  - Checked data distribution and applied statistical tests (Shapiro-Wilk)
- **Preprocessing**
  - Applied variance inflation factor (VIF) to detect multicollinearity
  - Normalization and dropout layers to stabilize training
- **Neural Network Models**
  - Dense feedforward networks with BatchNormalization and LeakyReLU
  - Hyperparameter tuning using Keras Tuner for optimal architecture
- **Evaluation**
  - Metrics: MSE, MAE, and R²

---

## 🎯 What I Learned
- ☀️ How to analyze renewable energy usage patterns with data science  
- 🔋 Implemented neural networks for regression-based forecasting  
- 📊 Importance of statistical testing (VIF, Shapiro-Wilk) for preprocessing  
- ⚡ Hyperparameter tuning improves model robustness and accuracy  

---

## 🛠 Tech Stack
- **Python**
- **Pandas, NumPy**
- **Matplotlib, Seaborn, Plotly**
- **Statsmodels, Scipy**
- **TensorFlow / Keras**
- **Keras Tuner**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Untuned dense network produced unstable predictions with higher error.  
- ✅ **Improved Model:** After applying normalization, dropout, and tuning with Keras Tuner, the model achieved **lower MSE/MAE** and higher **R²**, meaning better explanatory power.  
- ⚠️ **Limitations:** Performance can vary under extreme weather conditions not well represented in the dataset.  
- 🔍 **Next Step:** Incorporate external factors (e.g., weather forecasts), test **LSTM/GRU** for sequential modeling, and explore hybrid physical–ML models for renewable energy prediction.  

---

## 🔗 View Notebook
- [Jupyter Notebook](notebook.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/solar-energy-prediction

