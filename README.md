# Food Supply Chain Sales & Profitability Dashboard

[![Analysis](https://github.com/bmmahdi/food-supply-chain-sales-dashboard/actions/workflows/analysis.yml/badge.svg)](https://github.com/bmmahdi/food-supply-chain-sales-dashboard/actions/workflows/analysis.yml) ![Python](https://img.shields.io/badge/Python-pandas-1f4e79?style=flat-square) ![SQL](https://img.shields.io/badge/SQL-SQLite-1f4e79?style=flat-square) ![Business Analysis](https://img.shields.io/badge/Business-Analysis-1f4e79?style=flat-square)

A business-analytics portfolio project that simulates a Canadian food manufacturer's distribution network using the public Superstore dataset. It answers: **which product categories and regions drive profitability, and where should the manufacturer focus to improve margins and reduce supply chain costs?**

## Business problem

A food manufacturer distributes **Beverages**, **Snacks** and **Perishables** across Canadian provinces through several shipping modes. Management suspects that aggressive discounting and inefficient shipping are eroding margins but has no consolidated view. This project builds the data layer (SQL + Python ETL), the analysis (notebook + charts), the business model (Excel) and the dashboard to support decisions for the Supply Chain Manager, Sales Director, Finance Analyst and Operations Team.

## Dataset

- **Source:** Superstore sales dataset (public sample dataset widely used for analytics training; distributed via Kaggle and Tableau sample data).
- **File:** `data/superstore.csv` — 8,399 order lines, 2010–2012.
- **Fields:** order date, ship mode, sales, discount, profit, unit price, shipping cost, province, region, customer segment, product category, sub-category, product name, product container, base margin.
- **Licence note:** the dataset is public and used here for educational/portfolio purposes only. No proprietary or personal data is included; customer names are part of the public sample.
- **Mapping:** retail `Product Category` is mapped to a food portfolio — Technology → Beverages, Furniture → Snacks, Office Supplies → Perishables.

## Approach

1. **ETL (Python):** load CSV, parse dates, map categories, drop invalid rows, deduplicate, clip discounts, bucket discount bands.
2. **SQL layer:** 5 SQLite queries covering category profitability, regional profitability, discount impact, shipping cost efficiency and top products.
3. **Analysis notebook:** computes KPIs, produces 5 charts, writes `outputs/summary.json` and dashboard data files.
4. **Excel model:** inputs, formula-driven calculations and a summary sheet for what-if scenarios.
5. **Dashboard:** static HTML reading `docs/dashboard.json` and `docs/data/*.json`.
6. **CI:** notebook and SQL run automatically; outputs are checked.

## Repository structure

```
.
├── data/
│   └── superstore.csv
├── sql/
│   ├── 01_category_profitability.sql
│   ├── 02_region_profitability.sql
│   ├── 03_discount_impact.sql
│   ├── 04_ship_mode_cost.sql
│   └── 05_top_products.sql
├── notebooks/
│   └── analysis.py
├── scripts/
│   ├── run_sql.py
│   └── check_outputs.py
├── outputs/
│   ├── charts/
│   ├── sql/
│   └── summary.json
├── docs/
│   ├── index.html
│   ├── dashboard.json
│   ├── data/
│   ├── BRD.md
│   ├── user_stories.md
│   └── process_map.md
├── excel_model.json
├── slides.json
├── requirements.txt
└── README.md
```

## How to run

```bash
# 1. Install dependencies
pip install -r requirements.txt

# 2. Run the SQL layer (creates outputs/sql/*.csv)
python scripts/run_sql.py

# 3. Run the analysis notebook (creates charts, summary.json, docs/data/*.json)
jupyter nbconvert --to notebook --execute notebooks/analysis.py --output analysis.ipynb

# 4. Check outputs
python scripts/check_outputs.py

# 5. Open the dashboard
open docs/index.html
```

## Key findings

_The analysis runs automatically with GitHub Actions; findings appear here when it finishes._

## Dashboard

📊 Dashboard: published with the project.

## Skills demonstrated

- **SQL:** SQLite queries for category, region, discount, shipping and product analysis
- **Python / ETL:** pandas cleaning, category mapping, aggregation, JSON export
- **Data modelling:** KPI definitions, discount bands, food-portfolio mapping
- **Data visualisation:** matplotlib charts and a static HTML dashboard
- **Excel:** formula-driven business model with what-if scenarios
- **Business analysis:** BRD, user stories with Gherkin, AS-IS/TO-BE process maps, gap analysis
- **Stakeholder management:** slide deck and recommendations for four stakeholder groups
- **Problem-solving:** root-cause framing of margin erosion and supply chain cost

## Author

**Mohamed El Mahdi Benchouikh** · [Portfolio](https://bmmahdi.github.io/)
