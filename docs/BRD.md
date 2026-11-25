# Business Requirements Document (BRD)
## Food Supply Chain Sales & Profitability Dashboard

**Version:** 1.0
**Status:** Approved for build
**Owner:** Supply Chain Manager
**Author:** Business Analyst

---

## 1. Context

A Canadian food manufacturer distributes three product lines — **Beverages**, **Snacks** and **Perishables** — across Canadian provinces through multiple shipping modes. Management suspects that aggressive discounting and inefficient shipping are eroding margins, but has no consolidated view of profitability by category, region or product.

The company has a retail sales dataset (Superstore) that is being used as a proxy for its distribution network. The retail `Product Category` is mapped to the food portfolio:

| Retail Category | Food Portfolio |
|---|---|
| Technology | Beverages |
| Furniture | Snacks |
| Office Supplies | Perishables |

## 2. Objectives

1. Quantify sales, profit and margin by food category and province.
2. Measure the impact of discounting on profitability.
3. Compare shipping modes on cost efficiency.
4. Identify the top products by profit and flag loss-making products.
5. Deliver a self-service dashboard and a SQL/Python data layer that stakeholders can trust and reuse.

## 3. Scope

### In scope
- Analysis of the Superstore dataset (8,399 order lines, 2010–2012).
- Category mapping to a food portfolio.
- KPIs: Total Sales, Profit Margin %, Average Discount %, Sales Growth YoY, Profit per Region, Top 5 Products by Profit.
- SQL transformation layer (5 queries), Python ETL notebook, Excel model, dashboard data files.
- Static HTML dashboard reading `docs/dashboard.json` and `docs/data/*.json`.

### Out of scope
- Real-time data feeds or live ERP integration.
- Forecasting beyond simple YoY growth.
- Customer-level segmentation or marketing attribution.
- Currency conversion (all figures in CAD).

## 4. Stakeholders

| Stakeholder | Role | Interest |
|---|---|---|
| Supply Chain Manager | Sponsor | Margin improvement, shipping efficiency |
| Sales Director | Decision maker | Category and regional performance |
| Finance Analyst | Data consumer | Profitability validation, discount policy |
| Operations Team | Data consumer | Shipping mode cost, product-level issues |

## 5. Business Requirements

- **BR-01** The solution shall report total sales, total profit and profit margin by food category.
- **BR-02** The solution shall report profit and margin by Canadian province.
- **BR-03** The solution shall quantify the relationship between discount level and profit margin.
- **BR-04** The solution shall compare shipping modes on shipping cost as a percentage of sales.
- **BR-05** The solution shall identify the top 5 products by profit and count loss-making products.
- **BR-06** The solution shall report year-over-year sales growth.
- **BR-07** The solution shall expose all KPIs in a single dashboard for stakeholders.

## 6. Functional Requirements

- **FR-01** The system shall load `data/superstore.csv` and parse order and ship dates.
- **FR-02** The system shall map retail categories to the food portfolio (Beverages, Snacks, Perishables, Other).
- **FR-03** The system shall clean data: drop rows missing sales/profit/date, remove duplicate Row IDs, clip discounts to 0–1.
- **FR-04** The system shall execute 5 SQL queries against a SQLite database and export results to `outputs/sql/`.
- **FR-05** The system shall produce 5 charts in `outputs/charts/`.
- **FR-06** The system shall write a flat `outputs/summary.json` with rounded KPIs.
- **FR-07** The system shall write dashboard data files to `docs/data/*.json` as lists of records.
- **FR-08** The dashboard shall render KPI cards and 5 charts from `docs/dashboard.json`.
- **FR-09** The Excel model shall contain inputs, formulas and a summary sheet.
- **FR-10** The solution shall run end-to-end in CI without manual steps.

## 7. KPIs

| KPI | Definition | Target |
|---|---|---|
| Total Sales | Sum of Sales | Baseline |
| Profit Margin % | Total Profit / Total Sales × 100 | ≥ 12% |
| Average Discount % | Mean of Discount × 100 | ≤ 8% |
| Sales Growth YoY | (Latest year / Prior year − 1) × 100 | ≥ 5% |
| Profit per Region | Sum of Profit by Province | Positive in top 10 |
| Top 5 Products by Profit | Ranked by total profit | Stable set |

## 8. Assumptions

- The Superstore dataset is a valid proxy for the manufacturer's distribution network.
- The category mapping (Technology→Beverages, Furniture→Snacks, Office Supplies→Perishables) is accepted by stakeholders.
- All monetary values are in CAD.
- Discounts are expressed as fractions (0–1) in the source data.

## 9. Risks

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Category mapping is challenged by stakeholders | Medium | Medium | Document mapping; validate in review |
| Data quality issues (duplicates, missing values) | Medium | High | Cleaning rules in FR-03; log dropped rows |
| Discount outliers distort margin analysis | Low | Medium | Clip discounts to 0–1; use bands |
| Dashboard data files drift from notebook | Low | High | Notebook is single source; CI regenerates |
| Small sample per province | Medium | Low | Report top 10; note sample sizes |
