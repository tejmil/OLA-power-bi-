# 🚖 Ola Rides Data Analysis & Operations Dashboard

## 🎯 Project Overview
This project delivers a data-driven analysis of Ola ride-hailing operations using an end-to-end data pipeline. By integrating **Excel**, **SQL Server**, and **Power BI**, the project uncovers actionable insights regarding ride booking status, customer/driver cancellation patterns, revenue trends, and service utilization across different vehicle categories.

## 🛠️ Tech Stack & Data Pipeline
1. **Excel:** Used for initial data gathering, raw data inspection, and basic data dictionary definition.
2. **SQL Server:** Used for data migration, writing complex queries, data cleaning, and staging the final tables.
3. **Power BI:** Used for data modeling (Star Schema), building advanced DAX measures, and creating interactive operational dashboards.

## 📥 Data Pipeline & Setup Instructions

### Step 1: SQL Database Setup
1. Open SQL Server Management Studio (SSMS).
2. Create a new database named `OlaProject`.
3. Import the raw data from your Excel sheet or run the provided setup scripts:
   ```sql
   -- Example query used to analyze top cancellation reasons
   SELECT Drop_Reason, COUNT(*) as Total_Cancellations
   FROM Ola_Bookings
   WHERE Booking_Status = 'Canceled by Customer'
   GROUP BY Drop_Reason
   ORDER BY Total_Cancellations DESC;
   ```

### Step 2: Power BI Connection & Modeling
1. Open `Ola_Operational_Insights.pbix` in **Power BI Desktop**.
2. Go to **Home** > **Transform Data** > **Data Source Settings** and update the SQL Server connection string to match your local instance.
3. The data model follows a optimized **Star Schema**:
   * **Fact Table:** `Fact_Bookings` (Booking ID, Revenue, Distance, Dates, Ratings)
   * **Dimension Tables:** `Dim_Customers`, `Dim_Drivers`, `Dim_Vehicles`, `Dim_Date`

## 🧮 Core DAX Metrics Used
* **Total Booking Revenue:**
  ```dax
  Total Revenue = SUM(Fact_Bookings[Booking_Value])
  ```
* **Ride Fulfillment Rate %:**
  ```dax
  Fulfillment Rate % = 
  DIVIDE(
      CALCULATE(COUNT(Fact_Bookings[Booking_ID]), Fact_Bookings[Booking_Status] = "Success"), 
      COUNT(Fact_Bookings[Booking_ID]), 
      0
  )
  ```
* **Average Ride Distance:**
  ```dax
  Avg Distance = AVERAGE(Fact_Bookings[Ride_Distance])
  ```

## 📊 Dashboard Views Included
* **Executive Summary:** High-level overview of total bookings, completed rides, total revenue, and overall fulfillment rates.
* **Customer Insights:** Breakdown of customer ratings, ride history patterns, and primary cancellation reasons.
* **Driver Performance:**  driver-end trip cancellations, and feedback scores.
* **Vehicle Segment Analysis:** Profitability and booking volume comparison across Auto, Mini, Prime Sedan, and Prime SUV.

## 📈 Key Insights Found
* **Volume vs. Value:** *Ola bike* handles the highest daily booking volume, but *Ola Prime Sedan* generates 45% of total revenue.
* **Cancellations:** Driver cancellation spikes are heavily correlated with "Long distance to pickup point" during rainy periods.

## 👤 Project Developer & Contact
* **Developer:** [Tejas Bhosale]
* **Email:** [tejasdeepak2005@gmail.com]
* **LinkedIn:** [https://www.linkedin.com/in/tejas-bhosale-13020m/]
