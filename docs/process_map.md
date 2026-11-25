# Process Maps — Food Supply Chain Sales & Profitability

## AS-IS Process (current state)

```mermaid
flowchart TD
    subgraph Sales["Sales Team"]
        A1[Receive order] --> A2[Apply discount ad hoc]
        A2 --> A3[Send order to operations]
    end
    subgraph Ops["Operations Team"]
        A3 --> B1[Choose ship mode manually]
        B1 --> B2[Ship order]
        B2 --> B3[Record shipping cost]
    end
    subgraph Finance["Finance Analyst"]
        B3 --> C1[Export sales report monthly]
        C1 --> C2[Build spreadsheet manually]
        C2 --> C3[Spot margin issues late]
    end
    subgraph Supply["Supply Chain Manager"]
        C3 --> D1[Review quarterly]
        D1 --> D2[React to problems, no root cause]
    end
```

**Pain points:** ad-hoc discounting, manual ship-mode choice, monthly lag, no category/region view, reactive decisions.

---

## TO-BE Process (future state)

```mermaid
flowchart TD
    subgraph Sales["Sales Team"]
        A1[Receive order] --> A2[Apply discount policy by band]
        A2 --> A3[Send order to operations]
    end
    subgraph Ops["Operations Team"]
        A3 --> B1[Select ship mode by cost rule]
        B1 --> B2[Ship order]
        B2 --> B3[Record shipping cost]
    end
    subgraph Data["Data / Analytics"]
        B3 --> E1[Automated ETL: clean and map categories]
        E1 --> E2[SQL layer computes KPIs]
        E2 --> E3[Dashboard refreshes daily]
    end
    subgraph Finance["Finance Analyst"]
        E3 --> C1[Monitor margin by category and region]
        C1 --> C2[Flag loss-making products]
    end
    subgraph Supply["Supply Chain Manager"]
        C2 --> D1[Weekly review with root cause]
        D1 --> D2[Adjust discount and shipping policy]
        D2 --> A2
    end
```

**Improvements:** discount policy by band, ship-mode cost rule, automated ETL, daily dashboard, weekly root-cause review, feedback loop into pricing.

---

## Gap Analysis

| # | Gap (AS-IS) | Impact | TO-BE Change | Owner |
|---|---|---|---|---|
| 1 | Ad-hoc discounting | Margin erosion | Discount policy by band | Sales Director |
| 2 | Manual ship-mode choice | Higher shipping cost | Cost-based ship-mode rule | Operations Team |
| 3 | Monthly manual reporting | Slow reaction | Automated ETL + daily dashboard | Data / Analytics |
| 4 | No category/region view | Blind spots | Category and province KPIs | Finance Analyst |
| 5 | No loss-making product flag | Hidden losses | Automated flag in dashboard | Finance Analyst |
| 6 | Reactive quarterly review | Missed opportunities | Weekly root-cause review | Supply Chain Manager |
