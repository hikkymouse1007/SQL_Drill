-- e.g1
SELECT
HireFiscalYear AS 入社年度,
SUM(
  CASE 
   WHEN BloodType = 'A' THEN 1
   ELSE 0
  END
) AS A型,
SUM(
  CASE 
   WHEN BloodType = 'B' THEN 1
   ELSE 0
  END
) AS B型,
SUM(
  CASE 
   WHEN BloodType = 'O' THEN 1
   ELSE 0
  END
) AS O型,
SUM(
  CASE 
   WHEN BloodType = 'AB' THEN 1
   ELSE 0
  END
) AS AB型
FROM
Employees
GROUP BY
HireFiscalYear
;

-- practice1
SELECT
HireFiscalYear AS 入社年度,
SUM(
  CASE
    WHEN Height <= 160 THEN 1
    ELSE 0
  End
) AS Heightが160以下 ,
SUM(
  CASE
    WHEN Height <= 170 THEN 1
    ELSE 0
  End
) AS Heightが170以下,
SUM(
  CASE
    WHEN Height <= 180 THEN 1
    ELSE 0
  End
) AS Heightが180以下,
SUM(
  CASE
    WHEN Height> 180 THEN 1
    ELSE 0
  End
) AS Heightが180より大きい
FROM
Employees
GROUP BY
HireFiscalYear;


-- practice2
SELECT
CategoryID AS 商品カテゴリID,
SUM(
  CASE
    WHEN Price < 100 THEN 1
    ELSE 0
  End
) AS Priceが100未満,
SUM(
  CASE
    WHEN Price < 400 THEN 1
    ELSE 0
  End
) AS Priceが400未満,
SUM(
  CASE
    WHEN Price < 1000 THEN 1
    ELSE 0
  End
) AS Priceが1000未満,
SUM(
  CASE
    WHEN Price >=1000 THEN 1
    ELSE 0
  End
) AS Priceが1000以上
FROM
Products
GROUP BY
CategoryID;

-- practice3
SELECT
CustomerID AS 顧客ID,
SUM(
  CASE
    WHEN EXTRACT(month from SaleDate) = 9 THEN 1
    ELSE 0
  End
) AS "9月",
SUM(
  CASE
    WHEN EXTRACT(month from SaleDate) = 10 THEN 1
    ELSE 0
  End
) AS "10月",
SUM(
  CASE
    WHEN EXTRACT(month from SaleDate) = 11 THEN 1
    ELSE 0
  End
) AS "11月"
FROM
Sales
WHERE
EXTRACT(year from SaleDate) = 2006
GROUP BY
CustomerID;

-- practice4
SELECT
PrefecturalID AS 都道府県ID,
SUM(
  CASE
    WHEN CustomerClassID = 1 THEN 1
    ELSE 0
  END
) AS 法人,
SUM(
  CASE
    WHEN CustomerClassID = 2 THEN 1
    ELSE 0
  END
) AS 個人
FROM
Customers
GROUP BY
PrefecturalID
;

-- practice5
SELECT
HireFiscalYear AS 入社年度,
SUM(
  CASE
    WHEN Weight <= 50 THEN 1
    ELSE 0
  End
) AS "50kg以下",
SUM(
  CASE
    WHEN Weight <= 60 THEN 1
    ELSE 0
  End
) AS "60kg以下",
SUM(
  CASE
    WHEN Weight <= 80 THEN 1
    ELSE 0
  End
) AS "80kg以下",
SUM(
  CASE
    WHEN Weight <= 80 THEN 1
    ELSE 0
  End
) AS "80kgより大きい"
FROM
Employees
GROUP BY
HireFiscalYear
;
