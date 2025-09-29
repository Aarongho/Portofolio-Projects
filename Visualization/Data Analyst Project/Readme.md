# 🎓📊🇮🇩 Education Visualization in Indonesia (Shiny App)

## 📂 Project Overview
This project uses **R Shiny** to create an interactive dashboard that visualizes educational data in Indonesia for the year 2022.  
It combines multiple datasets covering teacher distribution and school participation rates across provinces and age groups.

---

## 📊 Visualization & Features
- **Teacher Distribution (2022)**
  - Interactive bar plots comparing the number of teachers at SD, SMP, SMA, and SMK levels by province
  - Dynamic filtering with `selectInput`  
- **School Participation (2002–2022)**
  - Interactive line plots showing school participation rates across age groups (7–12, 13–15, 16–18, 19–24)
  - Trends visualized with time series lines

---

## 🎯 What I Learned
- 🎓 Building interactive dashboards with **Shiny**  
- 📊 Using **plotly** for dynamic bar/line charts  
- 🎨 Applying **bslib** themes for polished UI  
- 🛠 How to combine multiple datasets in one visualization app  

---

## 🛠 Tech Stack
- **R**
- **Shiny, bslib**
- **ggplot2, plotly**
- **dplyr, readxl**

---

## 📌 Evaluation / Next Step
- ✅ Current dashboard provides clear insights into teacher distribution and participation trends  
- ⚠️ Limitation: app relies on static CSV/Excel input  
- 🔍 Next Step: connect to **real-time education data APIs** or expand dashboard with more indicators (dropout rates, literacy, etc.)  

---

## 🚀 How to Run
1. Install required R packages:  
   ```r
   install.packages(c("shiny", "bslib", "ggplot2", "plotly", "dplyr", "readxl"))

