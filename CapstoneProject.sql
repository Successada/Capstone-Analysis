create database Capstone
use Capstone
select * from CapstoneProject

--1. Which Region raked in the most Revenue?
select top 1 Region,sum(Total_Revenue) as Revenue from CapstoneProject
group by Region
order by Revenue desc

--2. Who are the top five and bottom five Countries, based on profit?
--Top five countries based on profit
select top 5 Country,sum(Total_Profit) as Profit from CapstoneProject
group by Country
order by Profit desc

--Bottom five countries based on profit
select top 5 Country,sum(Total_Profit) as Profit from CapstoneProject
group by Country
order by Profit asc

--3.Compare the total cost of Baby Food items purchased by Africans and
--Europeans.
select Region,sum(Total_Cost) as cost from CapstoneProject
where Item_Type='Baby Food' and  Region ='Europe' or Region like '%Africa%'
group  by Region

--4. How many units of office supplies was sold to the Czech Republic?
select Item_Type,sum(Units_Sold) as price from CapstoneProject
where Item_Type ='Office Supplies'
group by Item_Type

--5.Which Country brought in the most Revenue between 2011 -2015?
select top 1 Country,sum(Total_Revenue) as Revenue from CapstoneProject
where Order_Date between '2011-01-31' and '2015-12-31'
group by Country
order by Revenue desc

--6.Which Region was the most profitable in 2015?
select top 1 Region,sum(Total_Profit) as profit from CapstoneProject
where Order_Date between '2015-01-31' and '2015-12-31'
group by Region
order by profit desc

--7.Which Country ordered the most item and what item did they order the most?
select top 1 Country,Item_Type,sum(Units_Sold) as price from CapstoneProject
group  by Country,Item_Type
order by price desc

--8.Which Region, and in turn Country was the least profitable through the Online
--Sales Channel?
select top 1 Region,Country,sum(Total_Profit) as price from CapstoneProject
where Sales_Channel='Online'
group by Region,Country
order by price asc

--9.From which Asian Country did we get the most Profit in the Beverages item
--type?
select top 1 Country,sum(Total_Profit) as Profit from CapstoneProject
where Item_Type='Beverages' and Region='Asia'
group by Country
order by Profit desc

--10.Compare the units of Fruits sold to Nigeria to the units of Snacks sold.
SELECT
  Country,
  SUM(CASE WHEN Item_Type = 'Fruits' THEN Units_Sold ELSE 0 END) AS Fruits_Sold,
  SUM(CASE WHEN Item_Type = 'Snacks' THEN Units_Sold ELSE 0 END) AS Snacks_Sold
FROM 
  CapstoneProject
WHERE
  Country = 'Nigeria'
GROUP BY
  Country;

