# Microsoft Fabric Sales Analytics

This repository contains an end-to-end Sales Analytics project that I built while learning Microsoft Fabric.

The main goal wasn't just to create a Power BI dashboard. I wanted to understand how data actually moves through Fabric, how a Lakehouse works, how data is cleaned before reporting, and why a proper data model is important.

While building this project, I worked with Lakehouse, Warehouse, PySpark notebooks, Direct Lake, Semantic Models and Power BI. There were quite a few mistakes and retries during the process, but that's where most of the learning happened.

---

## Project Flow

The complete workflow looks like this:

```
Raw CSV
   │
   ▼
Bronze Layer
   │
   ▼
Silver Layer
   │
   ▼
Gold Layer
   │
   ▼
Warehouse
   │
   ▼
Semantic Model
   │
   ▼
Power BI Dashboard
```

---

## Tools Used

- Microsoft Fabric
- OneLake
- Lakehouse
- Fabric Warehouse
- PySpark
- SQL
- Power BI
- DAX
- Direct Lake

---

## What I Built

### Bronze Layer

Loaded the raw sales dataset into the Lakehouse without making any changes. The idea was to keep an original copy of the data before starting any transformation.

### Silver Layer

This is where most of the cleaning happened.

Things I worked on:

- Removed duplicate records
- Fixed missing values
- Converted date formats
- Checked data quality
- Saved cleaned data as Delta tables

### Gold Layer

After cleaning the data, I created business-ready tables that could be used for reporting.

This layer contains:

- Fact Sales
- Customer Dimension
- Product Dimension
- Date Dimension
- Region Dimension

These tables were designed using a Star Schema.

---

## Warehouse

The Gold tables were loaded into a Fabric Warehouse where I could validate the data using SQL before connecting it to Power BI.

---

## Semantic Model

Instead of using Import mode, I created a Direct Lake Semantic Model.

This allowed Power BI to read data directly from OneLake without importing everything again.

---

## Power BI Dashboard

The report includes:

- Revenue
- Orders
- Customers
- Average Order Value
- Revenue Trend
- Sales by Region
- Sales by Category
- Top Customers
- Product Performance

---

## DAX Measures

Some of the measures used in the report are:

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Previous Year Revenue
- Revenue Growth
- YoY %
- Customer Rank

---

## Challenges

This project wasn't completely smooth.

A few things took time to understand.

- Date conversion inside PySpark
- Removing duplicates without losing useful records
- Building the correct relationships for the Star Schema
- Understanding how Direct Lake works compared to Import Mode
- Organizing DAX measures so the model stayed clean
- Running notebooks in the correct order during data transformation

Most of these issues were solved by reading Microsoft documentation, testing different approaches and rebuilding parts of the model.

---

## What I Learned

Before starting this project, I mostly knew Power BI.

After completing it, I got practical experience with:

- Lakehouse
- Medallion Architecture
- OneLake
- PySpark
- Delta Tables
- Warehouse
- Direct Lake
- Semantic Model
- Star Schema
- DAX
- End-to-end analytics workflow

The biggest takeaway was that a dashboard is only as good as the data behind it. Most of the effort actually goes into preparing clean and reliable data before visualization.

---

## Folder Structure

```
Microsoft-Fabric-Sales-Analytics

├── Dataset
├── Notebooks
├── Warehouse
├── PowerBI
├── Screenshots
└── README.md
```

---

## Future Improvements

There are still a few things I'd like to add.

- Incremental loading
- Real-time data
- Row-Level Security
- CI/CD with Git Integration
- Better monitoring for pipelines

---

## Final Thoughts

I built this project mainly to understand Microsoft Fabric beyond dashboards. It gave me hands-on experience with data engineering, data modeling and reporting in a single platform.

I'm still learning, so if you have suggestions or notice something that can be improved, feel free to share your feedback.
