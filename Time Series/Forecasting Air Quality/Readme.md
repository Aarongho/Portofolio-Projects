# 🌫️📈🧠 Forecasting Air Quality

## 📂 Project Overview
This project focuses on **forecasting air quality (AT index)** using multivariate time series data.  
Data preprocessing, seasonal decomposition, scaling, and deep learning models (LSTM, BiLSTM) were applied to capture temporal dependencies.

---

## 🤖 Model & Approach
- **Exploratory Data Analysis**
  - Analyzed temporal patterns and outliers with z-score
  - Seasonal decomposition (STL) to identify trend and seasonality
- **Preprocessing**
  - Applied RobustScaler and MinMaxScaler for stability
  - Feature selection via correlation and PACF
- **Deep Learning Models**
  - Sequential LSTM and Bidirectional LSTM architectures
  - Dropout and EarlyStopping used to prevent overfitting
- **Evaluation**
  - Metrics: MSE, MAE, R²

---

## 🎯 What I Learned
- 🌫️ How to handle multivariate time series data for environmental forecasting  
- 📊 Applied statistical decomposition and PACF analysis  
- 🧠 Built and tuned LSTM/BiLSTM models for sequential predictions  
- ⚡ The role of scaling and dropout in stabilizing deep learning models  

---

## 🛠 Tech Stack
- **Python**
- **Pandas, NumPy**
- **Matplotlib, Seaborn**
- **Statsmodels, Scipy**
- **Scikit-learn**
- **TensorFlow / Keras**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Traditional statistical models struggled with multivariate dependencies.  
- ✅ **Improved Model:** BiLSTM achieved the lowest **MSE/MAE** and highest **R²**, proving its ability to capture complex temporal patterns.  
- ⚠️ **Limitations:** Model may degrade when exposed to unseen external shocks (e.g., sudden pollution spikes).  
- 🔍 **Next Step:** Incorporate **exogenous variables** (weather, traffic), try **hybrid ARIMA–LSTM models**, and deploy for near real-time air quality forecasting.  

---

## 🔗 View Notebook
- [Jupyter Notebook](Forecasting%20Air%20Quality.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/air-quality-forecasting
