
# RetailX: End-to-End Live Data Pipeline with Azure & Python 🚀

> Built using Microsoft Azure, Python & Power BI  
> **By Krishna Chaitanya Muttevi**


---
> youtube demo: https://youtu.be/wWYqg14s9uY
## 📘 Project Overview

RetailX is a cloud-native, real-time retail data analytics pipeline that simulates live transaction data and processes it through an event-driven Azure ecosystem. The data is visualized using interactive Power BI dashboards.

This project showcases hands-on experience with real-time data ingestion, transformation, cloud storage, and visualization using tools like Azure Event Hub, Stream Analytics, ADLS Gen2, and Power BI.

---

## 🛠️ Tech Stack

| Component | Purpose |
|----------|---------|
| **Azure Event Hub** | Real-time ingestion |
| **Azure Stream Analytics** | SQL-based stream processing |
| **Azure Data Lake Gen2** | Cloud storage for JSON data |
| **Power BI** | Data visualization |
| **Python** | Transaction simulator |
| **JSON** | Streaming data format |

---

## 🧱 Architecture Diagram

The following architecture demonstrates the complete flow from simulation to visualization:

<img width="1920" height="1080" alt="RetailX Archirecture Diagram" src="https://github.com/user-attachments/assets/9d53fb24-e90c-4d9f-973d-fd7a708aa9ac" />



---

## 🐍 Python Simulator

- Publishes transaction events to Azure Event Hub in real-time.
- Written in Python (`simulate transactions.py`).
- Each message contains fields like timestamp, product, quantity, price, etc.
  
  <img width="941" height="544" alt="image" src="https://github.com/user-attachments/assets/fec4b36d-a454-4109-b762-92bde7d8ecce" />

---

## ⚙️ Azure Components

### 🎯 Event Hub Setup

1. Created namespace and Event Hub.
<img width="940" height="385" alt="image" src="https://github.com/user-attachments/assets/8d64e421-7b01-4d8e-b85b-3d38c08172fe" />


2. Generated Shared Access Policy for authentication.
 <img width="965" height="396" alt="image" src="https://github.com/user-attachments/assets/1945c3fe-864f-462f-84b5-09b96c9c5704" />

3. Connected Python script to push data.

  <img width="940" height="394" alt="image" src="https://github.com/user-attachments/assets/62e489d9-3328-4060-898e-3eba158d7beb" />

   

### 🗃️ Azure Data Lake Gen2

- Created storage account with **Hierarchical namespace**.
  <img width="941" height="377" alt="image" src="https://github.com/user-attachments/assets/b76bdd00-35ce-4d5f-b862-f7b77bcd51a9" />
  <img width="940" height="400" alt="image" src="https://github.com/user-attachments/assets/d6e4d8e8-02db-4be8-b5b7-b458d24f7f1d" />
  <img width="941" height="376" alt="image" src="https://github.com/user-attachments/assets/5a25e6c7-e443-41d5-be74-65af8a0702a6" />


- Created container and directory to hold processed output files (JSON).
  <img width="941" height="376" alt="image" src="https://github.com/user-attachments/assets/580570e5-4e57-4411-82e6-b6326d29aee9" />

### 🧩 Stream Analytics

1. Created job to read from Event Hub.
   <img width="941" height="372" alt="image" src="https://github.com/user-attachments/assets/89ec6a1c-33c6-43c6-ad1f-9987a675e214" />

2. Defined input schema.
   <img width="940" height="383" alt="image" src="https://github.com/user-attachments/assets/9f6b65e4-bac9-4d2e-894b-ee179cc61e76" />

3. Output written to ADLS Gen2 as JSON.
    <img width="940" height="385" alt="image" src="https://github.com/user-attachments/assets/471af439-2195-4e6f-bdb1-31ab1bdfcf1b" />


4. Live queries tested on streaming input.
   <img width="922" height="419" alt="image" src="https://github.com/user-attachments/assets/823c2d8e-33ce-4ced-bbb1-69b19f011f2a" />

    
---

## 📊 Power BI Integration

> Power BI connects directly to ADLS Gen2 to visualize real-time output.

1. Connected to Azure Blob Storage.
   <img width="940" height="503" alt="image" src="https://github.com/user-attachments/assets/20408be8-ed6e-40e2-a137-b55c86351fdd" />

2. Navigated to the container directory.
   <img width="940" height="597" alt="image" src="https://github.com/user-attachments/assets/8982d521-6f8f-4d24-9ce5-64aca17d2bdb" />

3. Transformed raw JSON into tabular format.
   <img width="940" height="389" alt="image" src="https://github.com/user-attachments/assets/17e1a319-9a7d-4e90-898b-7c41959c4646" />

4. Built interactive dashboards with charts and KPIs.
    <img width="940" height="527" alt="image" src="https://github.com/user-attachments/assets/9546784f-ca04-4a37-b976-58b8a81fdd41" />

<img width="774" height="467" alt="image" src="https://github.com/user-attachments/assets/830ac17f-f5d0-458f-890f-0fc939f112f6" />



```md
