# Revenue Leakage Investigation

## About the Project

This project investigates whether inventory stockouts and poor product availability are leading to missed sales for **FreshMart Retail Pvt. Ltd.**

The main idea is simple:

**Stockout → Customer demand not fulfilled → Missed sales → Revenue opportunity**

The analysis looks at sales, inventory, demand, stockouts and store performance to understand where this problem is happening and which areas should be given more attention.

## Business Problem

FreshMart wants to understand:

- Where are stockouts happening most often?
- Which stores and product categories are most affected?
- How much customer demand is not being fulfilled?
- Which areas have the highest estimated revenue opportunity?
- What actions could help reduce missed sales?

The goal is not just to show numbers, but to use the data to explain the problem and support practical business decisions.

## Dataset

The project uses a retail inventory dataset containing daily records across stores, products, categories and regions.

The original dataset contains **73,100 records** covering **731 dates**, with information such as inventory level, units sold, units ordered, demand forecast, price, discount, weather, promotion, revenue and inventory status.

The data was checked and cleaned before analysis. During cleaning, **673 negative demand forecast values were changed to 0**.

The final analysis dataset contains **73,100 records and 24 columns** after feature engineering.

**Dataset source:** https://www.kaggle.com/datasets/anirudhchauhan/retail-store-inventory-forecasting-dataset

## What I Did

The project was completed in several stages:

1. **Data Validation & Cleaning**  
   Checked the dataset structure, missing values, duplicates, data types and unusual values.

2. **Feature Engineering**  
   Created useful fields such as final price, revenue, remaining inventory, inventory utilization, demand gap, fulfillment rate, stockout and overstock indicators.

3. **Exploratory Data Analysis**  
   Used Python to understand sales, inventory, demand gaps, stockouts, overstock and relationships between important variables.

4. **SQL Analysis**  
   Used SQL to investigate revenue, stockouts, demand gaps, inventory utilization and store/category performance.

5. **Power BI Dashboard**  
   Built an interactive three-page dashboard to move from the overall business picture to the operational problems and finally to recommendations.

## Key Findings

The analysis showed that stockout problems are spread across the business rather than being limited to one category.

- **Groceries** had the highest stockout count with **535** stockouts.
- **Toys** had the highest estimated revenue opportunity at about **5.43M currency units**.
- **S004** had the highest stockout count with **547** stockouts.
- **Toys** also had the highest demand gap at around **75K units**.
- Toys, Clothing, Furniture and Groceries together represented an estimated **21.54M currency units revenue opportunity**.

This opportunity is an estimate based on the analysis. It should not be treated as guaranteed additional revenue.

## Dashboard

The Power BI dashboard is designed around three questions:

**1. What is happening?**  
An executive overview of revenue, sales, stockouts and demand gaps.

**2. Where is the problem?**  
A closer look at categories, stores, inventory performance and areas requiring attention.

**3. What should FreshMart do next?**  
Key findings, practical recommendations and the expected business impact.

## Tools Used

- **Python** — Data cleaning, feature engineering and exploratory analysis
- **SQL** — Data validation and business analysis
- **Power BI** — Interactive dashboard and reporting

## Conclusion

The analysis suggests that FreshMart's inventory problem is broader than a single product category. Stockouts and demand gaps appear across the business, while some stores show higher stockout levels than others.

The results point towards improving stock availability, reviewing stores with frequent stockouts, and using demand patterns more effectively when planning inventory.

The project brings these findings together into a practical analysis that can help FreshMart focus on reducing missed sales and serving customer demand better.
