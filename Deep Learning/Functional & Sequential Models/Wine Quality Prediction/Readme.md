# 🍷📊🤖 Predicting Red Wine Quality

## 📂 Project Overview
This project predicts **red wine quality** using deep learning models.  
Two different architectures were tested and compared:
- **Keras Sequential Model**
- **Keras Functional API Model**

---

## 🤖 Model & Approach
- **Sequential API**
  - Straightforward feedforward architecture
  - Easier to build and quick to prototype
- **Functional API**
  - More flexible, allowed branching and merging of layers
  - Better suited for complex architectures
- **Tuning**
  - Hyperparameter search with Keras Tuner
  - Used BatchNormalization, LeakyReLU, and Dropout to improve training stability

---

## 🎯 What I Learned
- 🍷 How dataset features (acidity, sugar, alcohol) affect wine quality  
- 📊 Difference between Sequential and Functional Keras models  
- 🔎 Importance of feature correlation (checked with VIF)  
- ⚡ Applied hyperparameter tuning to optimize regression accuracy  

---

## 🛠 Tech Stack
- **Python**
- **NumPy, Pandas**
- **Matplotlib, Seaborn, Plotly**
- **Statsmodels**
- **TensorFlow / Keras**
- **Keras Tuner**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Untuned models struggled with overfitting and inconsistent predictions.  
- ✅ **Improved Models:** Both architectures improved with BatchNormalization and Dropout. Functional API provided slightly better results due to flexibility.  
- ⚠️ **Limitations:** Model performance still sensitive to hyperparameter settings.  
- 🔍 **Next Step:** Explore **ensemble models**, apply **cross-validation**, and test **XGBoost or RandomForest** as benchmarks.  

---

## 🔗 View Notebooks
- [Functional Model](Functional_Model.ipynb)  
- [Sequential Model](Sequential_Model.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/red-wine-quality
