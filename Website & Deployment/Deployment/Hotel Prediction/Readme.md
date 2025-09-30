# 🏨📉🤖 Hotel Booking Cancellation Prediction – Streamlit App

## 📂 Project Overview
This project develops and deploys a **machine learning pipeline** to predict whether a hotel booking will be canceled.  
The deployment is done with **Streamlit**, allowing users to input booking details and receive real-time predictions with probability scores and feature explanations.

---

## 🔄 Pipeline & Approach
1. **Data Preprocessing**
   - Categorical + numerical features handled with encoding and scaling  
   - Features include adults, children, lead time, room type, meal plan, etc.  

2. **Model Training**
   - Trained classifiers (e.g., Random Forest, Gradient Boosting)  
   - Saved best model with `joblib`  

3. **Deployment (Streamlit)**
   - User inputs booking data through a web form  
   - Model returns prediction: *Canceled* or *Not Canceled*  
   - Probabilities displayed as chart + SHAP feature contribution  

---

## 🎯 What I Learned
- 🏨 Building predictive models for hotel booking cancellation  
- 📉 Applying SHAP values for model explainability  
- 🤖 Creating end-to-end ML pipelines (preprocessing → model → deployment)  
- 🚀 Deploying machine learning apps on **Streamlit Cloud**  

---

## 🛠 Tech Stack
- **Python**
- **NumPy, Pandas, Scikit-learn**
- **Matplotlib, Seaborn**
- **SHAP (explainability)**
- **Streamlit (deployment)**

---

## 📌 Evaluation / Next Step
- ✅ Deployed app predicts booking cancellations with probability and feature explanation.  
- ✅ SHAP visualizations make predictions transparent.  
- ⚠️ Model trained on limited dataset; generalization may be restricted.  
- 🔍 Next Step: retrain with larger hotel booking datasets, add more business features (seasonality, holidays), and expand deployment with API integration.  

---

## 🔗 Links
- 📂 [GitHub Repository](https://github.com/yourusername/hotel-booking-cancellation)  
- 💻 [Live Demo](https://your-streamlit-app-link.streamlit.app/)  
