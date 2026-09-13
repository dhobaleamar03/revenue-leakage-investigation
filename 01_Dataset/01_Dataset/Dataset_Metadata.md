# Dataset Metadata

## 1. Dataset Overview

**Project:** Revenue Leakage Investigation  
**Business:** FreshMart Retail Pvt. Ltd. (fictional)

The project uses a retail inventory dataset containing daily information about stores, products, sales, inventory, demand forecasts, pricing and other factors.

The dataset was used to investigate whether stockouts and poor product availability are linked to unmet demand and possible revenue leakage.

**Dataset source:** https://www.kaggle.com/datasets/anirudhchauhan/retail-store-inventory-forecasting-dataset

> The dataset source and license information have been verified from the original Kaggle dataset page.

---

## 2. Original Dataset

**File:** `retail_store_inventory.csv`

The original dataset contains:

- **73,100 rows**
- **15 columns**
- **731 dates**
- **5 stores**
- **20 Product IDs**
- **5 categories**
- **4 regions**

### Original columns

| Column | Description |
|---|---|
| Date | Date of the inventory record |
| Store ID | Store identifier |
| Product ID | Product identifier |
| Category | Product category |
| Region | Store region |
| Inventory Level | Inventory available for the record |
| Units Sold | Units sold |
| Units Ordered | Units ordered |
| Demand Forecast | Forecasted demand |
| Price | Original product price |
| Discount | Discount applied |
| Weather Condition | Weather condition |
| Holiday/Promotion | Holiday or promotion indicator |
| Competitor Pricing | Competitor price |
| Seasonality | Seasonal information |

---

## 3. Dataset Evolution

The dataset was processed in stages during the project:

```text
Raw Dataset
    ↓
Cleaned Dataset
    ↓
Feature-Engineered Dataset
    ↓
Final Analysis Dataset
```

### Stage 1 — Raw Dataset

`retail_store_inventory.csv`

This is the original dataset used as the starting point for the project.

### Stage 2 — Cleaned Dataset

`cleaned_inventory.csv`

The cleaning stage kept the same 15 columns and 73,100 records.

The main data-quality work included checking:

- Missing values
- Duplicate records
- Date values
- Store IDs
- Product IDs
- Categories
- Regions
- Numeric values

One issue found during cleaning was **673 negative Demand Forecast values**. These values were changed to `0` before continuing with the analysis.

### Stage 3 — Feature Engineering

`feature_engineered_inventory.csv`

New fields were added to support the business analysis, including:

- Final price
- Revenue
- Remaining inventory
- Inventory utilization
- Demand gap
- Fulfillment rate
- Stockout
- Overstock
- Overstock flag

This stage created the metrics needed for the later SQL and Power BI analysis.

### Stage 4 — Final Analysis Dataset

`feature_engineered_inventory_final.csv`

The final dataset contains:

- **73,100 rows**
- **24 columns**

It contains the original dataset fields together with the final calculated fields used for the analysis.

The final file has **673 blank values in the `Fulfillment Rate (%)` column**. This is recorded here as a data characteristic of the final file; the exact treatment of this field is documented separately in the analysis work.

---

## 4. Important Note About Product IDs

The dataset contains **20 Product IDs**, but a Product ID is not unique to one category.

For this reason, product-level analysis may need to consider both:

**Product ID + Category**

rather than assuming that Product ID alone identifies one unique product/category combination.

This is important when interpreting product-level tables or rankings.

---

## 5. Use of the Dataset in This Project

The final dataset was used for:

- Python exploratory analysis
- SQL analysis
- Power BI dashboard development
- Identifying stockout patterns
- Measuring demand gaps
- Estimating revenue opportunity
- Finding stores and categories that need attention

The final business findings are presented in the project report and Power BI dashboard.

---

## 6. Data Source

**Source:** https://www.kaggle.com/datasets/anirudhchauhan/retail-store-inventory-forecasting-dataset  
**License:** `CC0: Public Domain (CC0 1.0 Universal)`  
**Original dataset name:** `Retail Store Inventory Forecasting Dataset`

