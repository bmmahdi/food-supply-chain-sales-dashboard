# User Stories — Food Supply Chain Sales & Profitability Dashboard

Priorities use MoSCoW (Must / Should / Could / Won't).

---

## US-01 — Category profitability view
**As a** Sales Director **I want** to see sales, profit and margin by food category **so that** I can prioritise the most profitable product lines.
**Priority:** Must

```gherkin
Given the cleaned dataset is loaded
When I open the dashboard
Then I see a bar chart of sales and profit for Beverages, Snacks and Perishables
And each category shows its profit margin percentage
```

## US-02 — Regional profitability
**As a** Supply Chain Manager **I want** to see profit by Canadian province **so that** I can focus distribution investment where margins are strongest.
**Priority:** Must

```gherkin
Given the cleaned dataset is loaded
When I view the regional chart
Then I see the top 10 provinces ranked by total profit
And each province shows its profit margin
```

## US-03 — Discount impact
**As a** Finance Analyst **I want** to see profit margin by discount band **so that** I can recommend a discount policy that protects margin.
**Priority:** Must

```gherkin
Given orders are bucketed into discount bands
When I view the discount chart
Then I see profit margin for each band from 0% to 20%+
And the trend shows margin declining as discount increases
```

## US-04 — Shipping cost efficiency
**As an** Operations Team member **I want** to compare shipping modes on cost as a share of sales **so that** I can reduce supply chain costs.
**Priority:** Must

```gherkin
Given shipping cost and sales are aggregated by ship mode
When I view the shipping chart
Then I see shipping cost as a percentage of sales for each mode
And the most expensive mode is clearly identifiable
```

## US-05 — Top products by profit
**As a** Sales Director **I want** to see the top 5 products by profit **so that** I can protect and promote my best performers.
**Priority:** Should

```gherkin
Given products are aggregated by total profit
When I view the top products chart
Then I see the 5 products with the highest total profit
And their names are readable on the chart
```

## US-06 — Loss-making product flag
**As a** Finance Analyst **I want** a count of loss-making products **so that** I can trigger a pricing or assortment review.
**Priority:** Should

```gherkin
Given products are aggregated by total profit
When I view the KPI summary
Then I see the number of products with negative total profit
```

## US-07 — Year-over-year sales growth
**As a** Supply Chain Manager **I want** to see sales growth year over year **so that** I can assess whether the business is expanding.
**Priority:** Should

```gherkin
Given order dates are parsed into years
When I view the KPI cards
Then I see the YoY sales growth percentage
```

## US-08 — Reusable SQL layer
**As a** Data Analyst **I want** SQL queries that reproduce the dashboard metrics **so that** I can validate numbers and reuse them in other tools.
**Priority:** Must

```gherkin
Given the SQLite database is loaded from the CSV
When I run the SQL scripts in order
Then each query returns a result set
And results are saved to outputs/sql/
```

## US-09 — Excel business model
**As a** Finance Analyst **I want** an Excel model with inputs, formulas and a summary **so that** I can run what-if scenarios on discount and margin.
**Priority:** Could

```gherkin
Given the Excel model is generated
When I open it
Then I see input sheets, formula-driven calculations and a summary sheet
```

## US-10 — Stakeholder presentation
**As a** Supply Chain Manager **I want** a short slide deck summarising findings and recommendations **so that** I can present to leadership.
**Priority:** Should

```gherkin
Given the analysis is complete
When I open the slide deck
Then I see problem, data, method, findings, recommendations and next steps
```

## US-11 — Automated refresh
**As a** Data Engineer **I want** the pipeline to run in CI **so that** the dashboard stays current without manual work.
**Priority:** Could

```gherkin
Given a new commit is pushed
When CI runs
Then the notebook executes, charts and JSON files are regenerated
And the build fails if any output is missing
```

## US-12 — Data quality log
**As a** Data Analyst **I want** the notebook to report how many rows were dropped during cleaning **so that** I can trust the data.
**Priority:** Could

```gherkin
Given the raw dataset is loaded
When cleaning runs
Then the notebook prints the number of dropped rows and the clean shape
```
