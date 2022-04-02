-- -- Sales
-- saleid | quantity | customerid | productid | employeeid | saledate

-- -- Customers
-- customerid | customercode | customername | address | customerclassid | prefecturalid

-- -- Products
-- productid | productcode | productname | price | categoryid

-- -- Prefecturals
-- prefecturalid | prefecturalname

-- -- employees
-- employeeid | employeename | height | email | weight | hirefiscalyear | birthday | bloodtype

-- -- departments
-- departmentid | departmentname

-- -- salary
-- salaryid |  paydate   | amount | employeeid

-- -- belongTo
-- belongid | startdate | enddate | departmentid | employeeid

SELECT
  d.DepartmentID
, d.DepartmentName
, 年月
, AVG( Amount ) AS 平均給与 FROM
(
  SELECT
    EmployeeID
  , PayDate
  , SUBSTR(CAST( PayDate AS VARCHAR ), 1, 7)
  AS 年月
  , Amount
  FROM
    Salary
  WHERE
    SUBSTR(CAST( PayDate AS VARCHAR ), 1, 4) = '2007'
) AS s
JOIN
  BelongTo AS b
ON s.EmployeeID = b.EmployeeID
  AND s.PayDate >= b.StartDate
  AND s.PayDate <
    (
      CASE
        WHEN b.EndDate IS NULL THEN '9999-12-31'
        ELSE b.EndDate
      END
    )
JOIN
  Departments AS d
ON
  b.DepartmentID = d.DepartmentID
GROUP BY
  d.DepartmentID
, d.DepartmentName , 年月
ORDER BY
  d.DepartmentID
, d.DepartmentName , 年月
;


-- 解説

-- STEP1 --
SELECT
    EmployeeID
  , PayDate
  , SUBSTR(CAST( PayDate AS VARCHAR ), 1, 7)
  AS 年月
  , Amount
  FROM
    Salary
  WHERE
    SUBSTR(CAST( PayDate AS VARCHAR ), 1, 4) = '2007';

-- employeeid |  paydate   |  年月   | amount
-- ------------+------------+---------+--------
--           4 | 2007-01-23 | 2007-01 | 380000
--           5 | 2007-01-23 | 2007-01 | 350000


-- STEP2 --
SELECT
年月
, AVG( Amount ) AS 平均給与 FROM
(
  SELECT
    EmployeeID
  , PayDate
  , SUBSTR(CAST( PayDate AS VARCHAR ), 1, 7)
  AS 年月
  , Amount
  FROM
    Salary
  WHERE
    SUBSTR(CAST( PayDate AS VARCHAR ), 1, 4) = '2007'
) AS s
JOIN
  BelongTo AS b
ON s.EmployeeID = b.EmployeeID
  AND s.PayDate >= b.StartDate
  AND s.PayDate <
    (
      CASE
        WHEN b.EndDate IS NULL THEN '9999-12-31'
        ELSE b.EndDate
      END
    )
GROUP BY
年月
;

--  年月   |      平均給与
-- ---------+---------------------
--  2007-01 | 254285.714285714286
--  2007-02 | 254285.714285714286
--  2007-03 | 254285.714285714286
--  2007-04 | 262272.727272727273
--  2007-05 | 262272.727272727273
--  2007-06 | 262272.727272727273
--  2007-07 | 262272.727272727273
--  2007-08 | 262272.727272727273

-- STEP3 --
SELECT
  d.DepartmentID
, d.DepartmentName
, 年月
, AVG( Amount ) AS 平均給与 FROM
(
  SELECT
    EmployeeID
  , PayDate
  , SUBSTR(CAST( PayDate AS VARCHAR ), 1, 7)
  AS 年月
  , Amount
  FROM
    Salary
  WHERE
    SUBSTR(CAST( PayDate AS VARCHAR ), 1, 4) = '2007'
) AS s
JOIN
  BelongTo AS b
ON s.EmployeeID = b.EmployeeID
  AND s.PayDate >= b.StartDate
  AND s.PayDate <
    (
      CASE
        WHEN b.EndDate IS NULL THEN '9999-12-31'
        ELSE b.EndDate
      END
    )
JOIN
  Departments AS d
ON
  b.DepartmentID = d.DepartmentID
GROUP BY
  d.DepartmentID
, d.DepartmentName , 年月
ORDER BY
  d.DepartmentID
, d.DepartmentName , 年月
;

--  departmentid | departmentname |  年月   |      平均給与
-- --------------+----------------+---------+---------------------
--             1 | 営業部         | 2007-01 | 320000.000000000000
--             1 | 営業部         | 2007-02 | 320000.000000000000
--             1 | 営業部         | 2007-03 | 320000.000000000000
--             1 | 営業部         | 2007-04 | 340000.000000000000
