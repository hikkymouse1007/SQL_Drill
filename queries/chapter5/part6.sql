SELECT
*
FROM
Prefecturals


SELECT
  pre.prefecturalid,
  pre.prefecturalname,
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
JOIN
  Prefecturals as pre
ON
  c.prefecturalid = pre.prefecturalid
GROUP BY
  pre.prefecturalid,
  pre.prefecturalname,
  p.productname
ORDER BY
  pre.prefecturalid,
  pre.prefecturalname,
  p.productname
;

-- -- Sales
-- saleid | quantity | customerid | productid | employeeid | saledate

-- -- Customers
-- customerid | customercode | customername | address | customerclassid | prefecturalid

-- -- Products
-- productid | productcode | productname | price | categoryid

-- -- Prefecturals
-- prefecturalid | prefecturalname

