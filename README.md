# Superstore Sales & Profitability Analysis

An end-to-end data analytics project on **~10,000 US retail transactions (2015–2018)**: data cleaning in **Python**, business analysis in **SQL (PostgreSQL)**, and an interactive **Tableau** dashboard.

**🔗 Live dashboard:** [View on Tableau Public](REPLACE_WITH_YOUR_TABLEAU_PUBLIC_LINK)

![Dashboard preview](dashboard/dashboard.png)

---

## Tools used
Python (pandas) · PostgreSQL · Tableau · Jupyter Notebook

## The business question
Which regions, categories, and customer segments drive sales and profit — and where are discounts quietly hurting margins?

## Key findings
- **The business is growing** — sales rose every year ($484K → $733K), and profit grew every year too.
- **Two product lines lose money:** Tables (−$17.7K) and Bookcases (−$3.5K) — the biggest drag on total profit.
- **Furniture is a low-margin trap** — it sells ~$742K but earns only ~$18K profit, far below Technology (~$145K) and Office Supplies (~$122K) on similar sales.
- **The West leads; the Central region lags** on profitability.
- **Consumers drive ~half of all sales**, and California + New York alone make up roughly a third of revenue.

## What I did
1. **Cleaned the data in Python** — parsed dates, corrected data types, handled missing values, and engineered time and profit-margin features.
2. **Analysed it in SQL** — wrote 11 queries to break down sales and profit by region, category, segment, and time.
3. **Visualised it in Tableau** — built an interactive dashboard with KPI tiles, a profit-by-sub-category view, regional and category breakdowns, and a time trend, all controlled by a single filter.

## Repository structure
```
superstore-sales-analysis/
├── README.md
├── data/        superstore.csv, superstore_clean.csv
├── notebook/    Superstore_Sales_Cleaning.ipynb
├── sql/         superstore_sql_queries.sql
├── dashboard/   dashboard.png   (+ live Tableau link above)
└── report/      Superstore_Project_Report.md
```

## How to run it
Clone the repo:
```bash
git clone https://github.com/mohakbajaj1-cloud/superstore-sales-analysis.git
```
Then:
1. **Python:** open `notebook/Superstore_Sales_Cleaning.ipynb`, place `superstore.csv` in the same folder, and run all cells. It produces `superstore_clean.csv`.
2. **SQL:** load `superstore_clean.csv` into a PostgreSQL database, then run the queries in `sql/superstore_sql_queries.sql`.
3. **Dashboard:** explore the live version on Tableau Public (link above).

## Dataset
Sample Superstore — a public retail dataset of 9,994 transactions across the United States (2015–2018), covering orders, customers, products, sales, and profit.

---
*Full write-up, including data-cleaning decisions and detailed findings, is in [`report/Superstore_Project_Report.md`](report/Superstore_Project_Report.md).*
