SELECT
EmployeeID
,EmployeeName
,年月
販売合計金額
FROM
(
  
);


SELECT
  年月,
  SUM( 販売金額 ) AS 販売合計金額,
FROM
(
  SELECT
    SUBSTR(CAST( SaleDate AS VARCHAR ), 1, 7) AS 年月
    ,s.Quantity * p.Price AS 販売金額
    ,s.EmployeeID as EmployeeID
  FROM
    Sales as s
  JOIN
    Products as p
  ON
    s.productid = p.productid
) AS b
GROUP BY 年月
ORDER BY 年月
;


SELECT
EmployeeID,
EmployeeName
FROM
Employees
;

SELECT
a.EmployeeID,
a.EmployeeName,
b.年月,
SUM( 
  CASE WHEN 販売金額 IS NULL THEN 0
       ELSE 販売金額
  END
) AS 販売合計金額
FROM
Employees as a
LEFT OUTER JOIN
(
  SELECT
    SUBSTR(CAST( SaleDate AS VARCHAR ), 1, 7) AS 年月
    ,s.Quantity * p.Price AS 販売金額
    ,s.EmployeeID as EmployeeID
  FROM
    Sales as s
  JOIN
    Products as p
  ON
    s.productid = p.productid
) as b
ON a.EmployeeID = b.EmployeeID
GROUP BY
a.EmployeeID,
a.EmployeeName,
b.年月
ORDER BY
a.EmployeeID,
a.EmployeeName,
b.年月
;
