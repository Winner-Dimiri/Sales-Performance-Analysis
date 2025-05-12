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
| CustomerID | Unique identifier for each customer |
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
1. **Data loading and inspection:** Loaded the dataset and inspected its structure for inconsistencies.
2. **Handling missing values:** Checked for missing or null values. I noticed that the dataset provided for this capstone project included sales data across two years (2023 and 2024). However, 2024 only contained data for 8 months (January to August), while 2023 had full-year data. To ensure a fair year-over-year comparison and avoid bias due to unequal time periods, I filtered the 2023 data to include only January to August. This allowed me to accurately analyze trends and performance across consistent timeframes. I considered deleting data, but opted to filter instead, preserving the original dataset for transparency and reproducibility. [View the SQL query here]()
3. **Data Type Conversion:** Converted the data types of Quantity and UnitPrice from SMALLINT to INT to accommodate larger values in the Revenue column.
4. **Column Creation:** Added new columns, including:

	1. Revenue = Quantity * UnitPrice [Click here to view the SQL query]()

	2. OrderMonth (Extracted month from OrderDate) [Click here to view the SQL query]()

	3. OrderYear (Extracted year from OrderDate) [Click here to view the SQL query]()


### Exploratory Data Analysis
- **Univariate Analysis:** initiated the exploratory data analysis (EDA) by calculating the total quantity of products sold and the total revenue generated.. [You can find the SQL query for the Univariate Analysis here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R1-R9)

- **Time-Based Analysis:** Understanding how revenue is generated and how it trends over time is essential for strategic decision-making. This section provides a comprehensive analysis of revenue across monthly, quarterly, and yearly intervals.
	1. [Click here to view the query for Monthly Analysis by year](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
	2. [Click here to view the query for Quarterly Analysis year](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
	3. [Click here to view the query for Yearly Analysis](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R14-R24)


- **Product Analysis:** his section delves into the quantity of products sold and the corresponding revenue generated, offering insights into their variations and trends over the year.
	1. [See the query for the quantity sold and the revenue generated for the products here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)
	2. [See the query for the quantity sold and the revenue generated for the products across the years here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)

	From our analysis, it showed that hat had the highest number of sales with a figure of 80000 units, followed by shoes, shirts and gloves, with figures of 72500, 62500, and 62500 respectively. However, shoes generated the highest revenue, with a total revenue of 3087500, followed by shirt, hat gloves, in order, with revenue of 2450000, 1587500, and 1500000 respectivelly.

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

