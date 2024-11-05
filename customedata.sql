SELECT  [CustomerID]
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

