# World-Layoffs-Data-Exploration-in-MySQL

**Overview**

This project performs exploratory data analysis (EDA) on a global layoffs dataset using SQL. The dataset was cleaned in a prior project, allowing this analysis to focus on uncovering patterns, trends, and insights rather than fixing data quality issues.

The goal is open-ended exploration. Instead of starting with a fixed hypothesis, the analysis begins with simple questions and gradually builds toward more advanced queries and techniques commonly used in real-world analytics roles.

The dataset spans from early 2020 through early 2023, capturing layoffs during the COVID-19 pandemic and subsequent economic shifts.

**Dataset Description**

The dataset contains company-level layoff events with fields including:
- Company name
- Industry
- Country
- Date of layoff
- Total employees laid off
- Percentage laid off
- Company funding stage
- Funds raised (in millions)
While both total layoffs and percentage laid off are included, most analysis centers on total layoffs, as company size data is not available, limiting the interpretability of percentages.

**Key Questions Explored**
- What are the largest single layoff events on record?
- Which companies have laid off the most employees overall?
- How have layoffs evolved over time?
- Which industries and countries were most impacted?
- How do layoffs differ across company funding stages?
- Which companies led layoffs each year?
- What does cumulative (rolling) layoff growth look like over time?

**Key Insights**

**Overall Layoffs**
- The largest single layoff event involved 12,000 employees.
- Several companies experienced 100% layoffs, indicating complete shutdowns.
- Layoffs affected both early-stage startups and large public companies.

**Company-Level Trends**
- Major companies such as Google, Amazon, Meta, Microsoft, Uber, Salesforce, Dell, Cisco, Peloton, and Twitter appear prominently.
- Post-IPO companies account for the largest share of total layoffs, reflecting large workforce sizes rather than higher relative risk.

**Time Trends**
- Date range: March 2020 to early 2023
- Layoffs by year (approximate totals):
-   2020: ~80,000
-   2021: ~160,000
-   2022: ~247,000+ (worst year)
-   2023: ~125,000 in the first three months alone
- Early 2023 data suggests layoffs were accelerating again.

**Industry & Geography**

Heavily impacted industries:
- Consumer
- Retail

Lower layoff volumes:
- Manufacturing
- Aerospace
- Energy
- Legal

Countries most affected:
- United States (by far the highest)
- India
- Netherlands, Sweden, Brazil, Germany, UK

**Rolling Layoff Analysis**
- Monthly layoffs were aggregated to compute a cumulative rolling total.
- Cumulative layoffs:
-   ~81,000 by end of 2020
-   ~96,000 by end of 2021 (slower growth)
-   ~383,000 by March 2023
- Rolling totals clearly highlight the sharp spike during 2022.

Ranking Companies by Year

Using window functions and multiple CTEs, companies were ranked by total layoffs each year.

Examples:
- 2020: Uber, Booking.com, Groupon, Airbnb
- 2021: ByteDance, Zillow
- 2022: Meta, Amazon, Cisco, Peloton
- 2023: Google, Dell, Microsoft, Amazon, Salesforce

This approach demonstrates how SQL can be used to surface year-over-year leaders in workforce reductions.

**SQL Techniques Used**
- GROUP BY and aggregations
- ORDER BY for ranking and sorting
- Date extraction from timestamps
- Common Table Expressions (CTEs)
- Window functions (DENSE_RANK)
- Rolling cumulative sums
- Multi-step analytical queries

These techniques mirror patterns commonly used in professional analytics and data roles.

**Limitations**
- The percentage laid off is difficult to interpret without company size.
- Summing or averaging percentages across companies can be misleading.
- Some companies lack a funding stage or contextual information.
- Data only includes reported layoffs and may undercount total workforce reductions.

**Future Improvements**
- Integrate company headcount data to contextualize percentages.
- Perform deeper monthly or quarterly time-series analysis.
- Focus on industry-specific or country-specific trends.
- Enrich the dataset with additional company metadata.
- Visualize results using BI tools or Python for storytelling.

**Project Context**
This EDA builds directly on a prior data cleaning project, forming a complete pipeline from raw data to insight generation. Together, they serve as a strong portfolio example demonstrating practical SQL, analytical thinking, and real-world data exploration.
