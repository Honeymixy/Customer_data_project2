# Customer_data_project2


## CAPSTONE PROJECT 2: 
This project involves analyzing customer data for a subscription service to identify key segments and trends. The objective is to gain insights into customer behaviour, track different subscription types, and identify significant patterns in cancellations and renewals. The final deliverable is an interactive Power BI dashboard that visualizes these insights.

### Date source 
The Data source is [LITA Capstone Dataset.xlsx] https://canvas.instructure.com/courses/10186984/files/folder/Capstone%20Project?preview=273182802

###  Tools used
 - Microsoft Excel
- Data cleaning
- Analysis
- visualization
- SQL -Structured query language for querying of data
- GitHub for portfolio building

- ### Data Cleaning and preparation
  1. Data Inspection
  2. Handling missing variables
  3. Data Cleaning and formatting
 

###  Create visualizations for the following captured KPI metrics:

- TASK 1: Total average subscription duration 
- Task 2: Identifying  the most popular subscription types
- Task 3: Retrieving the total number of customers from each region
- Task 4: calculating total revenue by subscription type.
- Task 5: Creating an interactive report
- Task 6: Find the top 3 regions by subscription cancellations.
- Task 7: Find the total number of active and cancelled subscriptions.


## Formular Used
``` SELECT  [CustomerID]
      ,[CustomerName]
      ,[Region]
      ,[SubscriptionType]
      ,[SubscriptionStart]
      ,[SubscriptionEnd]
      ,[Canceled]
      ,[Revenue]
      ,[Status]
      ,[Subscription_Duration]
  FROM [capstone_DB].[dbo].[customerdata]

--- The total number of customers from each region.
SELECT Region, 
       COUNT(CustomerID) AS TotalCustomers
FROM Customerdata
GROUP BY Region;

-------------retrieve the total number of customers from each region.
SELECT SubscriptionType, COUNT(CustomerID) AS total_customers
FROM Customerdata
GROUP BY SubscriptionType
ORDER BY total_customers DESC

--------------find the most popular subscription type by the number of customers.

SELECT TOP 1 [subscriptiontype], COUNT(*) AS total_customers
FROM Customerdata
GROUP BY [subscriptiontype]
ORDER BY total_customers DESC;

----find customers who canceled their subscription within 6 months.
Select customerId from  customerdata
where Status = 'Canceled' and  DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6;  

--------calculate the average subscription duration for all customers.

SELECT 
       AVG(DATEDIFF(DAYOFYEAR, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDurationDays
FROM Customerdata

---  customers with subscriptions longer than 12 months.

SELECT CustomerID, 
       SubscriptionStart, 
       SubscriptionEnd
FROM Customerdata
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) > 12;

---------calculate total revenue by subscription type.
select SubscriptionType, sum(revenue) as TotalRevenue
from customerdata
group by SubscriptionType

------find the top 3 regions by subscription cancellations

Select  top 3 [Region],count (*) as cancellationCount
from customerdata
where Canceled = 'True'
group by Region
order by cancellationCount  desc

------find the total number of active and canceled subscriptions.
select canceled, count(*) AS TotalSubscriptions from customerdata
where Canceled ='true' or canceled ='false'
group by Canceled

```
### Visual Analysis and inference

![image](https://github.com/user-attachments/assets/0ddc910e-e3c5-4835-9e6b-88c0dd7c2fc6)

<img src="https://github.com/user-attachments/assets/34c535b3-30ed-46f5-9c6c-6bd9ad018c3d" alt="customer" width="400" height="280"/> 
<img src="https://github.com/user-attachments/assets/4428563d-131f-4e2f-8a36-b99466317ca5" alt="customer" width="400" height="280"/> 




![image](https://github.com/user-attachments/assets/d993800a-1beb-41ac-9164-eab5fed4c0fd)

## Conclusion
The dashboard analysis reveals critical insights into the subscription service’s customer base, revenue, and subscription dynamics. The service demonstrates a robust performance with a total revenue of 68 million and an average subscription duration of one year. However, the high cancellation rate—nearly 50%—suggests significant room for improvement in customer retention.

The Basic subscription tier is the top revenue generator, indicating that customers are more inclined toward the Basic subscription options. This may present an opportunity to upsell to higher tiers or add value to encourage longer commitment. Regionally, the North experiences higher cancellations(33.39%), highlighting a need for region-specific retention strategies.


