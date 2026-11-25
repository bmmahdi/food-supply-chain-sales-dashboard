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

- Beverages lead profitability with a 14.81% margin on $5.98M sales, while Snacks have a low 2.27% margin on $5.18M sales.
- Perishables have the highest order volume (4,610 lines) and a 13.8% margin, but lower sales of $3.75M.
- Ontario is the top province by sales ($3.06M) and profit ($346.9K) with an 11.32% margin; New Brunswick has the highest margin at 16.86%.
- Discounts above 6% significantly reduce margins: 6-10% discount band yields 7.8% margin vs. 12.6% for no discount, and 20%+ discounts result in negative profit.
- Delivery Truck has the highest average profit per line ($235.29) and a shipping cost of 0.83% of sales, while Express Air has the lowest profit per line ($149.98).
- 553 loss-making products exist, and top products are dominated by Technology and Furniture items with margins above 22%.

**Recommendations**
- Reduce discount levels, especially for Snacks, to improve margins; avoid discounts above 10% as they lead to negative profits.
- Focus marketing and inventory efforts on high-margin categories like Beverages and Perishables, and investigate cost structures for Snacks to improve their 2.27% margin.
- Optimize shipping mode selection: promote Delivery Truck for high-value orders due to higher profit per line, and review Express Air usage for lower-profit items.

<details><summary>🇫🇷 Résumé en français</summary>

Ce projet analyse les données de ventes et de rentabilité pour identifier les catégories de produits et les régions qui génèrent des profits pour un fabricant de produits alimentaires. Le tableau de bord révèle que les boissons et les produits périssables offrent des marges élevées, tandis que les collations sont moins performantes, et que les remises et les modes d'expédition ont un impact significatif sur la rentabilité globale.

- Les boissons sont les plus rentables avec une marge de 14,81% sur 5,98 M$ de ventes, tandis que les collations ont une faible marge de 2,27% sur 5,18 M$ de ventes.
- Les produits périssables ont le plus grand volume de commandes (4 610 lignes) et une marge de 13,8%, mais des ventes plus faibles de 3,75 M$.
- L'Ontario est la province leader en ventes (3,06 M$) et en profit (346,9 K$) avec une marge de 11,32%; le Nouveau-Brunswick a la marge la plus élevée à 16,86%.
- Les remises supérieures à 6% réduisent considérablement les marges : la tranche de remise 6-10% donne une marge de 7,8% contre 12,6% sans remise, et les remises de 20%+ entraînent une perte.
- Le camion de livraison a le profit moyen par ligne le plus élevé (235,29$) et un coût d'expédition de 0,83% des ventes, tandis que le transport aérien express a le profit par ligne le plus faible (149,98$).
- 553 produits sont déficitaires, et les meilleurs produits sont dominés par la technologie et le mobilier avec des marges supérieures à 22%.

</details>

## Dashboard

📊 **Interactive dashboard:** https://bmmahdi.github.io/food-supply-chain-sales-dashboard/

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
