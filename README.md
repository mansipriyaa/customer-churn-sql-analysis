# Customer Churn Analysis using SQL

## Project Overview
This project analyzes customer churn for a telecom business using SQL. 
The objective is to identify high-risk customer segments and recommend data-driven retention strategies.

## Dataset
- Source: Kaggle – Telco Customer Churn (IBM)
- Data was normalized into:
  - `customers.csv`
  - `contracts.csv`

## Tools Used
- SQLite (DB Browser for SQLite)
- SQL (CTEs, Window Functions, NTILE)
- GitHub

## Key Analyses

### 1. Churn Rate by Customer Tenure
- Segmented customers into New, Mid, and Long-term
- Found significantly higher churn among new customers

### 2. Cohort Retention Analysis
- Created tenure-based cohorts due to lack of signup date
- Identified early tenure as the most critical churn window

### 3. RFM Segmentation
- Used NTILE to assign Recency, Frequency, Monetary scores
- Low RFM segments showed the highest churn rates

## Key Insights
- New customers churn ~28%
- Low RFM customers are at highest risk
- Long-tenure, high-value customers show strong retention

## Business Recommendations
- Target new and low-RFM customers with onboarding offers
- Promote long-term contracts to reduce churn
- Personalize discounts for high-risk segments
