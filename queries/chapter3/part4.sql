-- e.g1
SELECT
  ProductName AS 商品名
 ,Price * 1.05 AS 税込価格
FROM
  Products;

-- practice1
SELECT
  Amount * 0.15 AS 給与の15％
FROM
  Salary;

-- practice2
SELECT
  Height / 2 AS 身長の半分
FROM
  Employees;
  
-- practice3
SELECT
Weight * 3 - 50 AS 体重の3倍引く50
FROM
Employees;

-- practice4
SELECT
(Price + 100) * 0.3 AS （価格＋100）の30％
FROM
Products;

-- practice5
SELECT
(Quantity + 200) /3 AS （数量＋200）➗3
FROM
Sales;
