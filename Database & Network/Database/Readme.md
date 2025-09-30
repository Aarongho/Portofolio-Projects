# 🚢📑💾 Trasporindo Export Documents Database

## 📂 Project Overview
This project designs and implements a **relational database** for **Trasporindo Export Documents**, a company providing export administration services (bill of lading, invoices, export certificates, etc).  
The database ensures **accuracy, consistency, and efficiency** in handling export documentation.

---

## 🏢 Case Description
Trasporindo faced issues with:
- ❌ Duplicate data (customer and transaction duplication)  
- ❌ Inaccurate records (wrong addresses, invalid document numbers)  
- ❌ Human error from manual input  

The goal of this project is to **normalize the database** and implement SQL tables to eliminate anomalies and duplication.

---

## 🔄 Database Design Process
1. **Un-Normalized Form (UNF)**  
   - Sample data collected with anomalies.  

2. **1NF**  
   - Removed multivalued attributes (e.g., exporter address, number & description of packages).  

3. **2NF**  
   - Ensured all attributes depend fully on the primary key (Booking No).  

4. **3NF**  
   - Split tables based on functional dependencies → removed transitive dependencies.  

5. **ERD (Entity Relationship Diagram)**  
   - Created **Shipment Table** as central entity  
   - Linked to **Exporter, Consignee, Product, Container, Service, Vessel**  

---

## 🎯 What I Learned
- 🚢 Applying **database normalization (UNF → 1NF → 2NF → 3NF)**  
- 📑 Designing **ERDs** for export documentation systems  
- 💾 Implementing **SQL tables with PK–FK relationships**  
- ⚡ Importance of data accuracy in international trade operations  

---

## 🛠 Tech Stack
- **MySQL / MariaDB**  
- **SQL Workbench / phpMyAdmin**  
- **ERD Tools (draw.io, Lucidchart, MySQL Workbench)**  

---

## 📌 Evaluation / Next Step
- ✅ Database successfully normalized to **3NF**, reducing anomalies (insertion, update, deletion).  
- ✅ SQL implementation covers all entities (Shipments, Exporter, Consignee, Product, Container, Service, Vessel).  
- ⚠️ Limitation: Current design is static and assumes perfect data input.  
- 🔍 Next Step: add **stored procedures**, **triggers for validation**, and possibly integrate with **a web frontend** for real-time export operations.  


---

## 📎 License
This project is for **educational purposes** and open for learning & improvement.
