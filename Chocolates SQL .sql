SHOW tables;
USE awesome_chocolates;

DESC sales;

SELECT * FROM sales;

SELECT saledate, amount, customers FROM sales;

#ADDING CALCULATED COLUMNS IN SELECT 

 SELECT saledate, amount, boxes, Amount/boxes FROM sales;
 
  SELECT saledate, amount, boxes, Amount/boxes AS 'amount per box' FROM sales;

#FILTERING USING WHERE CLAUSE 

SELECT * FROM sales
WHERE amount >10000 
ORDER BY amount DESC;

#ORDER BY = SORTING DATA 
SELECT * FROM sales 
WHERE geoid = 'g1'
ORDER BY PID, Amount DESC;

SELECT * FROM sales 
WHERE amount > 10000 AND saledate >= '2022-01-01';

SELECT saledate, amount FROM sales 
WHERE amount> 10000 and year(saledate) = 2022
ORDER BY amount DESC;


SELECT saledate, amount FROM sales
WHERE amount > 10000 and year(saledate) = 2021
ORDER BY amount DESC;

SELECT * FROM sales
WHERE boxes> 0 and boxes <=50;

SELECT * FROM sales
WHERE boxes BETWEEN 0 and 50;

SELECT * FROM sales 
WHERE weekday(saledate) = 'Friday';

SELECT saledate, amount, boxes, weekday(saledate) 'DAY OF WEEK' FROM sales
WHERE weekday(saledate) = 4;

SELECT saledate,amount,boxes, weekday(saledate) 'day of week' FROM sales
WHERE weekday(saledate) = 2;

#practice 
SELECT saledate, SUM(boxes), weekday(saledate) 'day of week' FROM sales 
GROUP BY saledate 
HAVING weekday(saledate)= 4;

#USING MULTIPLE TABLES 

#using the OR function as people cannot be in both teams 
SELECT * FROM people 
WHERE team = 'Delish' or team = 'Yummies'; 

#in clause 

SELECT * FROM people 
WHERE team in('delish', 'jucies');

#Pattern Matching 

SELECT * FROM people 
WHERE salesperson LIKE '%B%';

SELECT * FROM people 
WHERE team LIKE 'Yu%';

#case operator 

SELECT * FROM sales

SELECT saledate, amount,
       CASE  WHEN amount < 1000 then 'Under 1k'
			WHEN amount < 5000 then 'Under 5k'
            WHEN amount < 10000 then 'Under 10k'
            ELSE '10k or more'
        END AS "Amount Category"
FROM sales;        


SELECT saledate, amount,
       CASE
            WHEN amount < 1000 THEN 'Under 1k'
            WHEN amount < 5000 THEN 'Under 5k'
            WHEN amount < 10000 THEN 'Under 10k'
            ELSE '10k or more'
        END AS 'Amount Category'
FROM sales;


SELECT spid, customers,
		CASE 
			WHEN customers < 100 THEN 'UNDER 100'
            WHEN customers <200 THEN 'UNDER 200' 
            WHEN customers < 300 THEN 'UNDER 300'
         ELSE '300 or more'
       END AS 'Customers category'
 FROM sales      





