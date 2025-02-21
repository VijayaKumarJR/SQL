create  database study;
use study;
select * from  shopping_trends;
ALTER TABLE shopping_trends
CHANGE COLUMN `Customer ID` Customer_ID INT;
ALTER TABLE shopping_trends
CHANGE COLUMN `Purchase_AMT_(USD)` `Purchase_AMT` INT;
ALTER TABLE shopping_trends
CHANGE COLUMN `Previous Purchases` `Previous_Purchases` INT;
ALTER TABLE shopping_trends
CHANGE COLUMN `Frequency of Purchases` `Frequency` varchar(100);
ALTER TABLE shopping_trends
CHANGE COLUMN `Item Purchased` `Item_Purchased` varchar(100);
ALTER TABLE shopping_trends
CHANGE COLUMN `Shipping Type` `Shipping_Type` varchar(100);
ALTER TABLE shopping_trends
CHANGE COLUMN `Payment Method` `Payment_Method` varchar(100);
Select Customer_ID,purchase_AMT,Age,Location
from shopping_trends
where Purchase_AMT IN (select max(purchase_AMT) from shopping_trends);
Select count(Customer_ID) as Customer_ID,Location
from shopping_trends
where Purchase_AMT IN (select max(purchase_AMT) from shopping_trends)
group by Location;
Select Customer_ID,purchase_AMT,Age,Location
from shopping_trends
where Purchase_AMT IN (select min(purchase_AMT) from shopping_trends);
Select count(Customer_ID) as Customer_ID,Location
from shopping_trends
where Purchase_AMT IN (select min(purchase_AMT) from shopping_trends)
group by Location;
Select Distinct Category
from shopping_trends
where Purchase_AMT IN (select max(purchase_AMT) from shopping_trends);
Select Distinct Season
from shopping_trends
where Purchase_AMT IN (select max(purchase_AMT) from shopping_trends)
order by season desc;
Select Distinct Season
from shopping_trends
where Purchase_AMT IN (select min(purchase_AMT) from shopping_trends)
order by Season ;
Select Distinct Category
from shopping_trends
where Purchase_AMT IN (select min(purchase_AMT) from shopping_trends);
select* from shopping_trends;
select distinct color,COUNT(Color) as Count 
from shopping_trends
group by Color;
SELECT  Location, color,COUNT(*) AS color_count,Size
FROM shopping_trends
GROUP BY  Location,color,Size
order by Location;
SELECT season, COUNT(Purchase_AMT) as Max_Purchase_Count 
FROM shopping_trends
WHERE Purchase_AMT = (SELECT MAX(Purchase_AMT) FROM shopping_trends)
GROUP BY season
ORDER BY season;
Select Gender ,Count(Gender) as Count
from shopping_trends 
where Frequency IN (select frequency from shopping_trends where frequency = 'Weekly')
group by gender;
Select Location, Gender ,Count(Gender) as Count
from shopping_trends 
where Frequency IN (select frequency from shopping_trends where frequency = 'Weekly')
group by gender,Location;
Select Gender ,Count(Gender) as Count
from shopping_trends 
where Frequency IN (select frequency from shopping_trends where frequency = 'Monthly')
group by gender;
Select Location, Gender ,Count(Gender) as Count
from shopping_trends 
where Frequency IN (select frequency from shopping_trends where frequency = 'Monthly')
group by gender,Location;
Select Gender ,Count(Gender) as Count
from shopping_trends 
where Frequency IN (select frequency from shopping_trends where frequency = 'Annually')
group by gender;
Select Location, Gender ,Count(Gender) as Count
from shopping_trends 
where Frequency IN (select frequency from shopping_trends where frequency = 'Annually')
group by gender,Location;
SELECT Customer_ID, Gender, Item_Purchased, Frequency,Color,Location
FROM shopping_trends
WHERE Purchase_AMT IN (
    (SELECT MAX(Purchase_AMT) FROM shopping_trends)
)
AND season = 'Winter' and Previous_Purchases>20;
SELECT Customer_ID, Gender, Item_Purchased, Frequency,Color,Location
FROM shopping_trends
WHERE Purchase_AMT IN (
    (SELECT MIN(Purchase_AMT) FROM shopping_trends)
)
AND season = 'Winter' and Previous_Purchases>20;
SELECT Customer_ID, Item_Purchased, Frequency,Color,Location
FROM shopping_trends
WHERE Purchase_AMT IN (
    (SELECT MAX(Purchase_AMT) FROM shopping_trends)
)
AND Gender = 'Male' and Previous_Purchases>20 and purchase_AMT > 50 
And Season= 'Summer' and Age between 30 and 60;
SELECT Customer_ID, Item_Purchased, Frequency,Color,Location
FROM shopping_trends
WHERE Purchase_AMT IN (
    (SELECT MAX(Purchase_AMT) FROM shopping_trends )
)
AND Gender = 'Female' and Previous_Purchases>20 and purchase_AMT > 50 
And Season = 'Summer' and Age between 30 and 60;
SELECT Customer_ID, Item_Purchased, Frequency,Color,Location
FROM shopping_trends
WHERE Purchase_AMT IN (
    (SELECT MAX(Purchase_AMT) FROM shopping_trends )
)
AND Gender = 'Female' and Previous_Purchases>20 and purchase_AMT > 50 
And season = 'Fall' and Age between 16 and 30 ;


