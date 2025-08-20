SELECT * FROM zepto ;

--1.Differen product categores 

SELECT DISTINCT category 
FROM zepto 
ORDER BY category ;


--2.product in stock vs out of stokc 


SELECT outofstock, COUNT(sku_id) 
FROM zepto
GROUP BY outofstock;



--3.Product name present multiple times.

SELECT name,COUNT(sku_id) as present
FROM zepto
GROUP BY name
HAVING COUNT(sku_id)>1
ORDER BY COUNT (sku_id) DESC ;

--4.Product with price = 0 


SELECT * FROM zepto
WHERE mrp = 0 ;

DELETE FROM zepto
WHERE mrp = 0 

--5.Count paise to rupese...

UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice /100.0 ;

SELECT mrp,discountedsellingprice FROM
zepto;


--6.Find the top 10 best value products based on the discouted percentage.

SELECT DISTINCT name, mrp, discountedsellingprice FROM zepto
ORDER  BY discountedsellingprice
LIMIT 10 ;

--7.What are the product with high mrp but out of stock.

SELECT DISTINCT name,mrp
FROM zepto
WHERE outofstock = true and mrp > 4
ORDER BY mrp DESC;

--8.calcualte estimate revenue for ecah category.


SELECT  category,
SUM(discountedsellingprice * availablequantity) as total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue ;


-- 9.Find al products where mrp is freater than 500 and discount is less than 10% .

SELECT DISTINCT name, mrp, discountpercent
FROM zepto
WHERE mrp > 5 AND discountpercent <10
ORDER BY mrp DESC,discountpercent DESC;




-- 10. Identify the top 5 categores offering the highest average discount percentage.

SELECT category,
ROUND(AVG(discountpercent),2) AS  avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5 ;

-- 11. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightingms,discountedsellingprice,
ROUND(discountedsellingprice / weightingms , 2) as pricepergram
FROM zepto
WHERE weightingms >= 100
ORDER BY pricepergram ;





--12.Group the product into categores like low,medium, bulk.

SELECT DISTINCT name,weightingms,
CASE WHEN weightingms < 1000 THEN 'low'
     WHEN weightingms <5000 THEN 'medium'
	 ELSE 'Bulk'
	 END AS weight_category 
FROM zepto ;


--13. What is the total inventory weight per category 

SELECT category,
SUM(weightingms * availablequantity) as total
FROM zepto
GROUP BY category
ORDER BY total ;







