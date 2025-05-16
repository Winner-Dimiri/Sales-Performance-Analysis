# Sales Performance Analaysis


---
## Contents

[Project Overview](#project-overview)

[Dataset Summary](#dataset-summary)

[Tools Used](#tools-used)

[Data Cleaning and Preparation](#data-cleaning-and-preparation)

[Exploratory Data Analysis](exploratory-data-analysis)

[Visualizations](visualizations)

[Insights](insights)

[Recommendations](recommendations)

### Project Overview 

- **Project Title:** Sales Performance Analysis For Business Optimization.

- **Project Description:** This project analyzes transactional sales data from 2023 to 2024 to discover patterns, trends, and insights that can improve business performance. The dataset captures details such as what was sold, in which region, to which customer, and at what price and quantity. The analysis will help identify high-performing products, profitable regions, and sales trends over time to inform marketing, inventory, and sales strategies.

- **Business Task:** To optimize business performance by understanding sales trends, product and regional dynamics over a two-year period, thereby enabling strategic decision-making to increase revenue, customer satisfaction, and operational efficiency.

- **Objectives:** The objectives of this project are:
	1. Analyze sales performance across years, regions, and products.
	
 	2. Identify sales seasonality and growth trends between 2023 and 2024.
	 
 	3. Determine top and underperforming products.
	
 	4. Highlight regional strengths and market gaps.
	
 ### Dataset Summary

- **Dataset Structure:** The dataset contains the following data fields, as described below:

| Column      | Description                         |
|-------------|-------------------------------------|
| OrderID     | Unique identifier for each order    |
| CustomerID  | Unique identifier for each customer |
| Product     | Name of the product sold            |
| Region      | Geographical region of the sale     |
| OrderDate   | Date of the transaction             |
| Quantity    | Number of units sold                |

The product categories include Shoes, Hats, Shirts, Gloves, Jackets, and Socks, while the sales regions are East, West, North, and South.

- **Data Source:** the data used for this analysis is the Capstone Project Dataset provided by the Incubator Hub as part of the 2024 Data Analysis Training Program.

### Tools Used

- **Microsoft Excel:** for data cleaning, formatting, and preliminary analysis
- **Structured Query Language (SQL):** for data querying and exploration
- **Tableau:** for data visualization and dashboard creation.
    
### Data Cleaning and Preparation
During the data cleaning and preparation phase, I carried out the following actions:
- **Data loading and inspection:** loaded the dataset and inspected its structure for inconsistencies.
- **Handling Currency:** while inspecting the data, I noticed that the dataset did not specify the currency of the Unit Prices. To avoid confusion and ensure clarity, I renamed the `UnitPrice` column to `UnitPrice_NGN` to reflect that the values are in Nigerian Naira (₦). This is to provide clearer insight into the monetary context and prevent potential misinterpretation of financial data. [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L3-L5)
- **Handling missing values:** checked for missing values. I noticed that the dataset provided for this capstone project included sales data across two years (2023 and 2024). However, 2024 only contained data for 8 months (January to August), while 2023 had full-year data. To ensure a fair year-over-year comparison and avoid bias due to unequal time periods, I filtered the 2023 data to include only January to August. This allowed me to accurately analyze trends and performance across consistent timeframes. While part of this analysis considers the complete sales data for 2023, the primary focus is on the corresponding January–August timeframe to ensure a fair comparison with the available 2024 data. [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L7-L12)
- **Data Type Conversion:** Converted the data types of Quantity and UnitPrice from SMALLINT to INT to accommodate larger values in the Revenue column. [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L16-L21)
- **Column Creation:** for a more efficient and insightful analysis, I introduced additional derived columns, including:

	1. Revenue = Quantity * UnitPrice [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L23-L31)

	2. OrderMonth (Extracted month from OrderDate) [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L33-L37)

	3. OrderYear (Extracted year from OrderDate) [Click here to view the SQL query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L16-L21)


### Exploratory Data Analysis (EDA)
- **Univariate Analysis:** I initiated the exploratory data analysis by calculating the total quantity of products sold and total revenue generated from January to August, 2023 and 2024, resulting in 277,500 units sold and ₦8,962,500 in total revenue.
	1. [Click here to view the SQL query for the total quantity sold](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L47-L50)
 	2. [Click here to view the SQL query for the total revenue](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L47-L50)

- **Time-Based Analysis:** Understanding how sales quantity and revenue trend over time is essential for strategic decision-making. This section provides a comprehensive analysis of sales performance and revenue generation across yearly, quarterly, and monthly intervals.
	1. The yearly revenue analysis indicates a positive growth trend, with increases observed in both sales quantity and total revenue generated as summarized in the table below.

		| Year       | Sales Quantity (Units)            | Generated Revenue (₦)       |
		|------------|-----------------------------------|-----------------------------|
		| 2023       | 127,500                           | 3,950,000                   |
		| 2024       | 150,000                           | 5,012,500                   |
		| **Remark** | **18% Increase in Sales Quantity**| **27% Increase in Revenue** |

		1. [Click here to view the SQL query for Yearly Sales Quantity Analysis](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L57-L70)
		2. [Click here to view the SQL query for Yearly Revenue Analysis](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L72-L82)
  		
 	2. The quarterly analysis reveals growth in both quantity and revenue during Q1 and Q2, with Q1 recording the highest performance. However, Q3 experienced a decline in both metrics. A summary of these trends is presented in the table below.
  
		| Quarter | 2023 Sales Quantity (Units) | 2024 Sales Quantity (Units) | Remark 	    	| 2023 Generated Revenue (₦) | 2024 Generated Revenue (₦) | Remark 	   |
		|---------|-----------------------------|-----------------------------|-----------------|----------------------------|----------------------------|----------------|
		| Q1	  | 55,000			| 72,500     	              | 31.8% Increase  | 1,762,500	             | 2,775,000	          | 57.4% Increase | 
		| Q2	  | 32,500		   	| 47,500		      | 46.2% Increase	| 837,500                    | 1,175,000	          | 40.2% Increase | 
		| Q3	  | 40,000			| 30,000		      | 25% Decrease	| 1,350,000                  | 1,062,500	          | 21.3% Decrease |

		1. [Click here to view the SQL query for the year-wise quarterly Sales Quantity analysis](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L84-L102)
  		2. [Click here to view the SQL query for the year-wise quarterly Revenue analysis.](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L104-L122)
  
  	3. Further monthly analysis revealed a 25% revenue decline in May, dropping from ₦300,000 in 2023 to ₦225,000 in 2024. A more significant drop occurred in July, with revenue dropping from ₦1,200,000 in 2023 to ₦187,500 in 2024—a decrease of 84.4%. Conversely, January 2024 saw the highest increase, with revenue rising by 300%, from ₦250,000 in 2023 to ₦1,000,000.

		[Click here to view the SQL query for the year-wise monthly analysis](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L124-L162)
	
- **Product Analysis:** This section explores the quantity of products sold and the corresponding revenue generated, highlighting trends and variations over the year. The analysis identified shoes, hats, and shirts as the top-selling products by both quantity and revenue. However, shirt sales and revenue declined over time. While shoes and shirts generated the highest revenues; ₦3,087,500 and ₦2,450,000 respectively, contributing 34% and 27% of total revenue, hats recorded the highest growth, increasing from ₦262,500 in 2023 to ₦1,150,000 in 2024, a 338% rise. Socks, though the lowest-selling product, showed growth in both quantity sold and revenue between 2023 and 2024. The trends are shown below.

  |Product | 2023 Sales Quantity (Units) | 2024 Sales Quantity (Units) | Remark 	| 2023 Generated Revenue (₦)  | 2024 Generated Revenue (₦) | Remark 	      |
  |--------|-----------------------------|-----------------------------|----------------|-----------------------------|----------------------------|------------------|
  | Shoes  | 35,000	                 | 37,500	               | 7.1% Increase  | 1,400,000	              | 1687500		           | 20.5% Increase   |
  | Hat	   | 17,500  	                 | 45,000	               | 157% Increase  | 262,500		      | 1150000		           | 338.1% Increase  |
  | Shirt  | 42,500	                 | 20000	               | 53.6% Decrease | 1,450,000	              | 1000000		           | 31% Decrease     |
  | Gloves | 20,000	                 | 30,000	               | 50% Increase   | 500,000		      | 750,000		           | 50% Increase     |
  | Jacket | 5,000	                 | 7,500	               | 33.3% Increase | 300,000		      | 225000		           | 25% Decrease     |
  | Socks  | 7,500  	                 | 10,000	               | 33.3% Increase | 37,500		      | 200,000		           | 433.3% Increase |
  
	1. [Click here to view the SQL query for product-wise quantity sold and revenue generated](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L168-L185)
	2. [Click here for the SQL query showing product sales and revenue across the years](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L188-L210)

- **Regional Analysis:** To evaluate regional contributions to sales and revenue generation, this section provides a detailed performance analysis across different regions. The South region recorded the highest sales and revenue while the East region had the lowest performance. The analysis is summarized below.

  |Region | 2023 Sales Quantity (Units) | 2024 Sales Quantity (Units) | Remark 	       | 2023 Generated Revenue | 2024 Generated Revenue | Remark 	   |
  |-------|-----------------------------|-----------------------------|----------------|------------------------|------------------------|-----------------|
  | South | 45,000	                | 55,000		      | 22.2% Increase | 1,750,000	        | 2,250,000		 | 28.6% Increase  |
  | North | 17,500	                | 27,500		      | 57.1% Increase | 550,000	        | 1,225,000		 | 122.7% Increase |
  | West  | 17,500	                | 27,500		      | 57.1% Increase |187,500	                | 1,075,000		 | 473.3% Increase |
  | East  | 47,500	                | 40,000		      | 15% Decrease   | 1,462,500		| 462,500		 | 68.4% Decrease  |
	  
	1. [Click here to view the SQL query of quantity sold and revenue generated across the regions](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L213-L230)
	2. [Click here to view the SQL query showing the quantity sold, average quantity, revenue generated, and average revenue across regions for both years](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L232-L252)

- **Analysis with the complete 2023 dataset:** This section presents a comprehensive analysis of the quantity sold and revenue generated across 2023 and 2024, with the complete dataset for 2023 (January to December).

	- **The yearly analysis reveals that:** in 2023, a total of 195,000 units were sold, generating a total revenue of ₦5,575,000.

   		[Click here to view the SQL Query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L255-L267)

	- **The quarterly breakdown shows that:**

	1. Q3 recorded a total sales volume of 57,500 units, contributing ₦1,525,000 in revenue.
	2. Q4 saw a decline, with 50,000 units sold and ₦1,450,000 in revenue.

		[Click here to view the SQL Query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L269-L291)

	- **The monthly analysis within Q3 and Q4 further highlights the trends:**

	1. From September to October, sales rose from 17,500 units to 22,500 units, while revenue increased significantly from ₦175,000 to ₦675,000.
	2. However, a downturn occurred in November and December, with sales dropping from 15,000 units to 12,500 units, and revenue declining from ₦525,000 to ₦250,000.

		[Click here to view the SQL Query](https://github.com/Winner360/My_first_project/blob/main/Analysis1.sql#L293-L313)

### Visualizations
- A dashboard illustrating comparative monthly and quarterly revenue trends for 2023 and 2024 (January to August)

![Tableau Dashboard](https://github.com/user-attachments/assets/ec8acb73-d923-4ffc-92f9-dc4cdece5a32)

- [Click for for the full compara




### Insights
- **Time-based Performance**
	- Sales and revenue exhibited a positive year-on-year growth trend, reflecting improved business performance and customer engagement.
	- Q1 delivered the highest performance in both revenue and sales volume, indicating a strong start to the year. In contrast, Q3 experienced a notable decline in both metrics, signaling a potential area for further investigation.
	- February emerged as the top-performing month in revenue and second in quantity sold in 2023. Its performance further improved in 2024.
	- July was the highest in quantity sold and second in revenue in 2023 but dropped drastically in 2024, with an 84.4% decline, making it the second-lowest revenue month.
	- March, April, and May showed the weakest performance, with April recording the lowest revenue and March the lowest sales volume.
	- January 2024 stood out with a 300% growth rate, highlighting a strong beginning and a key opportunity for seasonal strategies.

- **Product Performance**	
	- Shoes, hats, and shirts were the top-selling products by both revenue and quantity. Shoes and shirts generated 34.5% and 27.3% of total revenue, contributing 26.13% and 22.52% of total sales, respectively. However, Shirts experienced a gradual decline in both sales and revenue over time.
	- Hats recorded the highest year-on-year growth with a 338% increase, demonstrating improved marketing.
	- Socks, though the lowest-selling product, 2.65% of revenue and 6.31% of sales, showed an improvement, with a 33.3% increase in sales and a 433.3% increase in revenue between 2023 and 2024.

- **Regional Performance**
	- The South region emerged as the highest-performing region in both sales and revenue generation.
	- The North and West regions recorded significant year-on-year growth across both sales and revenue, suggesting rising market potential or improved distribution efforts.
	- The East region had the lowest performance and experienced a considerable drop in revenue, signaling strategic reevaluation.
- Analysis of the complete 2023 dataset revealed a 4.61% decline in Q4 performance. Additionally, sales and revenue increased from September to October, followed by a decline in both metrics from November to December.

### Recommendations
- Investigate and address the Q3 and July performance dip.
- Leverage the strong performance in Q1 by introducing new product lines in these months.
- Expand marketing efforts and inventory in the West region to harness its evident growth trajectory.
- Expand and optimize sales and distribution in high-performing South and North regions..
- Investigate and revitalize the East region with localized strategies and market research.
- Invest more in hats and socks, which have shown notable growth, to maximize revenue.
- Revivee shirt sales through product innovation, bundle offers, or targeted promotions to reverse the declining trend.




