# 🚢🔍 YOLO-based Ship Detection

## 📂 Project Overview
This project applies **YOLO (You Only Look Once)** models for ship detection in images.  
Different versions (YOLOv4, YOLOv8, and YOLOv11) were tested and compared for accuracy, speed, and robustness.

---

## 🤖 Model & Comparison
- **YOLOv4**
  - Older but reliable version, trained with Darknet
  - Provides good accuracy but slower inference
- **YOLOv8**
  - Improved performance and efficiency compared to YOLOv4
  - Faster inference with better mAP scores
- **YOLOv11**
  - Latest YOLO release, combining speed and accuracy improvements
  - Outperformed v4 and v8 in both precision and recall

---

## 🎯 What I Learned
- 🚢 How to use **YOLO (Ultralytics)** for object detection tasks  
- ⚡ Importance of dataset preparation, annotation, and augmentation for detection  
- 📊 How to evaluate models with precision, recall, and mAP  
- 🔍 The trade-off between accuracy and inference speed across YOLO versions  

---

## 🛠 Tech Stack
- **Python**
- **NumPy, Pandas**
- **Matplotlib, Seaborn**
- **OpenCV**
- **TensorFlow**
- **Ultralytics (YOLOv8 / YOLOv11)**

---

## 📌 Evaluation / Next Step
- 📉 **YOLOv4:** Stable but slower, struggled with small objects.  
- ✅ **YOLOv8:** Balanced accuracy and speed, strong baseline.  
- 🚀 **YOLOv11:** Best performance overall, higher precision and faster inference.  
- 🔍 **Next Step:** Expand dataset for more ship types, test **YOLOv11 fine-tuning**, and deploy as a real-time detection system.  

---

## 🔗 View Notebook
- [YOLOv11 Notebook](Ship%20Detection%20YoloV11.ipynb)  
- [YOLOv4 & YOLOv8 Notebook](YoloV4&V8.ipynb)

---

## 🚀 How to Run
1. Clone the repo:  
   ```bash
   git clone https://github.com/yourusername/portfolio-projects.git
   cd portfolio-projects/ship-detection-yolo
