# 🍽️⚕️🤖 Predicting Nutritional Status

## 📂 Project Overview
This project predicts and classifies **nutritional status (underweight, overweight, obese, or normal)** using demographic and lifestyle features.  
The dataset simulates populations in Latin America and helps deliver personalized dietary insights.

---

## 🤖 Model & Approach
- **EDA & Preprocessing**
  - Checked distribution, outliers, and multicollinearity
  - Applied RobustScaler for features with outliers and StandardScaler for stable features
  - Encoded categorical variables
- **Models**
  - Baseline: Random Forest (efficient, interpretable)
  - Proposed: Neural Network (flexible for non-linear feature interactions)
  - GridSearchCV used for hyperparameter tuning
- **Evaluation**
  - Metrics: Accuracy, Precision, Recall, F1-Score
  - Compared Random Forest vs Neural Network

---

## 🎯 What I Learned
- 🍽️ Handling imbalanced and synthetic health datasets  
- ⚡ Importance of recall in health-related predictions (better to flag at-risk individuals)  
- 🛠 How Random Forest and Neural Networks behave differently on classification tasks  
- 🔍 Applying oversampling, class weighting, and regularization for better generalization  

---

## 🛠 Tech Stack
- **Python**
- **NumPy, Pandas**
- **Matplotlib, Seaborn, Plotly**
- **Statsmodels**
- **Scikit-learn**
- **TensorFlow / Keras**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Random Forest achieved ~96% accuracy but risked lower recall (critical in healthcare).  
- ✅ **Improved Model:** Neural Network achieved ~88–89% accuracy with **higher recall**, aligning with project goals to minimize false negatives (obese predicted as normal).  
- ⚠️ **Limitations:** Synthetic dataset; may not reflect real-world complexity.  
- 🔍 **Next Step:** Apply oversampling to balance data, perform deeper feature engineering, and test ensemble or hybrid models (XGBoost, ensemble NN).  

---

## 🔗 View Notebook
- [Jupyter Notebook](Nutritional_Status_Prediction.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/nutritional-status-prediction

