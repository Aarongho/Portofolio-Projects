# 📊💹📉 Final Price Dashboard (Tableau)

## 📂 Project Overview
This project builds an **interactive Tableau dashboard** to analyze the correlation between **Final Price**, **Demand Rate**, and **Stock** over time.  
The data is recorded hourly across several days, allowing analysis of short-term patterns and price fluctuations.

---

## 📊 Visualization & Insights
- **Final Price vs Demand Rate**
  - Both show a **positive correlation**: higher demand tends to push the price upward.
- **Final Price vs Stock**
  - Shows a **negative correlation**: lower stock levels are associated with higher prices, and vice versa.
- **Dashboard Layout**
  - Four panels showing hourly movements of demand, stock, and price.
  - Combined charts allow comparison and correlation analysis.

---

## 🎯 What I Learned
- 📊 How to design a Tableau dashboard for time-series correlations.  
- 💹 Interpreting relationships between demand, stock, and price.  
- 🧠 Why some parameters (profit margin, competitor price, capital) are excluded from short-term analysis.  

---

## 🛠 Tech Stack
- **Tableau**
- **Excel / CSV data source**

---

## 📌 Evaluation
From this dashboard we can conclude:
- ✅ **Final Price ↔ Demand Rate**: Positively correlated. As demand increases, price also increases.  
- ✅ **Final Price ↔ Stock**: Negatively correlated. When stock decreases, price rises, and when stock increases, price tends to drop.  
- ⚠️ Parameters like **profit margin, capital, and competitor price** are excluded because they don’t vary meaningfully on an **hourly basis** (they are better suited for monthly analysis).  

This evaluation highlights that demand and stock are the key short-term drivers of price.  

---

## 🚀 How to Run
1. Open Tableau Desktop or Tableau Public.  
2. Load the dataset (CSV/Excel).  
3. Open the dashboard file (`.twb` or `.twbx`).  
4. Interact with filters to explore correlations.  

---

## 📎 License
This project is for **educational purposes** and open for learning & improvement.  
