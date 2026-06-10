# 🛒 Retail Sales Trend Analysis

> Designed a relational database and built an interactive Tableau dashboard to analyze retail sales trends

---

## 📌 Project Overview

This project analyzes retail sales data across multiple regions, product categories, and time periods. Using SQL for data extraction and Tableau for visualization, key insights were uncovered to support inventory and pricing decisions.

---

## 🛠️ Tools & Technologies

- **SQL Server** — Joins, CTEs, Window Functions
- **Tableau Public** — Interactive Dashboard
- **Excel** — Data cleaning and standardization
- **Dataset** — Retail Sales (25,000+ rows, 5 tables)

---

## 🗄️ Database Structure

| Table | Description |
|---|---|
| customers | Customer details and demographics |
| products | Product catalog with categories and prices |
| regions | Regional information across 5 regions |
| sales | Transaction records with amounts and dates |
| returns | Return records with reasons |

---

## 📊 SQL Queries Performed

1. **Monthly Revenue Trend** — Revenue by month using aggregations
2. **Quarterly Revenue** — Revenue by quarter using Window Functions
3. **Revenue by Region** — Regional performance using JOINs
4. **Product Category Analysis** — Top categories using RANK()
5. **Underperforming Categories** — Below average categories using CTEs
6. **Customer Purchase Summary** — Customer spending using JOINs
7. **Return Rate Analysis** — Return rate percentage

---

## 📈 Tableau Dashboard

🔗 **[View Live Dashboard](https://public.tableau.com/views/RevenuebyCategory_17810776766360/Dashboard1)**

### Visualizations:
| Chart | Type | Description |
|---|---|---|
| Monthly Revenue Trend | Line Chart | Revenue trend across 12 months |
| Revenue by Category | Bar Chart | Revenue per product category |
| Quarterly Revenue | Bar Chart | Q1-Q4 revenue comparison |
| Customer Purchase Summary | Bar Chart | Top customers by spending |
| Revenue by Region | Horizontal Bar | Regional revenue comparison |
| Underperforming Categories | Bar Chart | Categories below average revenue |

---

## 🔑 Key Findings

- 📌 **Q4 was peak revenue quarter** with 102,450 in sales
- 📌 **West region** had highest revenue — 145,000+
- 📌 **Electronics** was the top performing category
- 📌 **4 out of 5 categories** were underperforming vs Electronics
- 📌 **Return rate** was 12% across all sales

---

## 💡 Recommendations

- Focus inventory on **Electronics** — highest revenue category
- Investigate **low performance** in Furniture, Clothing, Kitchen, Sports
- Target **West and South regions** for expansion
- Reduce return rate by improving **product descriptions**

---

## 📁 Project Structure

```
Retail-Sales-Trend-Analysis/
│
├── retail_sales_data_sqlserver.sql     # Database creation + data
├── retail_sales_queries_sqlserver.sql  # Analysis queries
├── Retail_Sales_Trend_Analysis.twb     # Tableau workbook
└── dashboard.png                        # Dashboard screenshot
```

---

*Part of my [Data Analyst Portfolio](https://github.com/ismatullakhan/data-analyst-portfolio)* 😊
