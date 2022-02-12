-- e.g1
-- practice1
-- practice2
-- practice3
-- practice4
-- practice5

-- e.g1
SELECT
  ProductName AS 商品名
 ,Price AS 単価
FROM
  Products
;

-- practice1
SELECT
  EmployeeName AS 社員名
FROM
  Employees
;

-- practice2
SELECT
  CustomerCode AS 顧客コード
 ,CustomerName AS 顧客名
FROM
Customers
;

-- practice3
SELECT
  ProductCode AS 商品コード
 ,ProductName AS 商品名
 ,Price AS 価格
FROM
Products;

-- practice4
SELECT
  CustomerName AS 顧客名
 ,CustomerName AS 得意先名
FROM
Customers;

-- practice5
SELECT
  EmployeeName AS 社員名
 ,Email AS メールアドレス
 ,Email AS 連絡先
FROM
  Employees
;
