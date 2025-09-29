# 🛍️📈👥 Classifying Frequency of Purchases

## 📂 Project Overview
This project applies **unsupervised learning and clustering** to classify customer purchase frequency for a clothing company.  
The workflow includes preprocessing, dimensionality reduction, clustering, and evaluation of cluster quality.

---

## 🤖 Model & Approach
- **EDA & Preprocessing**
  - Analyzed customer demographics and purchase frequency
  - Applied RobustScaler and StandardScaler for feature scaling
  - Encoded categorical variables with OneHotEncoder, OrdinalEncoder, and LabelEncoder
- **Clustering Models**
  - K-Means clustering to group customers
  - PCA for dimensionality reduction and visualization
- **Evaluation**
  - Cluster quality assessed using Silhouette Score, Davies–Bouldin Index, and visual inspection

---

## 🎯 What I Learned
- 🛍️ How to segment customers based on purchase frequency  
- 📈 Applying K-Means with scaling and encoding for clustering tasks  
- 👥 How to evaluate clustering quality with Silhouette and Davies–Bouldin scores  
- ⚡ Using PCA to visualize high-dimensional customer data  

---

## 🛠 Tech Stack
- **Python**
- **NumPy, Pandas**
- **Matplotlib, Seaborn, Plotly**
- **Statsmodels**
- **Scikit-learn**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Initial clusters without scaling led to biased results due to feature variance.  
- ✅ **Improved Model:** After scaling and encoding, K-Means produced balanced clusters with good Silhouette scores.  
- ⚠️ **Limitations:** K-Means assumes spherical clusters and may misclassify outliers.  
- 🔍 **Next Step:** Test **hierarchical clustering** or **DBSCAN** to capture non-spherical cluster structures.  

---

## 🔗 View Notebook
- [Jupyter Notebook](Classifying%20Frequency%20Of%20Purchases.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/purchase-frequency-classification

