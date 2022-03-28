SELECT
CustomerID,
CustomerName,
ProductName,
販売合計金額
FROM
Sales,
Customers,
Products,

-- -- Sales
-- saleid | quantity | customerid | productid | employeeid | saledate

-- -- Customers
-- customerid | customercode | customername | address | customerclassid | prefecturalid

-- -- Products
-- productid | productcode | productname | price | categoryid

SELECT
FROM
(
  SELECT
    c.id AS CustomerID,
    c.CustomerName AS CustomerName
  FROM
    Customers AS c
  JOIN
    ;
)


SELECT
  c.customerid,
  c.customername,
  p.productname,
  SUM(s.Quantity * p.Price) AS 販売金額
FROM
  Sales as s
JOIN
  Products as p
ON
  s.productid = p.productid
JOIN
  Customers as c
ON
  s.customerid = c.customerid
GROUP BY
  c.customerid,
  c.customername,
  p.productname
ORDER BY
  c.customerid,
  c.customername,
  p.productname
;
