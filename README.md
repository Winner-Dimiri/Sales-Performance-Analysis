# Sales Performance Analaysis


---

[Project Overview](#project-overview)

[Dataset Overview](#dataset-overview)

[Tools Used](#tools-used)

[Data Cleaning and Preparations](#data-cleaning-and-preparations)

[Data Analysis](Data-analysis)

### Project Overview 

- **Project Title:** Sales Performance Analysis (2023–2024): Uncovering Trends and Customer Insights for Strategic Growth

- **Project Description:** This project analyzes transactional sales data from 2023 to 2024 to discover patterns, trends, and insights that can improve business performance. The dataset captures details such as what was sold, in which region, to which customer, and at what price and quantity. The analysis will help identify high-performing products, profitable regions, sales trends over time, and key customer behaviors to inform marketing, inventory, and sales strategies.

- **Business Task:** To optimize business performance by understanding sales trends, customer segments, and regional dynamics over a two-year period, thereby enabling strategic decision-making to increase revenue, customer satisfaction, and operational efficiency.

- **Objectives:** The objectives of this project are:
	1. Analyze sales performance across months, regions, and products.
	
 	2. Identify sales seasonality and growth trends between 2023 and 2024.
	
 	3. Segment customers based on purchase behavior.
	
 	4. Determine top and underperforming products.
	
 	5. Highlight regional strengths and market gaps.
	
 	6. Explore pricing impact on quantity sold.

### Dataset Overview

- **Dataset Structure:** The dataset contains the following data fields, as described below:

| Column      | Description                         |
|-------------|-------------------------------------|
| OrderID     | Unique identifier for each order    |
| CustomerID  | Unique identifier for each customer |
| Product     | Name of the product sold            |
| Region      | Geographical region of the sale     |
| OrderDate   | Date of the transaction             |
| Quantity    | Number of units sold                |

- **Data Source:** the data used for this analysis is the Capstone Project Dataset provided by the Incubator Hub as part of the 2024 Data Analysis Training Program.

### Tools Used

- **Microsoft Excel:** for data cleaning, formatting, and preliminary analysis
- **Structured Query Language (SQL):** For data querying and exploration
- **Tableau:** Used for data visualization and dashboard creation.
    
### Data Cleaning and Preparation
During the data cleaning and preparation phase, I carried out the following actions:
- **Data loading and inspection:** Loaded the dataset and inspected its structure for inconsistencies.
- **Handling Currency:** While inspecting the data, I noticed that the original dataset did not specify the currency of the Unit Prices. To avoid confusion and ensure clarity, especially in multi-regional or international scenarios, I renamed the `UnitPrice` column to `UnitPrice_NGN` to reflect that the values are in Nigerian Naira (₦). This helps to provide clearer insight into the monetary context and prevents potential misinterpretation of financial data. [Click here to view the SQL query]()
- **Handling missing values:** Checked for missing values. I noticed that the dataset provided for this capstone project included sales data across two years (2023 and 2024). However, 2024 only contained data for 8 months (January to August), while 2023 had full-year data. To ensure a fair year-over-year comparison and avoid bias due to unequal time periods, I filtered the 2023 data to include only January to August. This allowed me to accurately analyze trends and performance across consistent timeframes. While part of this analysis considers the complete sales data for 2023, the primary focus is on the corresponding January–August timeframe to ensure a fair comparison with the available 2024 data. [Click here to view the SQL query]()
- **Data Type Conversion:** Converted the data types of Quantity and UnitPrice from SMALLINT to INT to accommodate larger values in the Revenue column. [Click here to view the SQL query]()
- **Column Creation:** for a more efficient and insightful analysis, I introduced additional derived columns, including:

	1. Revenue = Quantity * UnitPrice [Click here to view the SQL query]()

	2. OrderMonth (Extracted month from OrderDate) [Click here to view the SQL query]()

	3. OrderYear (Extracted year from OrderDate) [Click here to view the SQL query]()


### Exploratory Data Analysis (EDA)
- **Univariate Analysis:** I initiated the exploratory data analysis by calculating the total quantity of products sold and total revenue generated from January to August, 2023 and 2024, resulting in 277,500 units sold and ₦8,962,500 in total revenue.
	1. [Click here to view the SQL query for the total quantity sold](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R1-R9)
 	2. [Click here to view the SQL query for the total revenue]()

- **Time-Based Analysis:** Understanding how revenue is generated and how it trends over time is essential for strategic decision-making. This section provides a comprehensive analysis of revenue across yearly, quarterly, and monthly intervals.
	1. The yearly revenue analysis revealed a total revenue of ₦3,950,000 from January to August 2023, compared to ₦5,012,500 during the same period in 2024—reflecting a 26.9% increase in revenue.
[Click here to view the SQL query for Yearly Analysis](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R14-R24)
 	2. Quarterly revenue analysis shows a 58% increase in Q1 revenue, rising from ₦1,762,500 in 2023 to ₦2,775,000 in 2024. Q2 revenue also grew by 40.3%, from ₦837,500 to ₦1,175,000. However, Q3 saw a decline of 21.3%, dropping from ₦1,350,000 in 2023 to ₦1,062,500 in 2024. Overall, Q1 recorded the highest revenue growth. [Click here to view the SQL query for the year-wise quarterly analysis.](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
  	3. Further monthly analysis revealed a 25% revenue decline in May, dropping from ₦300,000 in 2023 to ₦225,000 in 2024. A more significant drop occurred in July, with revenue dropping from ₦1,200,000 in 2023 to ₦187,500 in 2024—a decrease of 84.4%. Conversely, January 2024 saw the highest increase, with revenue rising by 300%, from ₦250,000 in 2023 to ₦1,000,000. [Click here to view the SQL query for the year-wise monthly analysis](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
	
- **Product Analysis:** This section explores the quantity of products sold and the corresponding revenue generated, highlighting trends and variations over the year. The analysis identified shoes, hats, and shirts as the top-selling products by both quantity and revenue. However, shirt sales and revenue declined over time. While shoes and shirts generated the highest revenues; ₦3,087,500 and ₦2,450,000 respectively—contributing 34% and 27% of total revenue, hats recorded the highest growth, increasing from ₦262,500 in 2023 to ₦1,150,000 in 2024, a 338% rise. Socks, though the lowest-selling product, showed growth in both quantity sold and revenue between 2023 and 2024.
	1. [Click here to view the query for product-wise quantity sold and revenue generated](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)
	2. [Click here for the SQL query showing product sales and revenue across the years](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)

- **Regional Analysis:** To evaluate regional contributions to sales and revenue generation, this section provides a detailed performance analysis across different regions. The South region recorded the highest sales and revenue, with 45,000 units and ₦1,750,000 in 2023, increasing to 55,000 units and ₦2,250,000 in 2024—a 28.57% revenue growth. In contrast, the East region had the lowest performance, with a decline from 47,500 units and ₦1,462,500 in 2023 to 40,000 units and ₦462,500 in 2024, resulting in a 68% drop in revenue.
	1. [Click here to view the SQL query of quantity sold and revenue generated across the regions](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R108-R121)
	2. [Click here to view the SQL query showing the quantity sold, average quantity, revenue generated, and average revenue across regions for both years](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R123-R142)

- **Customer Analysis:** Customer purchase behavior was analyzed to identify high-value customers. Additionally, an RFM (Recency, Frequency, Monetary) segmentation was conducted to further classify and understand customer value.
	1. [Click here to see the query for customer analysis](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R145-R148)
	2.  [Click here to see the query for RFM segmentation](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R151-R196)


Total Revenue
Quarterly and Yearly Trends
Top 5 Products by Revenue
Top 3 Regions by Revenue

#### Recommendation
From the analysis, January has the highest sales, therefore more inventory should be stocked to increase sales.


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

