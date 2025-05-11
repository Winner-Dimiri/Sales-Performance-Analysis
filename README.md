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

### Exploratory Data Analysis
- **Univariate Analysis:** I kicked off the EDA by calculating the total quantity of products sold and the total revenue generated. [You can find the SQL query for the Univariate Analysis here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R1-R9)

- **Time-Based Analysis:** Understanding how revenue is generated and how it trends over time is essential for strategic decision-making. This section provides a comprehensive analysis of revenue across monthly, quarterly, and yearly intervals.
	1. [Click here to view the query for Monthly Analysis by year](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
	2. [Click here to view the query for Quarterly Analysis year](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
	3. [Click here to view the query for Yearly Analysis](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R14-R24)

- **Product Analysis:** his section delves into the quantity of products sold and the corresponding revenue generated, offering insights into their variations and trends over the year.
	1. [See the query for the quantity sold and the revenue generated for the products here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)
	2. [See the query for the quantity sold and the revenue generated for the products across the years here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)

- **Regional Analysis:** To evaluate regional contributions to sales and revenue generation, this section presents a detailed analysis of performance across different regions.
	1. [For the query of quantity sold and revenue generated across the regions, click here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R108-R121)
	2. [For the query of quantity sold, average quantity, revenue generated, and the average revenue across the regions, click here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R123-R142)

- **Customer Analysis:** Customer purchase behavior was analyzed to identify high-value customers. Additionally, an RFM (Recency, Frequency, Monetary) segmentation was conducted to further classify and understand customer value.
	1. [Click here to see the query for customer analysis](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R145-R148)
	2.  [Click here to see the query for RFM segmentation](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R151-R196)


Total Revenue
Quarterly and Yearly Trends
Top 5 Products by Revenue
Top 3 Regions by Revenue

#### Customer Analysis
Recency, Frequency, and Monetary


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

