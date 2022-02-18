-- e.g1
SELECT
AVG(Price) AS　平均単価
FROM
Products
;

-- practice1
SELECT
COUNT(CustomerID) AS お得意様数
FROM
Customers;

-- practice2
SELECT
SUM(Weight) AS 社員体重合計
FROM
Employees;

-- practice3
SELECT
MAX(Price) AS 最高額価格
FROM
Products;


-- practice4
SELECT
MIN(Weight) AS 最軽量体重
FROM
Employees;

-- practice5
SELECT
  AVG(Height) AS 平均身長
 ,AVG(Weight) AS 平均体重
FROM
  Employees;
