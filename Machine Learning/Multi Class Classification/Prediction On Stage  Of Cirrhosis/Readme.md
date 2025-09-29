# 🩺⚕️🧬 Predicting Cirrhosis Stages

## 📂 Project Overview
This project predicts **stages of cirrhosis disease** using clinical and demographic data.  
The workflow covers preprocessing, feature scaling, classification modeling, and evaluation with different algorithms.

---

## 🤖 Model & Approach
- **Preprocessing**
  - Applied StandardScaler, RobustScaler, and MinMaxScaler depending on feature distribution
  - Encoded categorical features with LabelEncoder, OneHotEncoder, and OrdinalEncoder
- **Models**
  - Random Forest Classifier
  - XGBoost Classifier
  - Hyperparameter optimization using GridSearchCV, RandomizedSearchCV, and Hyperopt
- **Evaluation**
  - Accuracy, Recall, AUC, Classification Report, and Confusion Matrix

---

## 🎯 What I Learned
- 🩺 Handling medical datasets with imbalanced distributions  
- ⚕️ Importance of recall in medical classification (better to flag disease than miss cases)  
- 🛠 Compared ensemble models (Random Forest, XGBoost)  
- 🔍 Applied hyperparameter tuning with multiple strategies (GridSearch, RandomizedSearch, Hyperopt)  

---

## 🛠 Tech Stack
- **Python**
- **Pandas, NumPy**
- **Matplotlib, Seaborn, Plotly**
- **Statsmodels**
- **Scikit-learn**
- **XGBoost**
- **Hyperopt**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Random Forest provided stable accuracy but limited optimization.  
- ✅ **Improved Model:** XGBoost with Hyperopt tuning achieved higher recall and better generalization across cirrhosis stages.  
- ⚠️ **Limitations:** Dataset size and imbalance may bias results.  
- 🔍 **Next Step:** Collect more real-world patient data, apply oversampling/SMOTE, and test deep learning models (e.g., ANN, CNN on imaging).  

---

## 🔗 View Notebook
- [Jupyter Notebook](Predicting%20Cirrhosis%20Stages.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/cirrhosis-stages-prediction

