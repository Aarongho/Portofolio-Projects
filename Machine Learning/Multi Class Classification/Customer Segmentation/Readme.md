
# 👥📊🛍️ Customer Segmentation

## 📂 Project Overview
This project applies **machine learning classification** to segment customers for marketing purposes.  
The dataset was analyzed, preprocessed, and trained with multiple classification models to predict customer groups.

---

## 🤖 Model & Approach
- **EDA**
  - Visualized customer attributes using Matplotlib, Seaborn, Plotly
  - Checked for multicollinearity with VIF
- **Preprocessing**
  - Applied RobustScaler for stable scaling
  - Encoded categorical features with OneHotEncoder and LabelEncoder
- **Models**
  - Tested multiple classification models (Logistic Regression, Decision Trees, etc.)
  - Hyperparameter tuning with GridSearchCV
- **Evaluation**
  - Confusion Matrix, ROC Curve, Accuracy, Recall, Classification Report

---

## 🎯 What I Learned
- 👥 How to perform customer segmentation with ML classification  
- 📊 Importance of scaling and encoding in preprocessing  
- 🛠 Applied confusion matrix, ROC, and AUC for evaluation  
- ⚡ Hyperparameter tuning with GridSearchCV improved performance  

---

## 🛠 Tech Stack
- **Python**
- **NumPy, Pandas**
- **Matplotlib, Seaborn, Plotly**
- **Statsmodels**
- **Scikit-learn**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Initial models without scaling/encoding gave poor results.  
- ✅ **Improved Model:** After preprocessing and tuning, accuracy and recall increased significantly.  
- ⚠️ **Limitations:** Model performance depends on dataset size and balance.  
- 🔍 **Next Step:** Try **ensemble models** (RandomForest, XGBoost) and apply **clustering (K-Means)** to discover hidden customer groups.  

---

## 🔗 View Notebook
- [Jupyter Notebook](Customer%20Segmentation.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/Aarongho/portfolio-projects.git
   cd portfolio-projects/customer-segmentation
