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
1. **Data loading and inspection:** Loaded the dataset and inspected its structure for inconsistencies.
2. **Handling Currency:** While inspecting the data, I noticed that the original dataset did not specify the currency of the Unit Prices. To avoid confusion and ensure clarity, especially in multi-regional or international scenarios, I renamed the `UnitPrice` column to `UnitPrice_NGN` to reflect that the values are in Nigerian Naira (₦). This helps to provide clearer insight into the monetary context and prevents potential misinterpretation of financial data. [Click here to view the SQL query]()
3. **Handling missing values:** Checked for missing values. I noticed that the dataset provided for this capstone project included sales data across two years (2023 and 2024). However, 2024 only contained data for 8 months (January to August), while 2023 had full-year data. To ensure a fair year-over-year comparison and avoid bias due to unequal time periods, I filtered the 2023 data to include only January to August. This allowed me to accurately analyze trends and performance across consistent timeframes. While part of this analysis considers the complete sales data for 2023, the primary focus is on the corresponding January–August timeframe to ensure a fair comparison with the available 2024 data. [Click here to view the SQL query]()
4. **Data Type Conversion:** Converted the data types of Quantity and UnitPrice from SMALLINT to INT to accommodate larger values in the Revenue column. [Click here to view the SQL query]()
5. **Column Creation:** for a more efficient and insightful analysis, I introduced additional derived columns, including:

	1. Revenue = Quantity * UnitPrice [Click here to view the SQL query]()

	2. OrderMonth (Extracted month from OrderDate) [Click here to view the SQL query]()

	3. OrderYear (Extracted year from OrderDate) [Click here to view the SQL query]()


### Exploratory Data Analysis (EDA)
- **Univariate Analysis:** I initiated the exploratory data analysis by calculating the total quantity of products sold and total revenue generated from January to August, 2023 and 2024, resulting in 277,500 units sold and ₦8,962,500 in total revenue.
	1. [Click here to view the SQL query for the total quantity sold](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R1-R9)
 	2. [Click here to view the SQL query for the total revenue]()

- **Time-Based Analysis:** Understanding how revenue is generated and how it trends over time is essential for strategic decision-making. This section provides a comprehensive analysis of revenue across yearly, quarterly, and monthly intervals.
	1. The analysis shows that there was a total revenue of 3950000 for 2023 for the sales month January to August, while a total revenue of 5012500 for the corresponding months in 2024, which resulted in a 26.9% increase in revenue.
[Click here to view the query for Yearly Analysis](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R14-R24)
 	2. The quartely revenue analysis shows that during the first quarter in 2023, revenue generated was 1762500, which increased to 2775000 for 2024, which is a 57.45% reveneue increase for the first quarter. For the second quarter, in 2023 was 837500, and 1175000 for 2024, resulting to a 40.3% increase in revenue for the second quarter. Then for the third quarter, in 2023 was 1350000, and in 2024 was 1062500, resulting in a 21.3% decrease in revenue for the third quarter. [Click here to view the query for Quarterly Analysis year](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
  	3. Further Monthly Analysis showed that there was a decrease in revenue in the second quarter, for the month of May, which was a total amount of 300000 for 2023 and a total amount of 225000 for 2024. A more drastic decrease occured in the third quarter, in the month of July, with 2023 revenue been 1200000, and 2024 revenue been 187500. January 2024 has the highest increase in revenue with a revenue of 1000000 against a revenue of 250,000 for January 2023, resulting in an increase of 300%.[Click here to view the query for Monthly Analysis by year](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R26-R45)
	
	


- **Product Analysis:** this section delves into the quantity of products sold and the corresponding revenue generated, offering insights into their variations and trends over the year. Analysis showed that shoes, hat, and shirt are the top selling products according to quantity sold and revenue generated. However, there was a reduction in quantity sold and revenue generated of shirt. It also revealed that, while Shoe and Shirt generated the first two highest revenue, with total revenue as 3087500 and 2450000 respectively, contributing to a 34% and 27% of the total revenue respectively, Hat holds the highest increase in revenue with 2023 revenue as 262500 and 2024 revenue as 1150000, resulting to a 338.1% revenue increase. Socks is the lowest selling product, but there was an increase both in quantity sold and revenue generated from 2023 to 2024. 
	1. [See the query for the quantity sold and the revenue generated for the products here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)
	2. [See the query for the quantity sold and the revenue generated for the products across the years here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R70-R86)

- **Regional Analysis:** To evaluate regional contributions to sales and revenue generation, this section presents a detailed analysis of performance across different regions. It revealed that the South region holds the highest share in both quantity sold and revenue generated, with the quantity sold and revenue generated for 2023 of 45000 units and 1750000, while that of 2024 are 55000 units and 2250000 respectively, leading to a 28.57% increase in revenue. The east region has the lowest score in quantity sold and revenue generated, with quantity sold and revenue generated in 2023 as 47500 units and 1462500 respectively, while in 2024, it was 40000 units and 462500 for quantity sold and revenue generated respectively, which led to a 68% decrease in revenue.
	1. [To view the query of quantity sold and revenue generated across the regions, click here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R108-R121)
	2. [To view the query of quantity sold, average quantity, revenue generated, and the average revenue across the regions for the both years, click here](https://github.com/Winner360/My_first_project/commit/cab5f0b5795d1c3fa58a4aa3eb3130fba9556cea#diff-1141c2a523c288033ac1fa3586afe07776e9195c449c74722b2544a9eb9c6237R123-R142)

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

