# Sales Analysis Data


---

[Project Overview](#project-overview)

[Data Source](#data-source)

[Tools Used](#tools-used)

[Data Cleaning and Preparations](#data-cleaning-and-preparations)

[Data Analysis](Data-analysis)

### Project Overview 
**Project Title:** Sales Performance Analysis
This project aims to analyze product sales across different regions and customers in order to identify:
- Top-selling products and regions
- Underperforming areas
- Customer purchasing patterns
- Revenue trends over time

**Business Task:** Improving Sales Performance and Customer Retention through Regional and Product Insights

### Data Source
Capstone project dataset provided by Incubator Hub as part of the 2024 Data Analysis Training Program.

### Tools Used
- Microsoft Excel: Data cleaning, formatting, and preliminary analysis
- SQL: Data querying and exploration
- Tableau: Data visualization and dashboard creation.
    
### Data Cleaning and Preparations
In the initial phase of the Data cleaning and preparations, I performed the following actions;
1. Data loading and inspection
2. Checking for missing values
3. Changed the data type of Quantity and UnitPrice from SMALLINT to INT to accommodate the larger values in the Revenue column to be added.
4. Created new columns; Revenue = Quantity * UnitPrice, OrderMonth, OrderYear
   ``` sql
   ALTER TABLE [dbo].[LITA_Capstone]
	ADD Revenue tinyint
   UPDATE [dbo].[LITA_Capstone]
	SET Revenue = Quantity * UnitPrice

   ALTER TABLE [dbo].[LITA_Capstone]
    ADD OrderYear int
   UPDATE [dbo].[LITA_Capstone]
    SET OrderYear = YEAR(OrderDate)

   ALTER TABLE [dbo].[LITA_Capstone]
    ADD OrderMonth int
   UPDATE [dbo].[LITA_Capstone]
    SET OrderMonth = Month(OrderDate)

### Data Analysis

#### Sales Performance Analysis
Total Revenue
### Data Analysis
This is where we include some basic lines of code or queries or even some of the DAX expressions used during your analysis;
```SQL
SELECT * FROM TABLE 1
WHERE CONDITION = TRUE
```
### Data Visualization

| Heading 1 | Heading 2 | Heading 3|
|-----------|---------|----------|
|Table 1|Table 2|Table 3|

