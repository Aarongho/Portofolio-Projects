# 🧠🩻🔬 Brain Tumor Classification

## 📂 Project Overview
This project focuses on **classifying brain tumors from medical images** using deep learning models.  
Transfer learning with pre-trained CNN architectures (EfficientNet, DenseNet, MobileNet) was applied to improve accuracy and efficiency.

---

## 🤖 Model & Approach
- **Transfer Learning**
  - Used pre-trained models: EfficientNetB0, DenseNet121, MobileNetV2, EfficientNetV2S
  - Fine-tuned on brain tumor dataset with medical imaging
- **Data Pipeline**
  - Images loaded via `image_dataset_from_directory`
  - Applied augmentations and normalization
- **Evaluation**
  - Classification reports and confusion matrices for each model
  - Compared accuracy and generalization performance

---

## 🎯 What I Learned
- 🧠 How transfer learning accelerates deep learning projects in medical imaging  
- 🔎 Importance of balanced datasets and augmentation for healthcare tasks  
- ⚡ Comparison of multiple CNN architectures for classification  
- 📊 Using confusion matrices to interpret medical classification results  

---

## 🛠 Tech Stack
- **Python**
- **Pandas, NumPy**
- **Matplotlib**
- **PIL**
- **TensorFlow / Keras**
- **EfficientNet, DenseNet, MobileNet**

---

## 📌 Evaluation / Next Step
- 📉 **Baseline:** Initial training without transfer learning underperformed due to limited dataset size.  
- ✅ **Improved Models:** Transfer learning (EfficientNet, DenseNet, MobileNet) achieved higher accuracy, with EfficientNetV2S showing the best balance between speed and accuracy.  
- ⚠️ **Limitations:** Risk of overfitting due to small dataset size; performance may vary across unseen real-world scans.  
- 🔍 **Next Step:** Apply **data augmentation**, **cross-validation**, and consider **ensembling models** for higher reliability in clinical settings.  

---

## 🔗 View Notebook
- [Jupyter Notebook](notebook.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/brain-tumor-classification

